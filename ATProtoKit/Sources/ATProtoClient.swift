//
//  ATProtoClient.swift
//  ATProtoKit
//
//  Created by Josh LaCalamito on 1/19/24.
//

import Foundation
import ZippyJSON

public protocol AuthenticationDelegate: AnyObject {
    func authenticationRequired(client: ATProtoClient)
}

enum APIError: String {
    case expiredToken = "ExpiredToken"
}

public class ATProtoClient {
    public var baseURL: URL
    public var identifier: String?
    private var password: String?
    internal var accessJwt: String?
    internal var refreshJwt: String?
    public var handle: String?
    public var did: String?
    public var didDoc: DIDDocument?
    public var email: String?
    public var emailConfirmed: Bool?
    weak var authDelegate: AuthenticationDelegate?

    public init(baseURL: URL) {
        self.baseURL = baseURL
    }

    public func setBaseURL(_ url: URL) {
        baseURL = url
    }

    public func setCredentials(identifier: String, password: String) {
        self.identifier = identifier
        self.password = password
    }

    public func initializeIfNeeded() async throws {
        if accessJwt == nil || refreshJwt == nil {

            accessJwt = try? KeychainManager.retrieve(key: "accessJwt")
            refreshJwt = try? KeychainManager.retrieve(key: "refreshJwt")

            // If tokens are not available or invalid, use credentials to initialize session
            if accessJwt == nil || refreshJwt == nil, let identifier = identifier, let password = password {
                print("No valid session tokens found. Creating new session.")
                try await initializeSession(identifier: identifier, password: password)
            } else {
                print("Existing session loaded from Keychain.")
            }
        }
    }

    public func initializeSession(identifier: String, password: String) async throws {
        let sessionInput = ComAtprotoServerCreateSession.Input(identifier: identifier, password: password)

        do {
            let sessionOutput = try await com.atproto.server.createSession(input: sessionInput)
            accessJwt = sessionOutput.data?.accessJwt
            refreshJwt = sessionOutput.data?.refreshJwt
            handle = sessionOutput.data?.handle
            did = sessionOutput.data?.did
            email = sessionOutput.data?.email
            emailConfirmed = sessionOutput.data?.emailConfirmed
            didDoc = sessionOutput.data?.didDoc

            if let serviceEndpoint = sessionOutput.data?.didDoc?.service.first?.serviceEndpoint {
                    updateUserBaseURL(endpoint: serviceEndpoint)
            }

            do {
                try storeSessionTokens()
            } catch {
                print("Failed to store session tokens: \(error)")
                throw error
            }

        } catch {
            print("Session creation failed: \(error)")
            throw error
        }
    }

    func updateUserBaseURL(endpoint: String) {
        let pdsURL = URL(string: endpoint)
        baseURL = pdsURL ?? baseURL
    }

    public func hasValidSession() async -> Bool {
        return accessJwt != nil
    }

    func refreshTokenIfNeeded() async throws -> Bool {
        guard let refreshJwt = refreshJwt else {
            print("No refresh token available.")
            return false
        }
        print("Attempting to refresh token.")

        let refreshUrl = baseURL.appendingPathComponent("xrpc/com.atproto.server.refreshSession")
        var request = URLRequest(url: refreshUrl)
        request.httpMethod = "POST"
        request.setValue("Bearer \(refreshJwt)", forHTTPHeaderField: "Authorization")

        let (responseData, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.unknownError
        }

        print("Response Status Code: \(httpResponse.statusCode)")
        if httpResponse.statusCode != 200 {
            if let responseString = String(data: responseData, encoding: .utf8) {
                print("Error Response: \(responseString)")
            }
        }

        if httpResponse.statusCode == 200 {
            let decoder = ZippyJSONDecoder()
            if let tokenResponse = try? decoder.decode(ComAtprotoServerRefreshSession.Output.self, from: responseData) {
                accessJwt = tokenResponse.accessJwt
                self.refreshJwt = tokenResponse.refreshJwt
                try storeSessionTokens() // Update stored tokens
                print("Token refreshed successfully.")
                return true
            } else {
                throw NetworkError.decodingError
            }
        } else if httpResponse.statusCode == 401 {
            print("Refresh token is expired or invalid.")
            // Refresh token is also expired - re-authentication needed
            return false
        } else {
            print("Failed to refresh token. HTTP Status: \(httpResponse.statusCode)")
            throw NetworkError.responseError(statusCode: httpResponse.statusCode)
        }
    }

    public func clearSession() {
        // Logic to clear session tokens and any other session-specific data
        accessJwt = nil
        refreshJwt = nil
    }

    // Helper function to log requests
    func logRequest(_ request: URLRequest) {
        print("Request URL: \(request.url?.absoluteString ?? "N/A")")
        print("Method: \(request.httpMethod ?? "N/A")")
        print("Headers: \(request.allHTTPHeaderFields ?? [:])")
        if let bodyData = request.httpBody, let bodyString = String(data: bodyData, encoding: .utf8) {
            print("Body: \(bodyString)")
        }
    }

    // Helper function to log responses
    func logResponse(_ response: HTTPURLResponse, data: Data) {
        print("Response URL: \(response.url?.absoluteString ?? "N/A")")
        print("Status Code: \(response.statusCode)")
        print("Headers: \(response.allHeaderFields)")
        if let responseString = String(data: data, encoding: .utf8) {
            print("Body: \(responseString)")
        }
    }

    public func createURLRequest(endpoint: String, method: String, headers: [String: String], body: Data?, queryItems: [URLQueryItem]? = nil) throws -> URLRequest {
        var url = baseURL.appendingPathComponent("xrpc").appendingPathComponent(endpoint)
        if let queryItems = queryItems, !queryItems.isEmpty {
            var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
            components?.queryItems = queryItems
            url = components?.url ?? url
        }

        var request = URLRequest(url: url)
        request.httpMethod = method

        // Set the 'Content-Type' header for requests with a body
        if body != nil {
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }

        // Set other headers
        headers.forEach { request.setValue($1, forHTTPHeaderField: $0) }

        request.httpBody = body

        return request
    }

    public func performRequest(_ request: URLRequest) async throws -> (Data, HTTPURLResponse) {
        logRequest(request) // Log the request details
        let (responseData, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.unknownError
        }

        if httpResponse.statusCode == 401 {
            let refreshed = try await refreshTokenIfNeeded()
            if refreshed {
                var newRequest = request
                // Ensure the 'Content-Type' header is set correctly
                if newRequest.httpBody != nil {
                    newRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
                }
                if let accessJwt = accessJwt {
                    newRequest.setValue("Bearer \(accessJwt)", forHTTPHeaderField: "Authorization")
                }
                return try await performRequest(newRequest) // Retry the request
            } else {
                authDelegate?.authenticationRequired(client: self)
                throw NetworkError.authenticationRequired
            }
        }

        logResponse(httpResponse, data: responseData) // Log the response details
        return (responseData, httpResponse)
    }

    func performRequestForData(endpoint: String, method: String, headers: [String: String] = [:], body: Data? = nil, queryItems: [URLQueryItem]? = nil) async throws -> (responseCode: Int, responseData: Data) {
        var url = baseURL.appendingPathComponent("xrpc").appendingPathComponent(endpoint)

        // Handling query items
        if let queryItems = queryItems, !queryItems.isEmpty {
            var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
            components?.queryItems = queryItems
            url = components?.url ?? url
        }

        var request = URLRequest(url: url)
        request.httpMethod = method

        // Set the 'Content-Type' header to 'application/json' if not explicitly provided in the headers parameter
        var effectiveHeaders = headers
        if effectiveHeaders["Content-Type"] == nil, body != nil {
            effectiveHeaders["Content-Type"] = "application/json"
        }

        effectiveHeaders.forEach { request.setValue($1, forHTTPHeaderField: $0) }
        request.httpBody = body

        let (responseData, response) = try await performRequest(request)
        let httpResponse = response

        return (responseCode: httpResponse.statusCode, responseData: responseData)
    }

    // General method for performing network requests
    func performNetworkRequest(
        endpoint: String,
        method: String,
        headers: [String: String],
        body: Data?,
        queryItems: [URLQueryItem]? = nil
    ) async throws -> (Data, HTTPURLResponse) {
        let request = try createURLRequest(endpoint: endpoint, method: method, headers: headers, body: body, queryItems: queryItems)
        let (responseData, httpResponse) = try await performRequest(request)
        return (responseData, httpResponse)
    }

    // Method for JSON requests
    func performJSONRequest<T: Decodable>(
        endpoint: String,
        method: String,
        jsonData: Data?,
        queryItems: [URLQueryItem]? = nil
    ) async throws -> (responseCode: Int, data: T?) {
        let headers = ["Content-Type": "application/json"]
        let (responseData, httpResponse) = try await performNetworkRequest(
            endpoint: endpoint,
            method: method,
            headers: headers,
            body: jsonData,
            queryItems: queryItems
        )

        // Decode JSON response
        let decoder = ZippyJSONDecoder()
        let decodedData = try decoder.decode(T.self, from: responseData)
        return (httpResponse.statusCode, decodedData)
    }

    public func performNetworkRequestForRawData(
        endpoint: String,
        method: String,
        headers: [String: String],
        body: Data?,
        queryItems: [URLQueryItem]? = nil
    ) async throws -> (responseCode: Int, data: Data) {
        let request = try createURLRequest(endpoint: endpoint, method: method, headers: headers, body: body, queryItems: queryItems)
        let (responseData, httpResponse) = try await performRequest(request)
        return (responseCode: httpResponse.statusCode, data: responseData)
    }

    // Method for multipart/form-data requests
    func performFormDataRequest(
        endpoint: String,
        method: String,
        formData: Data,
        queryItems: [URLQueryItem]? = nil
    ) async throws -> Int {
        let headers = ["Content-Type": "multipart/form-data"]
        // Additional header setup may be necessary depending on your API requirements
        let (_, httpResponse) = try await performNetworkRequest(
            endpoint: endpoint,
            method: method,
            headers: headers,
            body: formData,
            queryItems: queryItems
        )
        return httpResponse.statusCode
    }

    // Method for uploading raw data (blob)
    func performBlobUploadRequest(
        endpoint: String,
        method: String,
        blobData: Data,
        queryItems: [URLQueryItem]? = nil
    ) async throws -> Int {
        let headers = ["Content-Type": "application/octet-stream"]
        let (_, httpResponse) = try await performNetworkRequest(
            endpoint: endpoint,
            method: method,
            headers: headers,
            body: blobData,
            queryItems: queryItems
        )
        return httpResponse.statusCode
    }

    public func getAccessJwt() -> String? {
        return accessJwt
    }

    public func getRefreshJwt() -> String? {
        return refreshJwt
    }

    public func getHandle() -> String? {
        return handle
    }

    public func getDid() -> String? {
        return did
    }

    public func logout() async throws {
        clearSession()

        do {
            try KeychainManager.delete(key: "accessJwt")
            try KeychainManager.delete(key: "refreshJwt")
        } catch {
            print("Failed to clear tokens from Keychain: \(error)")
            throw error // Rethrow or handle as needed
        }

        DispatchQueue.main.async {
            // Update UI or perform other actions as needed
            self.authDelegate?.authenticationRequired(client: self)
        }
    }

    // MARK: Generated classes:

    public lazy var app: App = .init(parent: self)

    public class App {
        unowned let parent: ATProtoClient
        init(parent: ATProtoClient) {
            self.parent = parent
        }

        public lazy var bsky: Bsky = .init(parent: self)

        public class Bsky {
            unowned let parent: App
            init(parent: App) {
                self.parent = parent
            }

            public lazy var embed: Embed = .init(parent: self)

            public class Embed {
                unowned let parent: Bsky
                init(parent: Bsky) {
                    self.parent = parent
                }
            }

            public lazy var notification: Notification = .init(parent: self)

            public class Notification {
                unowned let parent: Bsky
                init(parent: Bsky) {
                    self.parent = parent
                }
            }

            public lazy var unspecced: Unspecced = .init(parent: self)

            public class Unspecced {
                unowned let parent: Bsky
                init(parent: Bsky) {
                    self.parent = parent
                }
            }

            public lazy var graph: Graph = .init(parent: self)

            public class Graph {
                unowned let parent: Bsky
                init(parent: Bsky) {
                    self.parent = parent
                }
            }

            public lazy var feed: Feed = .init(parent: self)

            public class Feed {
                unowned let parent: Bsky
                init(parent: Bsky) {
                    self.parent = parent
                }
            }

            public lazy var richtext: Richtext = .init(parent: self)

            public class Richtext {
                unowned let parent: Bsky
                init(parent: Bsky) {
                    self.parent = parent
                }
            }

            public lazy var actor: Actor = .init(parent: self)

            public class Actor {
                unowned let parent: Bsky
                init(parent: Bsky) {
                    self.parent = parent
                }
            }
        }
    }

    public lazy var com: Com = .init(parent: self)

    public class Com {
        unowned let parent: ATProtoClient
        init(parent: ATProtoClient) {
            self.parent = parent
        }

        public lazy var atproto: Atproto = .init(parent: self)

        public class Atproto {
            unowned let parent: Com
            init(parent: Com) {
                self.parent = parent
            }

            public lazy var temp: Temp = .init(parent: self)

            public class Temp {
                unowned let parent: Atproto
                init(parent: Atproto) {
                    self.parent = parent
                }
            }

            public lazy var identity: Identity = .init(parent: self)

            public class Identity {
                unowned let parent: Atproto
                init(parent: Atproto) {
                    self.parent = parent
                }
            }

            public lazy var admin: Admin = .init(parent: self)

            public class Admin {
                unowned let parent: Atproto
                init(parent: Atproto) {
                    self.parent = parent
                }
            }

            public lazy var label: Label = .init(parent: self)

            public class Label {
                unowned let parent: Atproto
                init(parent: Atproto) {
                    self.parent = parent
                }
            }

            public lazy var server: Server = .init(parent: self)

            public class Server {
                unowned let parent: Atproto
                init(parent: Atproto) {
                    self.parent = parent
                }
            }

            public lazy var sync: Sync = .init(parent: self)

            public class Sync {
                unowned let parent: Atproto
                init(parent: Atproto) {
                    self.parent = parent
                }
            }

            public lazy var repo: Repo = .init(parent: self)

            public class Repo {
                unowned let parent: Atproto
                init(parent: Atproto) {
                    self.parent = parent
                }
            }

            public lazy var moderation: Moderation = .init(parent: self)

            public class Moderation {
                unowned let parent: Atproto
                init(parent: Atproto) {
                    self.parent = parent
                }
            }
        }
    }
}
