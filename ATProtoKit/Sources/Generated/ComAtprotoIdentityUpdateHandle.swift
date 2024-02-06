import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.identity.updateHandle


public struct ComAtprotoIdentityUpdateHandle { 
    public static let typeIdentifier = "com.atproto.identity.updateHandle"        
public struct Input: Codable {
            public let handle: String

            // Standard public initializer
            public init(handle: String) {
                self.handle = handle
                
            }
        }



}
extension ATProtoClient.Com.Atproto.Identity {
    /// Updates the handle of the account.
    public func updateHandle(input: ComAtprotoIdentityUpdateHandle.Input) async throws -> Int {
        let endpoint = "/com.atproto.identity.updateHandle"
        
        let requestData = try JSONEncoder().encode(input)
        
        
        // Perform the network request
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "POST", body: requestData)

        
        // Return only the response code if no output type is expected
        return responseCode
        
    }
}
                           
