import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.repo.getRecord


public struct ComAtprotoRepoGetRecord { 
    public static let typeIdentifier = "com.atproto.repo.getRecord"        
public struct Parameters: Parametrizable {
            public let repo: String
            public let collection: String
            public let rkey: String
            public let cid: String?
            
            public init(
                repo: String, 
                collection: String, 
                rkey: String, 
                cid: String? = nil
                ) {
                self.repo = repo
                self.collection = collection
                self.rkey = rkey
                self.cid = cid
                
            }
        }    
    
public struct Output: Codable { 
        
        public let uri: ATProtocolURI
        
        public let cid: String?
        
        public let value: JSONValue
        
        
        // Standard public initializer
        public init(
            uri: ATProtocolURI, 
        
            cid: String? = nil, 
        
            value: JSONValue
        ) {
            
            self.uri = uri
            
            self.cid = cid
            
            self.value = value
            
        }
    }
    



}

extension ATProtoClient.Com.Atproto.Repo {
    /// Get a record. 
    public func getRecord(input: ComAtprotoRepoGetRecord.Parameters) async throws -> (responseCode: Int, data: ComAtprotoRepoGetRecord.Output?) {
        let endpoint = "/com.atproto.repo.getRecord"
        
        
        // Convert input to query items
        let queryItems = input.asQueryItems()
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "GET", queryItems: queryItems)
        

        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(ComAtprotoRepoGetRecord.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
