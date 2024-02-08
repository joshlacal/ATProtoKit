import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.feed.getActorFeeds


public struct AppBskyFeedGetActorFeeds { 
    public static let typeIdentifier = "app.bsky.feed.getActorFeeds"        
public struct Parameters: Parametrizable {
            public let actor: String
            public let limit: Int?
            public let cursor: String?
            
            public init(
                actor: String, 
                limit: Int? = nil, 
                cursor: String? = nil
                ) {
                self.actor = actor
                self.limit = limit
                self.cursor = cursor
                
            }
        }    
    
public struct Output: Codable { 
        
        public let cursor: String?
        
        public let feeds: [AppBskyFeedDefs.GeneratorView]
        
        
        // Standard public initializer
        public init(
            cursor: String? = nil, 
        
            feeds: [AppBskyFeedDefs.GeneratorView]
        ) {
            
            self.cursor = cursor
            
            self.feeds = feeds
            
        }
    }
    



}

extension ATProtoClient.App.Bsky.Feed {
    /// Get a list of feeds created by the actor. 
    public func getActorFeeds(input: AppBskyFeedGetActorFeeds.Parameters) async throws -> (responseCode: Int, data: AppBskyFeedGetActorFeeds.Output?) {
        let endpoint = "/app.bsky.feed.getActorFeeds"
        
        
        // Convert input to query items
        let queryItems = input.asQueryItems()
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "GET", queryItems: queryItems)
        

        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(AppBskyFeedGetActorFeeds.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
