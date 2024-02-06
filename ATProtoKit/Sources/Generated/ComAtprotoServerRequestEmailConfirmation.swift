import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.server.requestEmailConfirmation


public struct ComAtprotoServerRequestEmailConfirmation { 
    public static let typeIdentifier = "com.atproto.server.requestEmailConfirmation"



}
extension ATProtoClient.Com.Atproto.Server {
    /// Request an email with a code to confirm ownership of email.
    public func requestEmailConfirmation() async throws -> Int {
        let endpoint = "/com.atproto.server.requestEmailConfirmation"
        
        let requestData: Data? = nil
        
        
        // Perform the network request
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "POST", body: requestData)

        
        // Return only the response code if no output type is expected
        return responseCode
        
    }
}
                           
