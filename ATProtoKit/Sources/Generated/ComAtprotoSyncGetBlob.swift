import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.sync.getBlob


public struct ComAtprotoSyncGetBlob { 
    public static let typeIdentifier = "com.atproto.sync.getBlob"        
public struct Parameters: Parametrizable {
            public let did: String
            public let cid: String
            
            public init(
                did: String, 
                cid: String
                ) {
                self.did = did
                self.cid = cid
                
            }
        }        
public struct Output: Codable {
            public let data: Data
                                    
            // Standard public initializer
            public init(data: Data) {
                self.data = data
                
            }

        }



}

extension ATProtoClient.Com.Atproto.Sync {
    /// Get a blob associated with a given repo. 
    public func getBlob(input: ComAtprotoSyncGetBlob.Parameters) async throws -> (responseCode: Int, data: ComAtprotoSyncGetBlob.Output?) {
        let endpoint = "/com.atproto.sync.getBlob"
        
        
        // Convert input to query items
        let queryItems = input.asQueryItems()
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "GET", queryItems: queryItems)
        

        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(ComAtprotoSyncGetBlob.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
