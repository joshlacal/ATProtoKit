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
    
public struct Output: ATProtocolCodable { 
        
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
    /// Enumerates follows similar to a given account (actor). Expected use is to recommend additional accounts immediately after following one account.
    public func getSuggestedFollowsByActor(input: AppBskyGraphGetSuggestedFollowsByActor.Parameters) async throws -> (responseCode: Int, data: AppBskyGraphGetSuggestedFollowsByActor.Output?) {
        let endpoint = "/app.bsky.graph.getSuggestedFollowsByActor"
        
        
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
        let decodedData = try? decoder.decode(AppBskyGraphGetSuggestedFollowsByActor.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
