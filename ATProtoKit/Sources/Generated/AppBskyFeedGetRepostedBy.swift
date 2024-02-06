import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.feed.getRepostedBy


public struct AppBskyFeedGetRepostedBy { 
    public static let typeIdentifier = "app.bsky.feed.getRepostedBy"        
public struct Parameters: Parametrizable {
            public let uri: ATProtocolURI
            public let cid: String?
            public let limit: Int?
            public let cursor: String?
            
            public init(
                uri: ATProtocolURI, 
                cid: String? = nil, 
                limit: Int? = nil, 
                cursor: String? = nil
                ) {
                self.uri = uri
                self.cid = cid
                self.limit = limit
                self.cursor = cursor
                
            }
        }        
public struct Output: Codable {
            public let uri: ATProtocolURI
            public let cid: String?
            public let cursor: String?
            public let repostedBy: [AppBskyActorDefs.ProfileView]
                                    
            // Standard public initializer
            public init(uri: ATProtocolURI, cid: String? = nil, cursor: String? = nil, repostedBy: [AppBskyActorDefs.ProfileView]) {
                self.uri = uri
                self.cid = cid
                self.cursor = cursor
                self.repostedBy = repostedBy
                
            }

        }



}

extension ATProtoClient.App.Bsky.Feed {
    /// Get a list of reposts. 
    public func getRepostedBy(input: AppBskyFeedGetRepostedBy.Parameters) async throws -> (responseCode: Int, data: AppBskyFeedGetRepostedBy.Output?) {
        let endpoint = "/app.bsky.feed.getRepostedBy"
        
        
        // Convert input to query items
        let queryItems = input.asQueryItems()
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "GET", queryItems: queryItems)
        

        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(AppBskyFeedGetRepostedBy.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
