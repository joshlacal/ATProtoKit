import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.server.requestPasswordReset


public struct ComAtprotoServerRequestPasswordReset { 
    public static let typeIdentifier = "com.atproto.server.requestPasswordReset"        
public struct Input: Codable {
            public let email: String

            // Standard public initializer
            public init(email: String) {
                self.email = email
                
            }
        }



}
extension ATProtoClient.Com.Atproto.Server {
    /// Initiate a user account password reset via email.
    public func requestPasswordReset(input: ComAtprotoServerRequestPasswordReset.Input) async throws -> Int {
        let endpoint = "/com.atproto.server.requestPasswordReset"
        
        let requestData = try JSONEncoder().encode(input)
        
        
        // Perform the network request
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "POST", body: requestData)

        
        // Return only the response code if no output type is expected
        return responseCode
        
    }
}
                           
