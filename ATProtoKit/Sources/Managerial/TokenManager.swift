import Foundation

protocol TokenManaging: AnyActor {
    func saveTokens(accessJwt: String, refreshJwt: String) async throws
    func fetchAccessToken() async -> String? 
    func fetchRefreshToken() async -> String? 
    func deleteTokens() async throws
    func hasValidTokens() async -> Bool 
    func refreshTokenIfNeeded() async throws -> Bool
}


actor TokenManager: TokenManaging {
    private var accessJwt: String?
    private var refreshJwt: String?
    private var networkService: NetworkServicing

    init(networkService: NetworkServicing) {
        self.networkService = networkService
    }

    func hasValidTokens() -> Bool {
        guard let accessJwt = fetchAccessToken(), let refreshJwt = fetchRefreshToken(),
              let accessPayload = decodeJWT(token: accessJwt), let refreshPayload = decodeJWT(token: refreshJwt),
              accessPayload.expirationDate > Date(), refreshPayload.expirationDate > Date() else {
            return false
        }
        return true
    }

    func saveTokens(accessJwt: String, refreshJwt: String) throws {
        try saveAccessToken(accessJwt)
        try saveRefreshToken(refreshJwt)
    }

    func saveAccessToken(_ token: String) throws {
        guard let data = token.data(using: .utf8) else {
            throw TokenError.invalidTokenData
        }
        try KeychainManager.store(key: "accessJwt", value: data)
    }
    
    func fetchAccessToken() -> String? {
        guard let data = try? KeychainManager.retrieve(key: "accessJwt") else {
            return nil
        }
        return String(data: data, encoding: .utf8)
    }

    func saveRefreshToken(_ token: String) throws {
        guard let data = token.data(using: .utf8) else {
            throw TokenError.invalidTokenData
        }
        try KeychainManager.store(key: "refreshJwt", value: data)
    }
    
    func fetchRefreshToken() -> String? {
        guard let data = try? KeychainManager.retrieve(key: "refreshJwt") else {
            return nil
        }
        return String(data: data, encoding: .utf8)
    }

    func deleteTokens() throws {
        try KeychainManager.delete(key: "accessJwt")
        try KeychainManager.delete(key: "refreshJwt")
    }

    func refreshTokenIfNeeded() async throws -> Bool {
        guard let refreshJwt = fetchRefreshToken(),
              let payload = decodeJWT(token: refreshJwt),
              payload.expirationDate.timeIntervalSinceNow < 300 else {
            return false
        }

        return try await networkService.refreshSessionToken(refreshToken: refreshJwt, tokenManager: self)
    }

    private func decodeJWT(token: String) -> JWTPayload? {
        let segments = token.split(separator: ".")
        guard segments.count > 1, let payloadData = Data(base64Encoded: String(segments[1])) else {
            return nil
        }
        return try? JSONDecoder().decode(JWTPayload.self, from: payloadData)
    }
}

// Define TokenError and JWTPayload within the same file to keep them scoped correctly.
enum TokenError: Error {
    case invalidTokenData
}

struct JWTPayload: Codable {
    let exp: Int
    let iat: Int
    var expirationDate: Date { Date(timeIntervalSince1970: Double(exp)) }
    var issuedAtDate: Date { Date(timeIntervalSince1970: Double(iat)) }
}
