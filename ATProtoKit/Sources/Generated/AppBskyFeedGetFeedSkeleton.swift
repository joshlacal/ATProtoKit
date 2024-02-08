import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.feed.getFeedSkeleton


public struct AppBskyFeedGetFeedSkeleton { 
    public static let typeIdentifier = "app.bsky.feed.getFeedSkeleton"        
public struct Parameters: Parametrizable {
            public let feed: ATProtocolURI
            public let limit: Int?
            public let cursor: String?
            
            public init(
                feed: ATProtocolURI, 
                limit: Int? = nil, 
                cursor: String? = nil
                ) {
                self.feed = feed
                self.limit = limit
                self.cursor = cursor
                
            }
        }    
    
public struct Output: Codable { 
        
        public let cursor: String?
        
        public let feed: [AppBskyFeedDefs.SkeletonFeedPost]
        
        
        // Standard public initializer
        public init(
            cursor: String? = nil, 
        
            feed: [AppBskyFeedDefs.SkeletonFeedPost]
        ) {
            
            self.cursor = cursor
            
            self.feed = feed
            
        }
    }
            
public enum Error: String, Swift.Error, CustomStringConvertible {
                case unknownFeed = "UnknownFeed."
            public var description: String {
                return self.rawValue
            }
        }



}

extension ATProtoClient.App.Bsky.Feed {
    /// Get a skeleton of a feed provided by a feed generator. 
    public func getFeedSkeleton(input: AppBskyFeedGetFeedSkeleton.Parameters) async throws -> (responseCode: Int, data: AppBskyFeedGetFeedSkeleton.Output?) {
        let endpoint = "/app.bsky.feed.getFeedSkeleton"
        
        
        // Convert input to query items
        let queryItems = input.asQueryItems()
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "GET", queryItems: queryItems)
        

        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(AppBskyFeedGetFeedSkeleton.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
