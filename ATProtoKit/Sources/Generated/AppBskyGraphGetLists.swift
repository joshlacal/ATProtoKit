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
public struct Output: Codable {
            public let cursor: String?
            public let lists: [AppBskyGraphDefs.ListView]
                                    
            // Standard public initializer
            public init(cursor: String? = nil, lists: [AppBskyGraphDefs.ListView]) {
                self.cursor = cursor
                self.lists = lists
                
            }

        }



}

extension ATProtoClient.App.Bsky.Graph {
    /// Get a list of lists that belong to an actor. 
    public func getLists(input: AppBskyGraphGetLists.Parameters) async throws -> (responseCode: Int, data: AppBskyGraphGetLists.Output?) {
        let endpoint = "/app.bsky.graph.getLists"
        
        
        // Convert input to query items
        let queryItems = input.asQueryItems()
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "GET", queryItems: queryItems)
        

        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(AppBskyGraphGetLists.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
