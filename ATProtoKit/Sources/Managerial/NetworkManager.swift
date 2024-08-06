//
//  NetworkManager.swift
//  ATProtoKit
//
//  Created by Josh LaCalamito on 4/21/24.
//

import Foundation
import ZippyJSON

 protocol NetworkManaging: AnyActor {
     func performRequest(_ request: URLRequest, retryCount: Int, duringInitialSetup: Bool) async throws -> (Data, HTTPURLResponse)
    func createURLRequest(endpoint: String, method: String, headers: [String: String], body: Data?, queryItems: [URLQueryItem]?) async throws -> URLRequest
    func refreshSessionToken(refreshToken: String, tokenManager: TokenManaging) async throws -> Bool
    func setMiddlewareService(middlewareService: MiddlewareService) async
}


public actor NetworkManager: NetworkManaging, BaseURLUpdateDelegate {
    private var baseURL: URL
    private let configurationManager: ConfigurationManager
    private let maxRetryLimit: Int = 3

    private var middlewares: [NetworkMiddleware] = []
    var middlewareService: MiddlewareService?
    private var isMiddlewareConfigured = false

    init(baseURL: URL, configurationManager: ConfigurationManager) {
        self.baseURL = baseURL
        self.configurationManager = configurationManager
    }
    
     func setMiddlewareService(middlewareService: MiddlewareService) {
        self.middlewareService = middlewareService
        configureMiddlewares()
        isMiddlewareConfigured = true

    }
    
    func baseURLDidUpdate(_ newBaseURL: URL) async {
        self.baseURL = newBaseURL
    }

    private func configureMiddlewares() {
        if let middlewareService = middlewareService {
            let authMiddleware = AuthenticationMiddleware(middlewareService: middlewareService, configurationManager: configurationManager)
            let loggingMiddleware = LoggingMiddleware()
            middlewares.append(loggingMiddleware)
            middlewares.append(authMiddleware)
        } else {
            // Handle the case where middlewareService is nil, maybe log an error or set up a fallback
            print("Error: MiddlewareService is nil")
        }
    }


    public func createURLRequest(endpoint: String, method: String, headers: [String: String], body: Data?, queryItems: [URLQueryItem]?) async throws -> URLRequest {
        var url = baseURL.appendingPathComponent("xrpc").appendingPathComponent(endpoint)
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
        
        if let authHeader = headers["Authorization"] {
            LogManager.logDebug("Using Authorization Header: \(authHeader.prefix(30))")
        }

        if body != nil {
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }
        request.httpBody = body

        return request
    }

    public func performRequest(_ request: URLRequest, retryCount: Int = 0, duringInitialSetup: Bool = false) async throws -> (Data, HTTPURLResponse) {
        
        while !isMiddlewareConfigured {
            await Task.yield()
        }

        LogManager.logDebug("NetworkManager - Preparing to perform request to \(request.url?.absoluteString ?? "unknown URL") with retryCount: \(retryCount)")
        LogManager.logRequest(request)

        // Apply middleware conditionally
        var modifiedRequest = request
        if !duringInitialSetup {
            for middleware in middlewares {
                LogManager.logDebug("Applying middleware: \(type(of: middleware))")
                modifiedRequest = try await middleware.prepare(request: modifiedRequest)
            }
        } else {
            LogManager.logDebug("Skipping middleware during initial setup.")
        }
        LogManager.logDebug("NetworkManager - Middleware modified request to \(request.url?.absoluteString ?? "unknown URL") with retryCount: \(retryCount)")
        LogManager.logRequest(modifiedRequest)


        do {
            // Perform the actual network request
            let (data, response) = try await URLSession.shared.data(for: modifiedRequest)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.requestFailed  
            }

            LogManager.logDebug("NetworkManager - Received HTTP response with status code: \(httpResponse.statusCode) from \(httpResponse.url?.absoluteString ?? "unknown URL")")
            LogManager.logResponse(httpResponse, data: data)

            // Process the response through each middleware
            var finalData = data
            var finalResponse = httpResponse
            for middleware in middlewares.reversed() {
                (finalResponse, finalData) = try await middleware.handle(response: finalResponse, data: finalData, request: modifiedRequest)
                LogManager.logDebug("NetworkManager - Middleware \(type(of: middleware)) processed the response.")
            }
            LogManager.logResponse(finalResponse, data: finalData)


            // Retry logic for 401 Unauthorized response
            if finalResponse.statusCode == 401 && retryCount < maxRetryLimit {
                LogManager.logDebug("NetworkManager - Received 401 status, attempting to retry request. Retry attempt: \(retryCount + 1)")
                return try await performRequest(modifiedRequest, retryCount: retryCount + 1)  // Ensuring modifiedRequest is used for retry
            }

            LogManager.logDebug("NetworkManager - Request to \(finalResponse.url?.absoluteString ?? "unknown URL") completed successfully with status code \(finalResponse.statusCode)")
            return (finalData, finalResponse)
        } catch let error {
            LogManager.logError("NetworkManager - Request to \(modifiedRequest.url?.absoluteString ?? "unknown URL") failed with error: \(error.localizedDescription)")
            throw error
        }
    }



     func refreshSessionToken(refreshToken: String, tokenManager: TokenManaging) async throws -> Bool {
        let endpoint = "/xrpc/com.atproto.server.refreshSession"
        let url = baseURL.appendingPathComponent(endpoint)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Bearer \(refreshToken)", forHTTPHeaderField: "Authorization")

        // Perform the network request
        let (responseData, response) = try await performRequest(request, retryCount: 0, duringInitialSetup: true)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.unknownError
        }
         
         LogManager.logDebug("NetworkManager - Received response for token refresh with status code: \(httpResponse.statusCode)")

        if httpResponse.statusCode == 200 {
            // Decode the response using your specific output structure
            let decoder = ZippyJSONDecoder()
            guard let tokenResponse = try? decoder.decode(ComAtprotoServerRefreshSession.Output.self, from: responseData) else {
                throw NetworkError.decodingError
            }
            
            
            // Update stored tokens using the token manager
            try await tokenManager.saveTokens(accessJwt: tokenResponse.accessJwt, refreshJwt: tokenResponse.refreshJwt)
            try await configurationManager.updateUserConfiguration(did: tokenResponse.did, serviceEndpoint: tokenResponse.didDoc?.service.first?.serviceEndpoint ?? baseURL.absoluteString)
            return true
        } else if httpResponse.statusCode == 401 {
            LogManager.logError("NetworkManager - Refresh token is invalid or expired")
            return false
        } else {
            LogManager.logError("NetworkManager - Failed to refresh token with status code: \(httpResponse.statusCode)")

            throw NetworkError.responseError(statusCode: httpResponse.statusCode)
        }
    }

    
    
    
    
    
    
    
    
    
    private func prepareRequestWithMiddleware(_ request: URLRequest) async throws -> URLRequest {
        var modifiedRequest = request
        // Assume middleware array
        for middleware in middlewares {
            modifiedRequest = try await middleware.prepare(request: modifiedRequest)
        }
        return modifiedRequest
    }

    
}
