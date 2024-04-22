//
//  Middleware.swift
//  ATProtoKit
//
//  Created by Josh LaCalamito on 4/21/24.
//

import Foundation

protocol NetworkMiddleware: AnyActor {
    func prepare(request: URLRequest) async -> URLRequest
    func handle(response: HTTPURLResponse, data: Data) async -> (HTTPURLResponse, Data)
}

actor AuthenticationMiddleware: NetworkMiddleware {
    private var accessToken: String?

    init(token: String?) {
        self.accessToken = token
    }

    func prepare(request: URLRequest) -> URLRequest {
        guard let token = accessToken else { return request }
        var modifiedRequest = request
        modifiedRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        return modifiedRequest
    }

    func handle(response: HTTPURLResponse, data: Data) -> (HTTPURLResponse, Data) {
        return (response, data) // Basic implementation, could handle token expiration
    }
}

actor LoggingMiddleware: NetworkMiddleware {
    func prepare(request: URLRequest) -> URLRequest {
        // Log the request
        print("Request URL: \(request.url?.absoluteString ?? "Unknown URL")")
        print("HTTP Method: \(request.httpMethod ?? "No Method")")
        return request
    }

    func handle(response: HTTPURLResponse, data: Data) -> (HTTPURLResponse, Data) {
        // Log the response
        print("Response Status Code: \(response.statusCode)")
        return (response, data)
    }
}
