import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.graph.getBlocks


public struct AppBskyGraphGetBlocks { 
    public static let typeIdentifier = "app.bsky.graph.getBlocks"        
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
        
        public let blocks: [AppBskyActorDefs.ProfileView]
        
        
        // Standard public initializer
        public init(
            cursor: String? = nil, 
        
            blocks: [AppBskyActorDefs.ProfileView]
        ) {
            
            self.cursor = cursor
            
            self.blocks = blocks
            
        }
    }
    



}

extension ATProtoClient.App.Bsky.Graph {
    /// Get a list of who the actor is blocking. 
    public func getBlocks(input: AppBskyGraphGetBlocks.Parameters) async throws -> (responseCode: Int, data: AppBskyGraphGetBlocks.Output?) {
        let endpoint = "/app.bsky.graph.getBlocks"
        
        
        // Convert input to query items
        let queryItems = input.asQueryItems()
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "GET", queryItems: queryItems)
        

        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(AppBskyGraphGetBlocks.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
