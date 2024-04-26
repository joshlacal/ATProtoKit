//
//  AuthenticationService.swift
//  ATProtoKit
//
//  Created by Josh LaCalamito on 4/24/24.
//

import Foundation

actor AuthenticationService {
    private var networkManager: NetworkManaging
    private var tokenManager: TokenManaging
    
    init(networkManager: NetworkManaging, tokenManager: TokenManaging) {
        self.networkManager = networkManager
        self.tokenManager = tokenManager
    }
    
    func createSession(identifier: String, password: String) async throws {
        LogManager.logInfo("AuthenticationService - Starting session creation for identifier: \(identifier)")
        let endpoint = "/com.atproto.server.createSession"
        let body = try JSONEncoder().encode(ComAtprotoServerCreateSession.Input(identifier: identifier, password: password))
        let headers = ["Content-Type": "application/json"]
        let request = try await networkManager.createURLRequest(endpoint: endpoint, method: "POST", headers: headers, body: body, queryItems: nil)

        // Perform the request without applying middleware
        let (data, response) = try await networkManager.performRequest(request, retryCount: 0, duringInitialSetup: true)
        LogManager.logDebug("AuthenticationService - Request performed, received status code: \(response.statusCode)")
        
        guard response.statusCode == 200 else {
            LogManager.logError("AuthenticationService - Failed to create session, received status code: \(response.statusCode)")
            throw NetworkError.requestFailed
        }
        let sessionOutput = try JSONDecoder().decode(ComAtprotoServerCreateSession.Output.self, from: data)
        LogManager.logInfo("AuthenticationService - Session created successfully, tokens received.")
        
        try await tokenManager.saveTokens(accessJwt: sessionOutput.accessJwt, refreshJwt: sessionOutput.refreshJwt)
        LogManager.logInfo("AuthenticationService - Tokens saved successfully.")
    }
    
    enum AuthenticationError: Error {
        case tokenMissingOrCorrupted
    }
    
    func refreshTokenIfNeeded() async throws -> Bool {
        LogManager.logInfo("AuthenticationService - Checking if token refresh is needed.")
        guard let refreshToken = await tokenManager.fetchRefreshToken(),
              let payload = await tokenManager.decodeJWT(token: refreshToken) else {
            LogManager.logError("AuthenticationService - Refresh token missing or corrupted.")
            throw AuthenticationError.tokenMissingOrCorrupted
        }

        LogManager.logDebug("AuthenticationService - Refresh token payload decoded, checking expiration.")
        if payload.expirationDate.timeIntervalSinceNow < 300 {  // 5 minutes before expiry
            LogManager.logInfo("AuthenticationService - Token nearing expiration, attempting to refresh.")
            do {
                let refreshed = try await networkManager.refreshSessionToken(refreshToken: refreshToken, tokenManager: tokenManager)
                if refreshed {
                    LogManager.logInfo("AuthenticationService - Token refreshed successfully.")
                    return true
                } else {
                    LogManager.logError("AuthenticationService - Token refresh failed.")
                    return false
                }
            } catch {
                LogManager.logError("AuthenticationService - Error occurred during token refresh: \(error)")
                throw error
            }
        }

        LogManager.logInfo("AuthenticationService - No need to refresh token yet.")
        return false
    }

}
