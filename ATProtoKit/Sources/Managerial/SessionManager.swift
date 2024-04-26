//
//  SessionManager.swift
//  ATProtoKit
//
//  Created by Josh LaCalamito on 4/21/24.
//

import Foundation

protocol SessionManaging: AnyActor {
    func hasValidSession() async -> Bool
    func initializeIfNeeded() async throws
    func clearSession() async
    func setSessionDelegate(with delegate: SessionDelegate) async
}

protocol SessionDelegate: AnyObject {
    func sessionRequiresReauthentication(sessionManager: SessionManager) async throws
}


actor SessionManager: SessionManaging {
    private var tokenManager: TokenManaging
    private var authService: AuthenticationService
    private var sessionState: SessionState = .uninitialized
    weak var sessionDelegate: SessionDelegate?

    init(tokenManager: TokenManaging, authService: AuthenticationService) {
        self.tokenManager = tokenManager
        self.authService = authService
    }
    
    func setSessionDelegate(with delegate: SessionDelegate) {
        self.sessionDelegate = delegate
    }

    public enum SessionState: Equatable {
        case uninitialized
        case initializing
        case valid
        case expired
        case failed(Error)

        public static func == (lhs: SessionState, rhs: SessionState) -> Bool {
            switch (lhs, rhs) {
            case (.uninitialized, .uninitialized),
                 (.initializing, .initializing),
                 (.valid, .valid),
                 (.expired, .expired):
                return true
            case (.failed(let lhsError), .failed(let rhsError)):
                return lhsError.localizedDescription == rhsError.localizedDescription
            default:
                return false
            }
        }
    }

    public enum SessionError: Error {
        case tokenRefreshFailed
        case tokenUnavailable
    }

    private var initializationTask: Task<Void, Error>?

    func initializeIfNeeded() async throws {
        LogManager.logDebug("SessionManager - Initializing session if needed. Current state: \(sessionState)")
        guard sessionState != .valid else {
            LogManager.logDebug("SessionManager - Session already valid, no initialization needed.")
            return
        }

        if sessionState == .initializing {
            LogManager.logDebug("SessionManager - Waiting for ongoing session initialization to complete.")
            try await initializationTask?.value
            return
        }

        sessionState = .initializing
        initializationTask = Task {
            do {
                try await validateAndRefreshTokens()
                sessionState = .valid
            } catch {
                sessionState = .failed(error)
                LogManager.logError("SessionManager - Initialization failed with error: \(error)")
                throw error
            }
        }
        try await initializationTask?.value
    }

    private func validateAndRefreshTokens() async throws {
        let tokensValid = await tokenManager.hasValidTokens()
        if !tokensValid {
            LogManager.logInfo("Tokens are invalid, attempting refresh.")
            try await handleTokenRefresh()
        } else {
            LogManager.logInfo("Tokens are valid, session marked as valid.")
            sessionState = .valid
        }
    }

    private func handleTokenRefresh() async throws {
        if await tokenManager.shouldRefreshTokens() {
            do {
                let refreshed = try await authService.refreshTokenIfNeeded()
                if !refreshed {
                    LogManager.logError("Token refresh attempted but failed.")
                    sessionState = .expired
                    throw SessionError.tokenRefreshFailed
                }
            } catch {
                LogManager.logError("Error during token refresh: \(error)")
                sessionState = .failed(error)
                throw error
            }
        } else {
            LogManager.logInfo("Refresh not required or possible, reauthentication needed.")
            sessionState = .expired
            throw SessionError.tokenUnavailable
        }
    }

    public func hasValidSession() async -> Bool {
        return sessionState == .valid
    }

    public func clearSession() async {
        LogManager.logInfo("Clearing session")
        do {
            try await tokenManager.deleteTokens()
            sessionState = .uninitialized
            LogManager.logInfo("Session cleared successfully")
        } catch {
            LogManager.logError("Failed to clear tokens: \(error)")
        }
    }
}
