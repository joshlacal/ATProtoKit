//
//  Middleware.swift
//  ATProtoKit
//
//  Created by Josh LaCalamito on 4/21/24.
//

import Foundation

protocol NetworkMiddleware: AnyActor {
    func prepare(request: URLRequest) async throws -> URLRequest
    func handle(response: HTTPURLResponse, data: Data, request: URLRequest) async throws -> (HTTPURLResponse, Data)
}

import Foundation
import os

actor AuthenticationMiddleware: NetworkMiddleware {
    private var middlewareService: MiddlewareService

    init(middlewareService: MiddlewareService) {
        self.middlewareService = middlewareService
    }

    func prepare(request: URLRequest) async throws -> URLRequest {
        LogManager.logDebug("AuthenticationMiddleware - Preparing request for URL: \(request.url?.absoluteString ?? "unknown")")
        if !(await middlewareService.isSessionValid()) {
            try await middlewareService.validateAndRefreshSession()
        }
        LogManager.logDebug("Fetching token for request to \(request.url?.absoluteString ?? "unknown")")
        let token = try await middlewareService.getAccessToken()
        LogManager.logDebug("Token fetched and applied: \(token.prefix(10))")
        var modifiedRequest = request
        modifiedRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        LogManager.logDebug("AuthenticationMiddleware - Authorization header added.")
        return modifiedRequest
    }
    
    func handle(response: HTTPURLResponse, data: Data, request: URLRequest) async throws -> (HTTPURLResponse, Data) {
        LogManager.logDebug("AuthenticationMiddleware - Handling response with status code: \(response.statusCode)")
        if response.statusCode == 401 {
            LogManager.logDebug("AuthenticationMiddleware - 401 Unauthorized response received, attempting to refresh token.")
            try await middlewareService.validateAndRefreshSession()
            
            // Fetch the refreshed access token and retry the request
            let refreshedToken = try await middlewareService.getAccessToken()
            var retryRequest = request
            retryRequest.setValue("Bearer \(refreshedToken)", forHTTPHeaderField: "Authorization")
            
            // Perform the request again with the refreshed token
            let (retryData, retryResponse) = try await URLSession.shared.data(for: retryRequest)
            return (retryResponse as! HTTPURLResponse, retryData)
        }
        return (response, data)
    }
}




actor LoggingMiddleware: NetworkMiddleware {
    func prepare(request: URLRequest) -> URLRequest {
        // Log the request
        print("Request URL: \(request.url?.absoluteString ?? "Unknown URL")")
        print("HTTP Method: \(request.httpMethod ?? "No Method")")
        return request
    }

    func handle(response: HTTPURLResponse, data: Data, request: URLRequest) -> (HTTPURLResponse, Data) {
        // Log the response
        print("Response Status Code: \(response.statusCode)")
        return (response, data)
    }
}
