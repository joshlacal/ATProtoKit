import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.server.resetPassword


public struct ComAtprotoServerResetPassword { 
    public static let typeIdentifier = "com.atproto.server.resetPassword"        
public struct Input: Codable {
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
    public func resetPassword(input: ComAtprotoServerResetPassword.Input) async throws -> Int {
        let endpoint = "/com.atproto.server.resetPassword"
        
        let requestData = try JSONEncoder().encode(input)
        
        
        // Perform the network request
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "POST", body: requestData)

        
        // Return only the response code if no output type is expected
        return responseCode
        
    }
}
                           
