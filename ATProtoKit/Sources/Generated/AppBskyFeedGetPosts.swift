import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.feed.getPosts


public struct AppBskyFeedGetPosts { 
    public static let typeIdentifier = "app.bsky.feed.getPosts"        
public struct Parameters: Parametrizable {
            public let uris: [ATProtocolURI]
            
            public init(
                uris: [ATProtocolURI]
                ) {
                self.uris = uris
                
            }
        }    
    
public struct Output: ATProtocolCodable { 
        
        public let posts: [AppBskyFeedDefs.PostView]
        
        
        // Standard public initializer
        public init(
            posts: [AppBskyFeedDefs.PostView]
        ) {
            
            self.posts = posts
            
        }
    }
    



}

extension ATProtoClient.App.Bsky.Feed {
    /// Gets post views for a specified list of posts (by AT-URI). This is sometimes referred to as 'hydrating' a 'feed skeleton'.
    public func getPosts(input: AppBskyFeedGetPosts.Parameters) async throws -> (responseCode: Int, data: AppBskyFeedGetPosts.Output?) {
        let endpoint = "/app.bsky.feed.getPosts"
        
        
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
        let decodedData = try? decoder.decode(AppBskyFeedGetPosts.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
