//
//  MiddlewareService.swift
//  ATProtoKit
//
//  Created by Josh LaCalamito on 4/24/24.
//

import Foundation

final class MiddlewareService: Sendable {
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
    
    func updateTokens(accessJwt: String, refreshJwt: String) async throws {
        do {
            try await tokenManager.saveTokens(accessJwt: accessJwt, refreshJwt: refreshJwt)
            LogManager.logDebug("MiddlewareService - Tokens updated successfully.")
        } catch {
            LogManager.logError("MiddlewareService - Failed to update tokens: \(error)")
            throw error
        }
    }

    func getAccessToken() async throws -> String {
        LogManager.logDebug("MiddlewareService - Fetching access token.")
        guard let token = await tokenManager.fetchAccessToken(),
              !(await tokenManager.isTokenExpired(token: token)) else {
            LogManager.logInfo("MiddlewareService - Access token expired or not available, refreshing session.")
            try await validateAndRefreshSession()
            guard let refreshedToken = await tokenManager.fetchAccessToken() else {
                throw NetworkError.authenticationRequired
            }
            return refreshedToken
        }
        return token
    }

    func getRefreshToken() async throws -> String {
        LogManager.logDebug("MiddlewareService - Fetching refresh token.")
        guard let token = await tokenManager.fetchRefreshToken() else {
            LogManager.logError("MiddlewareService - No refresh token available.")
            throw NetworkError.authenticationRequired
        }
        if await tokenManager.isTokenExpired(token: token) {
            try await validateAndRefreshSession()
            guard let refreshedToken = await tokenManager.fetchRefreshToken() else {
                throw NetworkError.authenticationRequired
            }
            return refreshedToken
        }
        LogManager.logDebug("MiddlewareService - Refresh token fetched successfully.")
        return token
    }
    func handleAuthenticationRequired() async {
        await authDelegate?.authenticationRequired(client: client!)
    }
}
