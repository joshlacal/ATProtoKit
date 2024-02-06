import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.server.requestAccountDelete


public struct ComAtprotoServerRequestAccountDelete { 
    public static let typeIdentifier = "com.atproto.server.requestAccountDelete"



}
extension ATProtoClient.Com.Atproto.Server {
    /// Initiate a user account deletion via email.
    public func requestAccountDelete() async throws -> Int {
        let endpoint = "/com.atproto.server.requestAccountDelete"
        
        let requestData: Data? = nil
        
        
        // Perform the network request
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "POST", body: requestData)

        
        // Return only the response code if no output type is expected
        return responseCode
        
    }
}
                           
