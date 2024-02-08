import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.sync.getRecord


public struct ComAtprotoSyncGetRecord { 
    public static let typeIdentifier = "com.atproto.sync.getRecord"        
public struct Parameters: Parametrizable {
            public let did: String
            public let collection: String
            public let rkey: String
            public let commit: String?
            
            public init(
                did: String, 
                collection: String, 
                rkey: String, 
                commit: String? = nil
                ) {
                self.did = did
                self.collection = collection
                self.rkey = rkey
                self.commit = commit
                
            }
        }    
    
public struct Output: Codable { 
        
        
        // Standard public initializer
        public init() {
            
        }
    }
    



}

extension ATProtoClient.Com.Atproto.Sync {
    /// Get blocks needed for existence or non-existence of record. 
    public func getRecord(input: ComAtprotoSyncGetRecord.Parameters) async throws -> (responseCode: Int, data: ComAtprotoSyncGetRecord.Output?) {
        let endpoint = "/com.atproto.sync.getRecord"
        
        
        // Convert input to query items
        let queryItems = input.asQueryItems()
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "GET", queryItems: queryItems)
        

        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(ComAtprotoSyncGetRecord.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
