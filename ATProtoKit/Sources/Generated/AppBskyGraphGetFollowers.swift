import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.graph.getFollowers


public struct AppBskyGraphGetFollowers { 
    public static let typeIdentifier = "app.bsky.graph.getFollowers"        
public struct Parameters: Parametrizable {
            public let actor: String
            public let limit: Int?
            public let cursor: String?
            
            public init(
                actor: String, 
                limit: Int? = nil, 
                cursor: String? = nil
                ) {
                self.actor = actor
                self.limit = limit
                self.cursor = cursor
                
            }
        }        
public struct Output: Codable {
            public let subject: AppBskyActorDefs.ProfileView
            public let cursor: String?
            public let followers: [AppBskyActorDefs.ProfileView]
                                    
            // Standard public initializer
            public init(subject: AppBskyActorDefs.ProfileView, cursor: String? = nil, followers: [AppBskyActorDefs.ProfileView]) {
                self.subject = subject
                self.cursor = cursor
                self.followers = followers
                
            }

        }



}

extension ATProtoClient.App.Bsky.Graph {
    /// Get a list of an actor's followers. 
    public func getFollowers(input: AppBskyGraphGetFollowers.Parameters) async throws -> (responseCode: Int, data: AppBskyGraphGetFollowers.Output?) {
        let endpoint = "/app.bsky.graph.getFollowers"
        
        
        // Convert input to query items
        let queryItems = input.asQueryItems()
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "GET", queryItems: queryItems)
        

        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(AppBskyGraphGetFollowers.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
