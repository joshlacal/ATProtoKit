import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.sync.requestCrawl


public struct ComAtprotoSyncRequestCrawl { 
    public static let typeIdentifier = "com.atproto.sync.requestCrawl"        
public struct Input: Codable {
            public let hostname: String

            // Standard public initializer
            public init(hostname: String) {
                self.hostname = hostname
                
            }
        }



}
extension ATProtoClient.Com.Atproto.Sync {
    /// Request a service to persistently crawl hosted repos.
    public func requestCrawl(input: ComAtprotoSyncRequestCrawl.Input) async throws -> Int {
        let endpoint = "/com.atproto.sync.requestCrawl"
        
        let requestData = try JSONEncoder().encode(input)
        
        
        // Perform the network request
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "POST", body: requestData)

        
        // Return only the response code if no output type is expected
        return responseCode
        
    }
}
                           
