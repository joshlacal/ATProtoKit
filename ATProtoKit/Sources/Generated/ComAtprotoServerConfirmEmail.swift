import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.server.confirmEmail


public struct ComAtprotoServerConfirmEmail { 
    public static let typeIdentifier = "com.atproto.server.confirmEmail"        
public struct Input: ATProtocolCodable {
            public let email: String
            public let token: String

            // Standard public initializer
            public init(email: String, token: String) {
                self.email = email
                self.token = token
                
            }
        }        
public enum Error: String, Swift.Error, CustomStringConvertible {
                case accountNotFound = "AccountNotFound."
                case expiredToken = "ExpiredToken."
                case invalidToken = "InvalidToken."
                case invalidEmail = "InvalidEmail."
            public var description: String {
                return self.rawValue
            }
        }



}
extension ATProtoClient.Com.Atproto.Server {
    /// Confirm an email using a token from com.atproto.server.requestEmailConfirmation.
    public func confirmEmail(input: ComAtprotoServerConfirmEmail.Input) async throws -> Int {
        let endpoint = "/com.atproto.server.confirmEmail"
        
        
        let requestData = try JSONEncoder().encode(input)
        
        
        let urlRequest = try await networkManager.createURLRequest(
            endpoint: endpoint, 
            method: "POST", 
            headers: ["Content-Type": "application/json"], 
            body: requestData,
            queryItems: nil
        )
        
        let (responseData, response) = try await networkManager.performRequest(urlRequest)
        let responseCode = response.statusCode

        
        // Return only the response code if no output type is expected
        return responseCode
        
    }
}
                           
