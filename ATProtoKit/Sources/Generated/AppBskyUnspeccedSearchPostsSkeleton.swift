import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.unspecced.searchPostsSkeleton


public struct AppBskyUnspeccedSearchPostsSkeleton { 
    public static let typeIdentifier = "app.bsky.unspecced.searchPostsSkeleton"        
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
    
public struct Output: ATProtocolCodable { 
        
        public let cursor: String?
        
        public let hitsTotal: Int?
        
        public let posts: [AppBskyUnspeccedDefs.SkeletonSearchPost]
        
        
        // Standard public initializer
        public init(
            cursor: String? = nil, 
        
            hitsTotal: Int? = nil, 
        
            posts: [AppBskyUnspeccedDefs.SkeletonSearchPost]
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

extension ATProtoClient.App.Bsky.Unspecced {
    /// Backend Posts search, returns only skeleton
    public func searchPostsSkeleton(input: AppBskyUnspeccedSearchPostsSkeleton.Parameters) async throws -> (responseCode: Int, data: AppBskyUnspeccedSearchPostsSkeleton.Output?) {
        let endpoint = "/app.bsky.unspecced.searchPostsSkeleton"
        
        
        let queryItems = input.asQueryItems()
        let urlRequest = try await networkManager.createURLRequest(
            endpoint: endpoint, 
            method: "GET", 
            headers: [:], // Typically, GET requests do not have a body
            body: nil, 
            queryItems: queryItems
        )
        
        
        let (responseData, response) = try await networkManager.performRequest(urlRequest, retryCount: 3, duringInitialSetup: false)
        let responseCode = response.statusCode

        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(AppBskyUnspeccedSearchPostsSkeleton.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
