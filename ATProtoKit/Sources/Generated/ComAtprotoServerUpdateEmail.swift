import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.server.updateEmail


public struct ComAtprotoServerUpdateEmail { 
    public static let typeIdentifier = "com.atproto.server.updateEmail"        
public struct Input: Codable {
            public let email: String
            public let token: String?

            // Standard public initializer
            public init(email: String, token: String? = nil) {
                self.email = email
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
    public func updateEmail(input: ComAtprotoServerUpdateEmail.Input) async throws -> Int {
        let endpoint = "/com.atproto.server.updateEmail"
        
        let requestData = try JSONEncoder().encode(input)
        
        
        // Perform the network request
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "POST", body: requestData)

        
        // Return only the response code if no output type is expected
        return responseCode
        
    }
}
                           
