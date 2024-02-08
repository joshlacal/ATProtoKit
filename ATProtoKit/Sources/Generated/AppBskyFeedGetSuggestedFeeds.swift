import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.feed.getSuggestedFeeds


public struct AppBskyFeedGetSuggestedFeeds { 
    public static let typeIdentifier = "app.bsky.feed.getSuggestedFeeds"        
public struct Parameters: Parametrizable {
            public let limit: Int?
            public let cursor: String?
            
            public init(
                limit: Int? = nil, 
                cursor: String? = nil
                ) {
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
    /// Get a list of suggested feeds for the viewer. 
    public func getSuggestedFeeds(input: AppBskyFeedGetSuggestedFeeds.Parameters) async throws -> (responseCode: Int, data: AppBskyFeedGetSuggestedFeeds.Output?) {
        let endpoint = "/app.bsky.feed.getSuggestedFeeds"
        
        
        // Convert input to query items
        let queryItems = input.asQueryItems()
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "GET", queryItems: queryItems)
        

        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(AppBskyFeedGetSuggestedFeeds.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
