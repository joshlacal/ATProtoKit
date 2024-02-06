import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.sync.notifyOfUpdate


public struct ComAtprotoSyncNotifyOfUpdate { 
    public static let typeIdentifier = "com.atproto.sync.notifyOfUpdate"        
public struct Input: Codable {
            public let hostname: String

            // Standard public initializer
            public init(hostname: String) {
                self.hostname = hostname
                
            }
        }



}
extension ATProtoClient.Com.Atproto.Sync {
    /// Notify a crawling service of a recent update; often when a long break between updates causes the connection with the crawling service to break.
    public func notifyOfUpdate(input: ComAtprotoSyncNotifyOfUpdate.Input) async throws -> Int {
        let endpoint = "/com.atproto.sync.notifyOfUpdate"
        
        let requestData = try JSONEncoder().encode(input)
        
        
        // Perform the network request
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "POST", body: requestData)

        
        // Return only the response code if no output type is expected
        return responseCode
        
    }
}
                           
