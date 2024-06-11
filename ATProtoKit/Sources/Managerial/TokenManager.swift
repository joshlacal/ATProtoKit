import Foundation
import ZippyJSON

protocol TokenManaging: AnyActor {
    func deleteTokens() async throws
    func hasValidTokens() async -> Bool
    func saveTokens(accessJwt: String, refreshJwt: String) async throws
    func shouldRefreshTokens() async -> Bool
    func fetchRefreshToken() async -> String?
    func fetchAccessToken() async -> String?
    func decodeJWT(token: String) async -> JWTPayload?
    func isTokenExpired(token: String) async -> Bool
    func setDelegate(_ delegate: TokenDelegate?) async

}

protocol TokenDelegate: AnyActor {
    func tokenDidUpdate() async
}


public actor TokenManager: TokenManaging {
    private var accessJwt: String?
    private var refreshJwt: String?
    var delegate: TokenDelegate?
    
    func setDelegate(_ delegate: TokenDelegate?) {
        self.delegate = delegate
    }

    func hasValidTokens() -> Bool {
        LogManager.logDebug("TokenManager - Checking token validity.")

        guard let accessJwt = fetchAccessToken(), let refreshJwt = fetchRefreshToken() else {
            LogManager.logInfo("TokenManager - Access or Refresh Token not found.")
            return false
        }

        guard let accessPayload = decodeJWT(token: accessJwt), let refreshPayload = decodeJWT(token: refreshJwt) else {
            LogManager.logInfo("TokenManager - Unable to decode one or both JWTs.")
            return false
        }

        let currentDate = Date()
        let accessExpirationDate = accessPayload.expirationDate
        let refreshExpirationDate = refreshPayload.expirationDate

        // Log current and expiration dates
        LogManager.logDebug("TokenManager - Current date: \(currentDate)")
        LogManager.logDebug("TokenManager - Access token expiration date: \(accessExpirationDate)")
        LogManager.logDebug("TokenManager - Refresh token expiration date: \(refreshExpirationDate)")

        if accessExpirationDate > currentDate && refreshExpirationDate > currentDate {
            LogManager.logInfo("TokenManager - Tokens are valid.")
            return true
        } else {
            if accessExpirationDate <= currentDate {
                LogManager.logInfo("TokenManager - Access token is expired.")
            }
            if refreshExpirationDate <= currentDate {
                LogManager.logInfo("TokenManager - Refresh token is expired.")
            }
            LogManager.logInfo("TokenManager - One or both tokens are expired or invalid.")
            return false
        }
    }
    


    func isTokenExpired(token: String) async -> Bool {
        guard let payload = await decodeJWT(token: token) else {
            LogManager.logError("TokenManager - Failed to decode JWT token for expiration check.")
            return true // Consider the token as expired if it can't be decoded
        }
        
        let currentDate = Date()
        let expirationDate = payload.expirationDate
        
        LogManager.logDebug("TokenManager - the current date is \(currentDate.description). the exp date is \(expirationDate.description).")

        
        if currentDate >= expirationDate {
            LogManager.logDebug("TokenManager - Token is expired.")
            return true
        } else {
            LogManager.logDebug("TokenManager - Token is still valid.")
            return false
        }
    }

    public func saveTokens(accessJwt: String, refreshJwt: String) async throws {
        // Update the stored JWTs in memory
        self.accessJwt = accessJwt
        self.refreshJwt = refreshJwt

        // Notify delegate about the token update
        await delegate?.tokenDidUpdate()
        LogManager.logInfo("Tokens updated and delegate notified.")

        // Log saving tokens and attempt to save them in the keychain
        LogManager.logDebug("TokenManager - Saving new tokens at \(Date()) - Access Token Prefix: \(String(accessJwt.prefix(5)))")
        do {
            // Save access and refresh tokens to the Keychain
            try saveAccessToken(accessJwt)
            try saveRefreshToken(refreshJwt)
            LogManager.logInfo("Tokens saved successfully in Keychain")
        } catch {
            LogManager.logError("Failed to save tokens in Keychain: \(error.localizedDescription)")
            throw error
        }
    }

    func saveAccessToken(_ token: String) throws {
        guard let data = token.data(using: .utf8) else {
            throw TokenError.invalidTokenData
        }
        try KeychainManager.store(key: "accessJwt", value: data)
    }

    func saveRefreshToken(_ token: String) throws {
        guard let data = token.data(using: .utf8) else {
            throw TokenError.invalidTokenData
        }
        try KeychainManager.store(key: "refreshJwt", value: data)
    }

    func fetchAccessToken() -> String? {
        
        guard let data = try? KeychainManager.retrieve(key: "accessJwt") else {
            return nil
        }
        return String(data: data, encoding: .utf8)
    }
    
    func fetchRefreshToken() -> String? {
        guard let data = try? KeychainManager.retrieve(key: "refreshJwt") else {
            return nil
        }
        return String(data: data, encoding: .utf8)
    }

    public func deleteTokens() throws {
        try KeychainManager.delete(key: "accessJwt")
        try KeychainManager.delete(key: "refreshJwt")
    }
    
    public func shouldRefreshTokens() async -> Bool {
        LogManager.logDebug("Checking if tokens should be refreshed.")
        
        guard let refreshToken = fetchRefreshToken(), let accessToken = fetchAccessToken(),
              let refreshPayload = decodeJWT(token: refreshToken), let accessPayload = decodeJWT(token: accessToken) else {
            LogManager.logInfo("TokenManager - One or both tokens missing or cannot be decoded.")
            return true // Assume refresh is needed if any token is missing or cannot be decoded.
        }

        let currentTime = Date()
        let refreshTimeToExpiration = refreshPayload.expirationDate.timeIntervalSince(currentTime)
        let accessTimeToExpiration = accessPayload.expirationDate.timeIntervalSince(currentTime)

        if accessTimeToExpiration < 0 {
            LogManager.logInfo("TokenManager - Access token is expired.")
            return true
        } else if refreshTimeToExpiration < 0 {
            LogManager.logInfo("TokenManager - Refresh token is expired.")
            return true
        } else if refreshTimeToExpiration < 300 {
            LogManager.logInfo("TokenManager - Refresh token is close to expiration.")
            return true
        } else {
            LogManager.logDebug("TokenManager - No need to refresh tokens yet.")
            return false
        }
    }

    public func decodeJWT(token: String) -> JWTPayload? {
        LogManager.logDebug("Decoding JWT token")
        let segments = token.split(separator: ".")
        if segments.count != 3 {
            LogManager.logError("JWT format error: Expected 3 segments but found \(segments.count)")
            return nil
        }
        let base64UrlPayload = segments[1]
        let base64Payload = base64UrlPayload
                            .replacingOccurrences(of: "-", with: "+")
                            .replacingOccurrences(of: "_", with: "/")
        // Adjust for padding
        let padLength = (4 - base64Payload.count % 4) % 4
        let paddedBase64Payload = base64Payload + String(repeating: "=", count: padLength)

//        LogManager.logDebug("Base64 segment being decoded: \(base64UrlPayload)")
        guard let payloadData = Data(base64Encoded: paddedBase64Payload) else {
            LogManager.logError("Failed to decode JWT token: Data base64 decoding failed")
            return nil
        }
        do {
            let payload = try ZippyJSONDecoder().decode(JWTPayload.self, from: payloadData)
            LogManager.logInfo("JWT token decoded successfully")
            LogManager.logDebug("Payload \(payload)")
            return payload
        } catch {
            LogManager.logError("Failed to decode JWT token: \(error.localizedDescription)")
            return nil
        }
    }

}

// Define TokenError and JWTPayload within the same file to keep them scoped correctly.
enum TokenError: Error {
    case invalidTokenData

    var localizedDescription: String {
        switch self {
        case .invalidTokenData:
            return "Invalid data for token"
        }
    }
}
//  "alg": "ES256K"
public struct JWTPayload: Codable, Sendable {
    let scope: String
    let sub: String
    let exp: Int
    let iat: Int
    let aud: String
    var expirationDate: Date { Date(timeIntervalSince1970: Double(exp)) }
    var issuedAtDate: Date { Date(timeIntervalSince1970: Double(iat)) }
}
