import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.feed.getFeedGenerators


public struct AppBskyFeedGetFeedGenerators { 
    public static let typeIdentifier = "app.bsky.feed.getFeedGenerators"        
public struct Parameters: Parametrizable {
            public let feeds: [ATProtocolURI]
            
            public init(
                feeds: [ATProtocolURI]
                ) {
                self.feeds = feeds
                
            }
        }    
    
public struct Output: Codable { 
        
        public let feeds: [AppBskyFeedDefs.GeneratorView]
        
        
        // Standard public initializer
        public init(
            feeds: [AppBskyFeedDefs.GeneratorView]
        ) {
            
            self.feeds = feeds
            
        }
    }
    



}

extension ATProtoClient.App.Bsky.Feed {
    /// Get information about a list of feed generators. 
    public func getFeedGenerators(input: AppBskyFeedGetFeedGenerators.Parameters) async throws -> (responseCode: Int, data: AppBskyFeedGetFeedGenerators.Output?) {
        let endpoint = "/app.bsky.feed.getFeedGenerators"
        
        
        // Convert input to query items
        let queryItems = input.asQueryItems()
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "GET", queryItems: queryItems)
        

        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(AppBskyFeedGetFeedGenerators.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
