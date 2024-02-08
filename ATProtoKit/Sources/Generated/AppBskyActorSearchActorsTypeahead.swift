import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.actor.searchActorsTypeahead


public struct AppBskyActorSearchActorsTypeahead { 
    public static let typeIdentifier = "app.bsky.actor.searchActorsTypeahead"        
public struct Parameters: Parametrizable {
            public let term: String?
            public let q: String?
            public let limit: Int?
            
            public init(
                term: String? = nil, 
                q: String? = nil, 
                limit: Int? = nil
                ) {
                self.term = term
                self.q = q
                self.limit = limit
                
            }
        }    
    
public struct Output: Codable { 
        
        public let actors: [AppBskyActorDefs.ProfileViewBasic]
        
        
        // Standard public initializer
        public init(
            actors: [AppBskyActorDefs.ProfileViewBasic]
        ) {
            
            self.actors = actors
            
        }
    }
    



}

extension ATProtoClient.App.Bsky.Actor {
    /// Find actor suggestions for a prefix search term. 
    public func searchActorsTypeahead(input: AppBskyActorSearchActorsTypeahead.Parameters) async throws -> (responseCode: Int, data: AppBskyActorSearchActorsTypeahead.Output?) {
        let endpoint = "/app.bsky.actor.searchActorsTypeahead"
        
        
        // Convert input to query items
        let queryItems = input.asQueryItems()
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "GET", queryItems: queryItems)
        

        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(AppBskyActorSearchActorsTypeahead.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
