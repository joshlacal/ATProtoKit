import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.graph.getMutes


public struct AppBskyGraphGetMutes { 
    public static let typeIdentifier = "app.bsky.graph.getMutes"        
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
        
        public let mutes: [AppBskyActorDefs.ProfileView]
        
        
        // Standard public initializer
        public init(
            cursor: String? = nil, 
        
            mutes: [AppBskyActorDefs.ProfileView]
        ) {
            
            self.cursor = cursor
            
            self.mutes = mutes
            
        }
    }
    



}

extension ATProtoClient.App.Bsky.Graph {
    /// Get a list of who the actor mutes. 
    public func getMutes(input: AppBskyGraphGetMutes.Parameters) async throws -> (responseCode: Int, data: AppBskyGraphGetMutes.Output?) {
        let endpoint = "/app.bsky.graph.getMutes"
        
        
        // Convert input to query items
        let queryItems = input.asQueryItems()
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "GET", queryItems: queryItems)
        

        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(AppBskyGraphGetMutes.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
