import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.unspecced.searchActorsSkeleton


public struct AppBskyUnspeccedSearchActorsSkeleton { 
    public static let typeIdentifier = "app.bsky.unspecced.searchActorsSkeleton"        
public struct Parameters: Parametrizable {
            public let q: String
            public let typeahead: Bool?
            public let limit: Int?
            public let cursor: String?
            
            public init(
                q: String, 
                typeahead: Bool? = nil, 
                limit: Int? = nil, 
                cursor: String? = nil
                ) {
                self.q = q
                self.typeahead = typeahead
                self.limit = limit
                self.cursor = cursor
                
            }
        }    
    
public struct Output: Codable { 
        
        public let cursor: String?
        
        public let hitsTotal: Int?
        
        public let actors: [AppBskyUnspeccedDefs.SkeletonSearchActor]
        
        
        // Standard public initializer
        public init(
            cursor: String? = nil, 
        
            hitsTotal: Int? = nil, 
        
            actors: [AppBskyUnspeccedDefs.SkeletonSearchActor]
        ) {
            
            self.cursor = cursor
            
            self.hitsTotal = hitsTotal
            
            self.actors = actors
            
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
    /// Backend Actors (profile) search, returns only skeleton. 
    public func searchActorsSkeleton(input: AppBskyUnspeccedSearchActorsSkeleton.Parameters) async throws -> (responseCode: Int, data: AppBskyUnspeccedSearchActorsSkeleton.Output?) {
        let endpoint = "/app.bsky.unspecced.searchActorsSkeleton"
        
        
        // Convert input to query items
        let queryItems = input.asQueryItems()
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "GET", queryItems: queryItems)
        

        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(AppBskyUnspeccedSearchActorsSkeleton.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
