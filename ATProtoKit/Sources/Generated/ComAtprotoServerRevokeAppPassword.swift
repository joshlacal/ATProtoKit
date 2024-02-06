import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.server.revokeAppPassword


public struct ComAtprotoServerRevokeAppPassword { 
    public static let typeIdentifier = "com.atproto.server.revokeAppPassword"        
public struct Input: Codable {
            public let name: String

            // Standard public initializer
            public init(name: String) {
                self.name = name
                
            }
        }



}
extension ATProtoClient.Com.Atproto.Server {
    /// Revoke an App Password by name.
    public func revokeAppPassword(input: ComAtprotoServerRevokeAppPassword.Input) async throws -> Int {
        let endpoint = "/com.atproto.server.revokeAppPassword"
        
        let requestData = try JSONEncoder().encode(input)
        
        
        // Perform the network request
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "POST", body: requestData)

        
        // Return only the response code if no output type is expected
        return responseCode
        
    }
}
                           
