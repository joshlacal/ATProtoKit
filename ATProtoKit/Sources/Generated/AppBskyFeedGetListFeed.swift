import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.feed.getListFeed


public struct AppBskyFeedGetListFeed { 
    public static let typeIdentifier = "app.bsky.feed.getListFeed"        
public struct Parameters: Parametrizable {
            public let list: ATProtocolURI
            public let limit: Int?
            public let cursor: String?
            
            public init(
                list: ATProtocolURI, 
                limit: Int? = nil, 
                cursor: String? = nil
                ) {
                self.list = list
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
public enum Error: String, Swift.Error, CustomStringConvertible {
                case unknownList = "UnknownList."
            public var description: String {
                return self.rawValue
            }
        }



}

extension ATProtoClient.App.Bsky.Feed {
    /// Get a view of a recent posts from actors in a list. 
    public func getListFeed(input: AppBskyFeedGetListFeed.Parameters) async throws -> (responseCode: Int, data: AppBskyFeedGetListFeed.Output?) {
        let endpoint = "/app.bsky.feed.getListFeed"
        
        
        // Convert input to query items
        let queryItems = input.asQueryItems()
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "GET", queryItems: queryItems)
        

        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(AppBskyFeedGetListFeed.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
