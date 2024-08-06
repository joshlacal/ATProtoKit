import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.graph.getKnownFollowers


public struct AppBskyGraphGetKnownFollowers { 

    public static let typeIdentifier = "app.bsky.graph.getKnownFollowers"    
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
    /// Enumerates accounts which follow a specified account (actor) and are followed by the viewer.
    public func getKnownFollowers(input: AppBskyGraphGetKnownFollowers.Parameters) async throws -> (responseCode: Int, data: AppBskyGraphGetKnownFollowers.Output?) {
        let endpoint = "/app.bsky.graph.getKnownFollowers"
        
        
        let queryItems = input.asQueryItems()
        let urlRequest = try await networkManager.createURLRequest(
            endpoint: endpoint, 
            method: "GET", 
            headers: [:],
            body: nil, 
            queryItems: queryItems
        )
        
        
        let (responseData, response) = try await networkManager.performRequest(urlRequest, retryCount: 0, duringInitialSetup: false)
        let responseCode = response.statusCode

        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(AppBskyGraphGetKnownFollowers.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
