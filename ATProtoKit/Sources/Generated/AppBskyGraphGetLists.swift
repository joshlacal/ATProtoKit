import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.graph.getLists


public struct AppBskyGraphGetLists { 
    public static let typeIdentifier = "app.bsky.graph.getLists"        
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
        
        public let cursor: String?
        
        public let lists: [AppBskyGraphDefs.ListView]
        
        
        // Standard public initializer
        public init(
            cursor: String? = nil, 
        
            lists: [AppBskyGraphDefs.ListView]
        ) {
            
            self.cursor = cursor
            
            self.lists = lists
            
        }
    }
    



}

extension ATProtoClient.App.Bsky.Graph {
    /// Enumerates the lists created by a specified account (actor).
    public func getLists(input: AppBskyGraphGetLists.Parameters) async throws -> (responseCode: Int, data: AppBskyGraphGetLists.Output?) {
        let endpoint = "/app.bsky.graph.getLists"
        
        
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
        let decodedData = try? decoder.decode(AppBskyGraphGetLists.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
