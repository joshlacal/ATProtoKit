//
//  SessionManager.swift
//  ATProtoKit
//
//  Created by Josh LaCalamito on 4/21/24.
//

import Foundation

protocol SessionManaging {
    func hasValidSession() async -> Bool
    func initializeIfNeeded() async throws
    func clearSession() async
}

actor SessionManager: SessionManaging {
    private var tokenManager: TokenManaging
    private weak var authManager: AuthenticationManaging?
    private var sessionState: SessionState = .uninitialized

    init(tokenManager: TokenManaging) {
        self.tokenManager = tokenManager
    }
    
    func setAuthManager(_ manager: AuthenticationManaging) {
        self.authManager = manager
    }

    public enum SessionState {
        case uninitialized
        case initializing
        case valid
        case expired
    }

    public func initializeIfNeeded() async throws {
        switch sessionState {
        case .valid:
            print("Session is already valid.")
            return
        case .initializing:
            print("Session initialization is in progress...")
            return
        case .uninitialized, .expired:
            sessionState = .initializing
            try await validateAndRefreshTokens()
        }
    }

    private func validateAndRefreshTokens() async throws {
        if await !(tokenManager.hasValidTokens()) {
            print("No valid tokens. Need to authenticate.")
            try await authManager?.reauthenticate()
        } else {
            print("Tokens are valid. Session is now valid.")
            sessionState = .valid
        }
    }
    
    public func hasValidSession() async -> Bool {
        return sessionState == .valid
    }

    public func clearSession() async {
        do {
            try await tokenManager.deleteTokens()
            sessionState = .uninitialized
            print("Session cleared successfully.")
        } catch {
            print("Failed to clear tokens: \(error)")
        }
    }
}
