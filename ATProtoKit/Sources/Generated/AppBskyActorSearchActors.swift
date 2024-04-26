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
    
public struct Output: ATProtocolCodable { 
        
        public let cursor: String?
        
        public let actors: [AppBskyActorDefs.ProfileView]
        
        
        // Standard public initializer
        public init(
            cursor: String? = nil, 
        
            actors: [AppBskyActorDefs.ProfileView]
        ) {
            
            self.cursor = cursor
            
            self.actors = actors
            
        }
    }
    



}

extension ATProtoClient.App.Bsky.Actor {
    /// Find actors (profiles) matching search criteria. Does not require auth.
    public func searchActors(input: AppBskyActorSearchActors.Parameters) async throws -> (responseCode: Int, data: AppBskyActorSearchActors.Output?) {
        let endpoint = "/app.bsky.actor.searchActors"
        
        
        let queryItems = input.asQueryItems()
        let urlRequest = try await networkManager.createURLRequest(
            endpoint: endpoint, 
            method: "GET", 
            headers: [:], // Typically, GET requests do not have a body
            body: nil, 
            queryItems: queryItems
        )
        
        
        let (responseData, response) = try await networkManager.performRequest(urlRequest, retryCount: 3, duringInitialSetup: false)
        let responseCode = response.statusCode

        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(AppBskyActorSearchActors.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
