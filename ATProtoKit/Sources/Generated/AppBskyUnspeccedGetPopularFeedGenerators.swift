import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.unspecced.getPopularFeedGenerators


public struct AppBskyUnspeccedGetPopularFeedGenerators { 
    public static let typeIdentifier = "app.bsky.unspecced.getPopularFeedGenerators"        
public struct Parameters: Parametrizable {
            public let limit: Int?
            public let cursor: String?
            public let query: String?
            
            public init(
                limit: Int? = nil, 
                cursor: String? = nil, 
                query: String? = nil
                ) {
                self.limit = limit
                self.cursor = cursor
                self.query = query
                
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

extension ATProtoClient.App.Bsky.Unspecced {
    /// An unspecced view of globally popular feed generators. 
    public func getPopularFeedGenerators(input: AppBskyUnspeccedGetPopularFeedGenerators.Parameters) async throws -> (responseCode: Int, data: AppBskyUnspeccedGetPopularFeedGenerators.Output?) {
        let endpoint = "/app.bsky.unspecced.getPopularFeedGenerators"
        
        
        // Convert input to query items
        let queryItems = input.asQueryItems()
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "GET", queryItems: queryItems)
        

        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(AppBskyUnspeccedGetPopularFeedGenerators.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
