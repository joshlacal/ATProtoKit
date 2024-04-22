//
//  NetworkManager.swift
//  ATProtoKit
//
//  Created by Josh LaCalamito on 4/21/24.
//

import Foundation
import ZippyJSON

protocol NetworkServicing: AnyActor {
    func performRequest(_ request: URLRequest) async throws -> (Data, HTTPURLResponse)
    func createURLRequest(endpoint: String, method: String, headers: [String: String], body: Data?, queryItems: [URLQueryItem]?) async throws -> URLRequest
    func refreshSessionToken(refreshToken: String, tokenManager: TokenManaging) async throws -> Bool
}


actor NetworkManager: NetworkServicing {
    private var middlewares: [NetworkMiddleware] = []
    private let baseURL: URL

    init(baseURL: URL) {
        self.baseURL = baseURL
    }

    func createURLRequest(endpoint: String, method: String, headers: [String: String], body: Data?, queryItems: [URLQueryItem]?) async throws -> URLRequest {
        var url = baseURL.appendingPathComponent(endpoint)
        if let queryItems = queryItems, !queryItems.isEmpty {
            var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
            components?.queryItems = queryItems
            if let urlFromComponents = components?.url {
                url = urlFromComponents
            }
        }

        var request = URLRequest(url: url)
        request.httpMethod = method

        for (headerField, headerValue) in headers {
            request.setValue(headerValue, forHTTPHeaderField: headerField)
        }

        if body != nil {
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        request.httpBody = body

        return request
    }

    func performRequest(_ request: URLRequest) async throws -> (Data, HTTPURLResponse) {
        var modifiedRequest = request
        // Apply each middleware in sequence
        for middleware in middlewares {
            modifiedRequest = await middleware.prepare(request: modifiedRequest)
        }

        let (data, response) = try await URLSession.shared.data(for: modifiedRequest)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.responseError(statusCode: 0) // Provide more specific error handling
        }

        // Process the response through each middleware in sequence
        var finalData = data
        var finalResponse = httpResponse
        for middleware in middlewares {
            (finalResponse, finalData) = await middleware.handle(response: finalResponse, data: finalData)
        }

        return (finalData, finalResponse)
    }

    func refreshSessionToken(refreshToken: String, tokenManager: TokenManaging) async throws -> Bool {
        let endpoint = "/xrpc/com.atproto.server.refreshSession"
        let url = baseURL.appendingPathComponent(endpoint)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Bearer \(refreshToken)", forHTTPHeaderField: "Authorization")

        // Perform the network request
        let (responseData, response) = try await performRequest(request)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.unknownError
        }

        if httpResponse.statusCode == 200 {
            // Decode the response using your specific output structure
            let decoder = ZippyJSONDecoder()
            guard let tokenResponse = try? decoder.decode(ComAtprotoServerRefreshSession.Output.self, from: responseData) else {
                throw NetworkError.decodingError
            }

            // Update stored tokens using the token manager
            try await tokenManager.saveTokens(accessJwt: tokenResponse.accessJwt, refreshJwt: tokenResponse.refreshJwt)
            return true
        } else if httpResponse.statusCode == 401 {
            // Handle token expiration or invalid token error
            return false
        } else {
            throw NetworkError.responseError(statusCode: httpResponse.statusCode)
        }
    }

    private func prepareRequestWithMiddleware(_ request: URLRequest) async -> URLRequest {
        var modifiedRequest = request
        // Assume middleware array
        for middleware in middlewares {
            modifiedRequest = await middleware.prepare(request: modifiedRequest)
        }
        return modifiedRequest
    }

    
}
