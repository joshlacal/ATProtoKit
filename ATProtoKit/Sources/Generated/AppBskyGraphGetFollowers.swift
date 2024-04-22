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
    
public struct Output: ATProtocolCodable { 
        
        public let subject: AppBskyActorDefs.ProfileView
        
        public let cursor: String?
        
        public let followers: [AppBskyActorDefs.ProfileView]
        
        
        // Standard public initializer
        public init(
            subject: AppBskyActorDefs.ProfileView, 
        
            cursor: String? = nil, 
        
            followers: [AppBskyActorDefs.ProfileView]
        ) {
            
            self.subject = subject
            
            self.cursor = cursor
            
            self.followers = followers
            
        }
    }
    



}

extension ATProtoClient.App.Bsky.Graph {
    /// Enumerates accounts which follow a specified account (actor).
    public func getFollowers(input: AppBskyGraphGetFollowers.Parameters) async throws -> (responseCode: Int, data: AppBskyGraphGetFollowers.Output?) {
        let endpoint = "/app.bsky.graph.getFollowers"
        
        
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
        let decodedData = try? decoder.decode(AppBskyGraphGetFollowers.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
