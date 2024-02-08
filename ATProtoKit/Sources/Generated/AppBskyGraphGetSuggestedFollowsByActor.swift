import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.graph.getSuggestedFollowsByActor


public struct AppBskyGraphGetSuggestedFollowsByActor { 
    public static let typeIdentifier = "app.bsky.graph.getSuggestedFollowsByActor"        
public struct Parameters: Parametrizable {
            public let actor: String
            
            public init(
                actor: String
                ) {
                self.actor = actor
                
            }
        }    
    
public struct Output: Codable { 
        
        public let suggestions: [AppBskyActorDefs.ProfileView]
        
        
        // Standard public initializer
        public init(
            suggestions: [AppBskyActorDefs.ProfileView]
        ) {
            
            self.suggestions = suggestions
            
        }
    }
    



}

extension ATProtoClient.App.Bsky.Graph {
    /// Get suggested follows related to a given actor. 
    public func getSuggestedFollowsByActor(input: AppBskyGraphGetSuggestedFollowsByActor.Parameters) async throws -> (responseCode: Int, data: AppBskyGraphGetSuggestedFollowsByActor.Output?) {
        let endpoint = "/app.bsky.graph.getSuggestedFollowsByActor"
        
        
        // Convert input to query items
        let queryItems = input.asQueryItems()
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "GET", queryItems: queryItems)
        

        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(AppBskyGraphGetSuggestedFollowsByActor.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
