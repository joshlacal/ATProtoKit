import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.feed.getAuthorFeed


public struct AppBskyFeedGetAuthorFeed { 
    public static let typeIdentifier = "app.bsky.feed.getAuthorFeed"        
public struct Parameters: Parametrizable {
            public let actor: String
            public let limit: Int?
            public let cursor: String?
            public let filter: String?
            
            public init(
                actor: String, 
                limit: Int? = nil, 
                cursor: String? = nil, 
                filter: String? = nil
                ) {
                self.actor = actor
                self.limit = limit
                self.cursor = cursor
                self.filter = filter
                
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
public enum Error: String, Swift.Error, CustomStringConvertible {
                case blockedActor = "BlockedActor."
                case blockedByActor = "BlockedByActor."
            public var description: String {
                return self.rawValue
            }
        }



}

extension ATProtoClient.App.Bsky.Feed {
    /// Get a view of an actor's feed. 
    public func getAuthorFeed(input: AppBskyFeedGetAuthorFeed.Parameters) async throws -> (responseCode: Int, data: AppBskyFeedGetAuthorFeed.Output?) {
        let endpoint = "/app.bsky.feed.getAuthorFeed"
        
        
        // Convert input to query items
        let queryItems = input.asQueryItems()
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "GET", queryItems: queryItems)
        

        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(AppBskyFeedGetAuthorFeed.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
