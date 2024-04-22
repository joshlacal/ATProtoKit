//
//  AuthenticationManager.swift
//  ATProtoKit
//
//  Created by Josh LaCalamito on 4/21/24.
//

import Foundation

public protocol AuthenticationManaging: AnyActor {
    func createSession(identifier: String, password: String) async throws
    func reauthenticate() async throws
}

protocol ConfigurationManaging: AnyActor {
    func updateUserConfiguration(did: String, serviceEndpoint: String) async throws
}

public protocol AuthenticationDelegate: AnyActor {
    func authenticationRequired(client: ATProtoClient)
}

actor AuthenticationManager: AuthenticationManaging {
    private var networkManager: NetworkServicing
    private var tokenManager: TokenManaging
    private var configManager: ConfigurationManaging
    weak var authDelegate: AuthenticationDelegate?
    weak var client: ATProtoClient?

    init(networkManager: NetworkServicing, tokenManager: TokenManaging, configManager: ConfigurationManaging) {
        self.networkManager = networkManager
        self.tokenManager = tokenManager
        self.configManager = configManager
    }

    public func createSession(identifier: String, password: String) async throws {
        let endpoint = "/createSession"
        let body = try JSONEncoder().encode(ComAtprotoServerCreateSession.Input(identifier: identifier, password: password))
        let headers = ["Content-Type": "application/json"]
        let request = try await networkManager.createURLRequest(endpoint: endpoint, method: "POST", headers: headers, body: body, queryItems: nil)
        
        let (data, response) = try await networkManager.performRequest(request)
        guard response.statusCode == 200, let sessionOutput = try? JSONDecoder().decode(ComAtprotoServerCreateSession.Output.self, from: data) else {
            throw NetworkError.requestFailed
        }
        
        try await tokenManager.saveTokens(accessJwt: sessionOutput.accessJwt, refreshJwt: sessionOutput.refreshJwt)
        if let serviceEndpoint = sessionOutput.didDoc?.service.first?.serviceEndpoint {
            try await configManager.updateUserConfiguration(did: sessionOutput.did, serviceEndpoint: serviceEndpoint)
        }
    }

    func reauthenticate() async throws {
        // Triggered if the token refresh fails and a new session is needed
        if await !tokenManager.hasValidTokens() {
            // Since password is not stored, delegate must require user to re-login
            guard let client = client else {
                print("Client is nil, cannot call authenticationRequired.")
                return
            }
            authDelegate?.authenticationRequired(client: client)
        }
    }
}
