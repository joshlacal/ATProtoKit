import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.sync.listBlobs


public struct ComAtprotoSyncListBlobs { 
    public static let typeIdentifier = "com.atproto.sync.listBlobs"        
public struct Parameters: Parametrizable {
            public let did: String
            public let since: String?
            public let limit: Int?
            public let cursor: String?
            
            public init(
                did: String, 
                since: String? = nil, 
                limit: Int? = nil, 
                cursor: String? = nil
                ) {
                self.did = did
                self.since = since
                self.limit = limit
                self.cursor = cursor
                
            }
        }        
public struct Output: Codable {
            public let cursor: String?
            public let cids: [String]
                                    
            // Standard public initializer
            public init(cursor: String? = nil, cids: [String]) {
                self.cursor = cursor
                self.cids = cids
                
            }

        }



}

extension ATProtoClient.Com.Atproto.Sync {
    /// List blob CIDs since some revision. 
    public func listBlobs(input: ComAtprotoSyncListBlobs.Parameters) async throws -> (responseCode: Int, data: ComAtprotoSyncListBlobs.Output?) {
        let endpoint = "/com.atproto.sync.listBlobs"
        
        
        // Convert input to query items
        let queryItems = input.asQueryItems()
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "GET", queryItems: queryItems)
        

        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(ComAtprotoSyncListBlobs.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
