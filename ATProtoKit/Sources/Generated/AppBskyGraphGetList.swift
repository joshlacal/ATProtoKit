import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.graph.getList


public struct AppBskyGraphGetList { 
    public static let typeIdentifier = "app.bsky.graph.getList"        
public struct Parameters: Parametrizable {
            public let list: ATProtocolURI
            public let limit: Int?
            public let cursor: String?
            
            public init(
                list: ATProtocolURI, 
                limit: Int? = nil, 
                cursor: String? = nil
                ) {
                self.list = list
                self.limit = limit
                self.cursor = cursor
                
            }
        }    
    
public struct Output: Codable { 
        
        public let cursor: String?
        
        public let list: AppBskyGraphDefs.ListView
        
        public let items: [AppBskyGraphDefs.ListItemView]
        
        
        // Standard public initializer
        public init(
            cursor: String? = nil, 
        
            list: AppBskyGraphDefs.ListView, 
        
            items: [AppBskyGraphDefs.ListItemView]
        ) {
            
            self.cursor = cursor
            
            self.list = list
            
            self.items = items
            
        }
    }
    



}

extension ATProtoClient.App.Bsky.Graph {
    /// Get a list of actors. 
    public func getList(input: AppBskyGraphGetList.Parameters) async throws -> (responseCode: Int, data: AppBskyGraphGetList.Output?) {
        let endpoint = "/app.bsky.graph.getList"
        
        
        // Convert input to query items
        let queryItems = input.asQueryItems()
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "GET", queryItems: queryItems)
        

        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(AppBskyGraphGetList.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
