import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.server.deleteSession


public struct ComAtprotoServerDeleteSession { 
    public static let typeIdentifier = "com.atproto.server.deleteSession"



}
extension ATProtoClient.Com.Atproto.Server {
    /// Delete the current session.
    public func deleteSession() async throws -> Int {
        let endpoint = "/com.atproto.server.deleteSession"
        
        let requestData: Data? = nil
        
        
        // Perform the network request
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "POST", body: requestData)

        
        // Return only the response code if no output type is expected
        return responseCode
        
    }
}
                           
