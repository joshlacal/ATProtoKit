import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.server.requestEmailUpdate


public struct ComAtprotoServerRequestEmailUpdate { 
    public static let typeIdentifier = "com.atproto.server.requestEmailUpdate"        
public struct Output: Codable {
            public let tokenRequired: Bool
                                    
            // Standard public initializer
            public init(tokenRequired: Bool) {
                self.tokenRequired = tokenRequired
                
            }

        }



}
extension ATProtoClient.Com.Atproto.Server {
    /// Request a token in order to update email.
    public func requestEmailUpdate() async throws -> (responseCode: Int, data: ComAtprotoServerRequestEmailUpdate.Output?) {
        let endpoint = "/com.atproto.server.requestEmailUpdate"
        
        let requestData: Data? = nil
        
        
        // Perform the network request
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "POST", body: requestData)

        
        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(ComAtprotoServerRequestEmailUpdate.Output.self, from: responseData)
        return (responseCode, decodedData)
        
    }
}
                           
