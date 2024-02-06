import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.temp.pushBlob


public struct ComAtprotoTempPushBlob { 
    public static let typeIdentifier = "com.atproto.temp.pushBlob"



}
extension ATProtoClient.Com.Atproto.Temp {
    /// Gets the did's repo, optionally catching up from a specific revision.
    public func pushBlob() async throws -> Int {
        let endpoint = "/com.atproto.temp.pushBlob"
        
        let requestData: Data? = nil
        
        
        // Perform the network request
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "POST", body: requestData)

        
        // Return only the response code if no output type is expected
        return responseCode
        
    }
}
                           
