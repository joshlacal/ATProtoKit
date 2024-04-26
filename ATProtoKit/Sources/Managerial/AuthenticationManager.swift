//
//  AuthenticationManager.swift
//  ATProtoKit
//
//  Created by Josh LaCalamito on 4/21/24.
//

import Foundation

public protocol AuthenticationDelegate: AnyActor {
    func authenticationRequired(client: ATProtoClient) async
}

 protocol AuthenticationManaging: AnyActor, SessionDelegate {
    func createSession(identifier: String, password: String) async throws
    func reauthenticate() async throws
}

actor AuthenticationManager: AuthenticationManaging, SessionDelegate {
    private var authService: AuthenticationService
    weak var client: ATProtoClient?

    init(authService: AuthenticationService, client: ATProtoClient) {
        self.authService = authService
        self.client = client
    }

    func createSession(identifier: String, password: String) async throws {
        do {
            try await authService.createSession(identifier: identifier, password: password)
        } catch {
            print("Failed to create session: \(error)")
            throw error
        }
    }

    func reauthenticate() async throws {
        guard let client = client else {
            print("Client is nil, cannot reauthenticate.")
            return
        }

        do {
            let success = try await authService.refreshTokenIfNeeded()
            if !success {
                await client.authDelegate?.authenticationRequired(client: client)
            }
        } catch {
            print("Reauthentication failed: \(error)")
            await client.authDelegate?.authenticationRequired(client: client)
            throw error
        }
    }

    func sessionRequiresReauthentication(sessionManager: SessionManager) async throws {
        try await reauthenticate()
    }
}
