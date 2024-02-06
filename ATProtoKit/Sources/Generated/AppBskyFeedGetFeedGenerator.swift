import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.feed.getFeedGenerator


public struct AppBskyFeedGetFeedGenerator { 
    public static let typeIdentifier = "app.bsky.feed.getFeedGenerator"        
public struct Parameters: Parametrizable {
            public let feed: ATProtocolURI
            
            public init(
                feed: ATProtocolURI
                ) {
                self.feed = feed
                
            }
        }        
public struct Output: Codable {
            public let view: AppBskyFeedDefs.GeneratorView
            public let isOnline: Bool
            public let isValid: Bool
                                    
            // Standard public initializer
            public init(view: AppBskyFeedDefs.GeneratorView, isOnline: Bool, isValid: Bool) {
                self.view = view
                self.isOnline = isOnline
                self.isValid = isValid
                
            }

        }



}

extension ATProtoClient.App.Bsky.Feed {
    /// Get information about a feed generator. 
    public func getFeedGenerator(input: AppBskyFeedGetFeedGenerator.Parameters) async throws -> (responseCode: Int, data: AppBskyFeedGetFeedGenerator.Output?) {
        let endpoint = "/app.bsky.feed.getFeedGenerator"
        
        
        // Convert input to query items
        let queryItems = input.asQueryItems()
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "GET", queryItems: queryItems)
        

        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(AppBskyFeedGetFeedGenerator.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
