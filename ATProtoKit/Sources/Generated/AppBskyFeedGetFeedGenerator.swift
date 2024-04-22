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
    
public struct Output: ATProtocolCodable { 
        
        public let view: AppBskyFeedDefs.GeneratorView
        
        public let isOnline: Bool
        
        public let isValid: Bool
        
        
        // Standard public initializer
        public init(
            view: AppBskyFeedDefs.GeneratorView, 
        
            isOnline: Bool, 
        
            isValid: Bool
        ) {
            
            self.view = view
            
            self.isOnline = isOnline
            
            self.isValid = isValid
            
        }
    }
    



}

extension ATProtoClient.App.Bsky.Feed {
    /// Get information about a feed generator. Implemented by AppView.
    public func getFeedGenerator(input: AppBskyFeedGetFeedGenerator.Parameters) async throws -> (responseCode: Int, data: AppBskyFeedGetFeedGenerator.Output?) {
        let endpoint = "/app.bsky.feed.getFeedGenerator"
        
        
        let queryItems = input.asQueryItems()
        let urlRequest = try await networkManager.createURLRequest(
            endpoint: endpoint, 
            method: "GET", 
            headers: [:], // Typically, GET requests do not have a body
            body: nil, 
            queryItems: queryItems
        )
        
        
        let (responseData, response) = try await networkManager.performRequest(urlRequest)
        let responseCode = response.statusCode

        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(AppBskyFeedGetFeedGenerator.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
