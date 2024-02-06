import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.actor.searchActors


public struct AppBskyActorSearchActors { 
    public static let typeIdentifier = "app.bsky.actor.searchActors"        
public struct Parameters: Parametrizable {
            public let term: String?
            public let q: String?
            public let limit: Int?
            public let cursor: String?
            
            public init(
                term: String? = nil, 
                q: String? = nil, 
                limit: Int? = nil, 
                cursor: String? = nil
                ) {
                self.term = term
                self.q = q
                self.limit = limit
                self.cursor = cursor
                
            }
        }        
public struct Output: Codable {
            public let cursor: String?
            public let actors: [AppBskyActorDefs.ProfileView]
                                    
            // Standard public initializer
            public init(cursor: String? = nil, actors: [AppBskyActorDefs.ProfileView]) {
                self.cursor = cursor
                self.actors = actors
                
            }

        }



}

extension ATProtoClient.App.Bsky.Actor {
    /// Find actors (profiles) matching search criteria. 
    public func searchActors(input: AppBskyActorSearchActors.Parameters) async throws -> (responseCode: Int, data: AppBskyActorSearchActors.Output?) {
        let endpoint = "/app.bsky.actor.searchActors"
        
        
        // Convert input to query items
        let queryItems = input.asQueryItems()
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "GET", queryItems: queryItems)
        

        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(AppBskyActorSearchActors.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
