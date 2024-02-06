import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.graph.getListBlocks


public struct AppBskyGraphGetListBlocks { 
    public static let typeIdentifier = "app.bsky.graph.getListBlocks"        
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
            public let lists: [AppBskyGraphDefs.ListView]
                                    
            // Standard public initializer
            public init(cursor: String? = nil, lists: [AppBskyGraphDefs.ListView]) {
                self.cursor = cursor
                self.lists = lists
                
            }

        }



}

extension ATProtoClient.App.Bsky.Graph {
    /// Get lists that the actor is blocking. 
    public func getListBlocks(input: AppBskyGraphGetListBlocks.Parameters) async throws -> (responseCode: Int, data: AppBskyGraphGetListBlocks.Output?) {
        let endpoint = "/app.bsky.graph.getListBlocks"
        
        
        // Convert input to query items
        let queryItems = input.asQueryItems()
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "GET", queryItems: queryItems)
        

        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(AppBskyGraphGetListBlocks.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
