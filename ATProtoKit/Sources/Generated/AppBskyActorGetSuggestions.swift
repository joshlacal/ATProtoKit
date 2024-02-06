import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.actor.getSuggestions


public struct AppBskyActorGetSuggestions { 
    public static let typeIdentifier = "app.bsky.actor.getSuggestions"        
public struct Parameters: Parametrizable {
            public let limit: Int?
            public let cursor: String?
            
            public init(
                limit: Int? = nil, 
                cursor: String? = nil
                ) {
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
    /// Get a list of suggested actors, used for discovery. 
    public func getSuggestions(input: AppBskyActorGetSuggestions.Parameters) async throws -> (responseCode: Int, data: AppBskyActorGetSuggestions.Output?) {
        let endpoint = "/app.bsky.actor.getSuggestions"
        
        
        // Convert input to query items
        let queryItems = input.asQueryItems()
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "GET", queryItems: queryItems)
        

        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(AppBskyActorGetSuggestions.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
