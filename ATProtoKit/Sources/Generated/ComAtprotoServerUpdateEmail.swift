import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.server.updateEmail


public struct ComAtprotoServerUpdateEmail { 

    public static let typeIdentifier = "com.atproto.server.updateEmail"        
public struct Input: ATProtocolCodable {
            public let email: String
            public let emailAuthFactor: Bool?
            public let token: String?

            // Standard public initializer
            public init(email: String, emailAuthFactor: Bool? = nil, token: String? = nil) {
                self.email = email
                self.emailAuthFactor = emailAuthFactor
                self.token = token
                
            }
        }        
public enum Error: String, Swift.Error, CustomStringConvertible {
                case expiredToken = "ExpiredToken."
                case invalidToken = "InvalidToken."
                case tokenRequired = "TokenRequired."
            public var description: String {
                return self.rawValue
            }
        }



}
extension ATProtoClient.Com.Atproto.Server {
    /// Update an account's email.
    
    public func updateEmail(input: ComAtprotoServerUpdateEmail.Input, duringInitialSetup: Bool = false) async throws -> Int {
        let endpoint = "/com.atproto.server.updateEmail"
        
        
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
                           
