import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.sync.getBlocks


public struct ComAtprotoSyncGetBlocks { 
    public static let typeIdentifier = "com.atproto.sync.getBlocks"        
public struct Parameters: Parametrizable {
            public let did: String
            public let cids: [String]
            
            public init(
                did: String, 
                cids: [String]
                ) {
                self.did = did
                self.cids = cids
                
            }
        }        
public struct Output: Codable {
                                    
            // Standard public initializer
            public init() {
                
            }

        }



}

extension ATProtoClient.Com.Atproto.Sync {
    /// Get blocks from a given repo. 
    public func getBlocks(input: ComAtprotoSyncGetBlocks.Parameters) async throws -> (responseCode: Int, data: ComAtprotoSyncGetBlocks.Output?) {
        let endpoint = "/com.atproto.sync.getBlocks"
        
        
        // Convert input to query items
        let queryItems = input.asQueryItems()
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "GET", queryItems: queryItems)
        

        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(ComAtprotoSyncGetBlocks.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
