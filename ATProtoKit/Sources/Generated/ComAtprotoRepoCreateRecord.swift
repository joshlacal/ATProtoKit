import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.repo.createRecord


public struct ComAtprotoRepoCreateRecord { 
    public static let typeIdentifier = "com.atproto.repo.createRecord"        
public struct Input: Codable {
            public let repo: String
            public let collection: String
            public let rkey: String?
            public let validate: Bool?
            public let record: JSONValue
            public let swapCommit: String?

            // Standard public initializer
            public init(repo: String, collection: String, rkey: String? = nil, validate: Bool? = nil, record: JSONValue, swapCommit: String? = nil) {
                self.repo = repo
                self.collection = collection
                self.rkey = rkey
                self.validate = validate
                self.record = record
                self.swapCommit = swapCommit
                
            }
        }    
    
public struct Output: Codable { 
        
        public let uri: ATProtocolURI
        
        public let cid: String
        
        
        // Standard public initializer
        public init(
            uri: ATProtocolURI, 
        
            cid: String
        ) {
            
            self.uri = uri
            
            self.cid = cid
            
        }
    }
            
public enum Error: String, Swift.Error, CustomStringConvertible {
                case invalidSwap = "InvalidSwap."
            public var description: String {
                return self.rawValue
            }
        }



}
extension ATProtoClient.Com.Atproto.Repo {
    /// Create a new record.
    public func createRecord(input: ComAtprotoRepoCreateRecord.Input) async throws -> (responseCode: Int, data: ComAtprotoRepoCreateRecord.Output?) {
        let endpoint = "/com.atproto.repo.createRecord"
        
        let requestData = try JSONEncoder().encode(input)
        
        
        // Perform the network request
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "POST", body: requestData)

        
        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(ComAtprotoRepoCreateRecord.Output.self, from: responseData)
        return (responseCode, decodedData)
        
    }
}
                           
