import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.feed.searchPosts


public struct AppBskyFeedSearchPosts { 
    public static let typeIdentifier = "app.bsky.feed.searchPosts"        
public struct Parameters: Parametrizable {
            public let q: String
            public let limit: Int?
            public let cursor: String?
            
            public init(
                q: String, 
                limit: Int? = nil, 
                cursor: String? = nil
                ) {
                self.q = q
                self.limit = limit
                self.cursor = cursor
                
            }
        }    
    
public struct Output: Codable { 
        
        public let cursor: String?
        
        public let hitsTotal: Int?
        
        public let posts: [AppBskyFeedDefs.PostView]
        
        
        // Standard public initializer
        public init(
            cursor: String? = nil, 
        
            hitsTotal: Int? = nil, 
        
            posts: [AppBskyFeedDefs.PostView]
        ) {
            
            self.cursor = cursor
            
            self.hitsTotal = hitsTotal
            
            self.posts = posts
            
        }
    }
            
public enum Error: String, Swift.Error, CustomStringConvertible {
                case badQueryString = "BadQueryString."
            public var description: String {
                return self.rawValue
            }
        }



}

extension ATProtoClient.App.Bsky.Feed {
    /// Find posts matching search criteria. 
    public func searchPosts(input: AppBskyFeedSearchPosts.Parameters) async throws -> (responseCode: Int, data: AppBskyFeedSearchPosts.Output?) {
        let endpoint = "/app.bsky.feed.searchPosts"
        
        
        // Convert input to query items
        let queryItems = input.asQueryItems()
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "GET", queryItems: queryItems)
        

        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(AppBskyFeedSearchPosts.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
