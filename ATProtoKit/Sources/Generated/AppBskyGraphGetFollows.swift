import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.graph.getFollows


public struct AppBskyGraphGetFollows { 
    public static let typeIdentifier = "app.bsky.graph.getFollows"        
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
        
        public let follows: [AppBskyActorDefs.ProfileView]
        
        
        // Standard public initializer
        public init(
            subject: AppBskyActorDefs.ProfileView, 
        
            cursor: String? = nil, 
        
            follows: [AppBskyActorDefs.ProfileView]
        ) {
            
            self.subject = subject
            
            self.cursor = cursor
            
            self.follows = follows
            
        }
    }
    



}

extension ATProtoClient.App.Bsky.Graph {
    /// Get a list of who the actor follows. 
    public func getFollows(input: AppBskyGraphGetFollows.Parameters) async throws -> (responseCode: Int, data: AppBskyGraphGetFollows.Output?) {
        let endpoint = "/app.bsky.graph.getFollows"
        
        
        // Convert input to query items
        let queryItems = input.asQueryItems()
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "GET", queryItems: queryItems)
        

        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(AppBskyGraphGetFollows.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
