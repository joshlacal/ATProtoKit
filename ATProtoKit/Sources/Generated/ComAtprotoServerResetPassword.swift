import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.server.resetPassword


public struct ComAtprotoServerResetPassword { 

    public static let typeIdentifier = "com.atproto.server.resetPassword"        
public struct Input: ATProtocolCodable {
            public let token: String
            public let password: String

            // Standard public initializer
            public init(token: String, password: String) {
                self.token = token
                self.password = password
                
            }
        }        
public enum Error: String, Swift.Error, CustomStringConvertible {
                case expiredToken = "ExpiredToken."
                case invalidToken = "InvalidToken."
            public var description: String {
                return self.rawValue
            }
        }



}
extension ATProtoClient.Com.Atproto.Server {
    /// Reset a user account password using a token.
    public func resetPassword(input: ComAtprotoServerResetPassword.Input, duringInitialSetup: Bool = false) async throws -> Int {
        let endpoint = "/com.atproto.server.resetPassword"
        
        
        let requestData = try JSONEncoder().encode(input)
        
        
        let urlRequest = try await networkManager.createURLRequest(
            endpoint: endpoint, 
            method: "POST", 
            headers: ["Content-Type": "application/json"], 
            body: requestData,
            queryItems: nil
        )
        
        let (responseData, response) = try await networkManager.performRequest(urlRequest, retryCount: 0, duringInitialSetup: duringInitialSetup)
        let responseCode = response.statusCode

        
        return responseCode
        
    }
}
                           
