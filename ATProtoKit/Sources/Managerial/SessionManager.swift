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

protocol SessionDelegate: AnyActor {
    func sessionRequiresReauthentication(sessionManager: SessionManager) async throws
}


actor SessionManager: SessionManaging, TokenDelegate {
    private var tokenManager: TokenManaging
    private var authService: AuthenticationService
    private var sessionState: SessionState = .uninitialized
    var sessionDelegate: SessionDelegate?

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
        switch sessionState {
        case .valid:
            LogManager.logDebug("Session already valid.")
            return
        case .failed(let error):
            LogManager.logDebug("Previous initialization failed, retrying. Error: \(error)")
            fallthrough
        case .uninitialized, .initializing, .expired:
            try await refreshTokenFlow()
        }
    }

    private func refreshTokenFlow() async throws {
        // Use a serial task to avoid race conditions
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

    // Checks token validity and triggers a refresh if needed.
    private func validateAndRefreshTokens() async throws {
        if !(await tokenManager.hasValidTokens()) {
            try await handleTokenRefresh()
        } else {
            sessionState = .valid
        }
    }

    // Refreshes tokens using authService and updates the state based on success or failure.
    private func handleTokenRefresh() async throws {
        if await tokenManager.shouldRefreshTokens() {
            do {
                let refreshed = try await authService.refreshTokenIfNeeded()
                if refreshed {
                    sessionState = .valid
                } else {
                    sessionState = .expired
                    throw SessionError.tokenRefreshFailed
                }
            } catch {
                sessionState = .failed(error)
                throw error
            }
        } else {
            sessionState = .expired
            throw SessionError.tokenUnavailable
        }
    }


    public func hasValidSession() async -> Bool {
        return sessionState == .valid
    }
    
    func tokenDidUpdate() async {
        sessionState = await tokenManager.hasValidTokens() ? .valid : .expired
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
