import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.feed.getTimeline


public struct AppBskyFeedGetTimeline { 
    public static let typeIdentifier = "app.bsky.feed.getTimeline"        
public struct Parameters: Parametrizable {
            public let algorithm: String?
            public let limit: Int?
            public let cursor: String?
            
            public init(
                algorithm: String? = nil, 
                limit: Int? = nil, 
                cursor: String? = nil
                ) {
                self.algorithm = algorithm
                self.limit = limit
                self.cursor = cursor
                
            }
        }        
public struct Output: Codable {
            public let cursor: String?
            public let feed: [AppBskyFeedDefs.FeedViewPost]
                                    
            // Standard public initializer
            public init(cursor: String? = nil, feed: [AppBskyFeedDefs.FeedViewPost]) {
                self.cursor = cursor
                self.feed = feed
                
            }

        }



}

extension ATProtoClient.App.Bsky.Feed {
    /// Get a view of the actor's home timeline. 
    public func getTimeline(input: AppBskyFeedGetTimeline.Parameters) async throws -> (responseCode: Int, data: AppBskyFeedGetTimeline.Output?) {
        let endpoint = "/app.bsky.feed.getTimeline"
        
        
        // Convert input to query items
        let queryItems = input.asQueryItems()
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "GET", queryItems: queryItems)
        

        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(AppBskyFeedGetTimeline.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
