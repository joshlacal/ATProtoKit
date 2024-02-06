import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.server.deleteAccount


public struct ComAtprotoServerDeleteAccount { 
    public static let typeIdentifier = "com.atproto.server.deleteAccount"        
public struct Input: Codable {
            public let did: String
            public let password: String
            public let token: String

            // Standard public initializer
            public init(did: String, password: String, token: String) {
                self.did = did
                self.password = password
                self.token = token
                
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
    /// Delete an actor's account with a token and password.
    public func deleteAccount(input: ComAtprotoServerDeleteAccount.Input) async throws -> Int {
        let endpoint = "/com.atproto.server.deleteAccount"
        
        let requestData = try JSONEncoder().encode(input)
        
        
        // Perform the network request
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "POST", body: requestData)

        
        // Return only the response code if no output type is expected
        return responseCode
        
    }
}
                           
