import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.feed.getPosts


public struct AppBskyFeedGetPosts { 
    public static let typeIdentifier = "app.bsky.feed.getPosts"        
public struct Parameters: Parametrizable {
            public let uris: [ATProtocolURI]
            
            public init(
                uris: [ATProtocolURI]
                ) {
                self.uris = uris
                
            }
        }        
public struct Output: Codable {
            public let posts: [AppBskyFeedDefs.PostView]
                                    
            // Standard public initializer
            public init(posts: [AppBskyFeedDefs.PostView]) {
                self.posts = posts
                
            }

        }



}

extension ATProtoClient.App.Bsky.Feed {
    /// Get a view of an actor's feed. 
    public func getPosts(input: AppBskyFeedGetPosts.Parameters) async throws -> (responseCode: Int, data: AppBskyFeedGetPosts.Output?) {
        let endpoint = "/app.bsky.feed.getPosts"
        
        
        // Convert input to query items
        let queryItems = input.asQueryItems()
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "GET", queryItems: queryItems)
        

        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(AppBskyFeedGetPosts.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
