//
//  MiddlewareService.swift
//  ATProtoKit
//
//  Created by Josh LaCalamito on 4/24/24.
//

import Foundation

final class MiddlewareService: @unchecked Sendable {
    private var sessionManager: SessionManaging
    private var tokenManager: TokenManaging
    private var authDelegate: AuthenticationDelegate?
    private weak var client: ATProtoClient?

    init(sessionManager: SessionManaging, tokenManager: TokenManaging, authDelegate: AuthenticationDelegate?, client: ATProtoClient?) {
        self.sessionManager = sessionManager
        self.tokenManager = tokenManager
        self.authDelegate = authDelegate
        self.client = client
    }
    
    func isSessionValid() async -> Bool {
        return await sessionManager.hasValidSession()
    }

    func validateAndRefreshSession() async throws {
        guard await sessionManager.hasValidSession() == false else {
            LogManager.logDebug("MiddlewareService - Session already valid.")
            return
        }
        LogManager.logDebug("MiddlewareService - Session validation and refresh needed.")
        try await sessionManager.initializeIfNeeded()
    }

    func getAccessToken() async throws -> String {
        LogManager.logDebug("MiddlewareService - Fetching access token.")
        guard let token = await tokenManager.fetchAccessToken() else {
            LogManager.logError("MiddlewareService - No access token available.")
            throw NetworkError.authenticationRequired
        }
        if await tokenManager.isTokenExpired(token: token) {
            try await validateAndRefreshSession()
            guard let refreshedToken = await tokenManager.fetchAccessToken() else {
                throw NetworkError.authenticationRequired
            }
            return refreshedToken
        }
        LogManager.logDebug("MiddlewareService - Access token fetched successfully.")
        return token
    }
    func handleAuthenticationRequired() async {
        await authDelegate?.authenticationRequired(client: client!)
    }
}
