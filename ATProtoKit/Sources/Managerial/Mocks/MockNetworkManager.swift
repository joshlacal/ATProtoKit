//
//  MockNetworkManager.swift
//
//
//  Created by Josh LaCalamito on 4/22/24.
//

import Foundation

public actor MockNetworkManager: NetworkManaging {
    
    func setMiddlewareService(middlewareService: MiddlewareService) async {
        return
    }
    
    
    public init() {}
    
    public func createURLRequest(endpoint: String, method: String, headers: [String: String], body: Data?, queryItems: [URLQueryItem]?) async throws -> URLRequest {
        var url = URL(string: "https://example.com")!.appendingPathComponent(endpoint)
        if let queryItems = queryItems, !queryItems.isEmpty {
            var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
            components?.queryItems = queryItems
            if let urlFromComponents = components?.url {
                url = urlFromComponents
            }
        }

        var request = URLRequest(url: url)
        request.httpMethod = method

        headers.forEach { request.setValue($1, forHTTPHeaderField: $0) }

        if let body = body {
            request.httpBody = body
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        }

        return request
    }

     func refreshSessionToken(refreshToken: String, tokenManager: any TokenManaging) async throws -> Bool {
        // Simulating token validation logic
        if refreshToken == "validToken" {
            try await tokenManager.saveTokens(accessJwt: "newAccessJwt", refreshJwt: "newRefreshJwt")
            return true
        } else {
            return false
        }
    }

func performRequest(_ request: URLRequest, retryCount: Int, duringInitialSetup: Bool) async throws -> (Data, HTTPURLResponse) {

        // Determine the response based on the URLRequest details (e.g., URL, HTTPMethod)
        switch request.url?.path {
        case "/xrpc/app.bsky.feed.getTimeline":
            // Load the respective JSON file
            let data = loadMockData(forResource: "timelineresponse", ofType: "json")
            return (data, HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!)
        case "/xrpc/app.bsky.feed.getPostThread":
            // Load the respective JSON file
            let data = loadMockData(forResource: "postthreadresponse", ofType: "json")
            return (data, HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!)
        case "/xrpc/com.atproto.server.createSession":
            // Load the respective JSON file
            let data = loadMockData(forResource: "createsessionresponse", ofType: "json")
            return (data, HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!)
        default:
            let errorData = "{}".data(using: .utf8)!
            return (errorData, HTTPURLResponse(url: request.url!, statusCode: 404, httpVersion: nil, headerFields: nil)!)
        }
    }

    private func loadMockData(forResource resource: String, ofType type: String) -> Data {
        guard let path = Bundle.main.path(forResource: resource, ofType: type),
              let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else {
            return Data()
        }
        return data
    }
}
