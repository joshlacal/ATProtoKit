import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.repo.createRecord


public struct ComAtprotoRepoCreateRecord { 
    public static let typeIdentifier = "com.atproto.repo.createRecord"        
public struct Input: ATProtocolCodable {
            public let repo: String
            public let collection: String
            public let rkey: String?
            public let validate: Bool?
            public let record: ATProtocolValueContainer
            public let swapCommit: String?

            // Standard public initializer
            public init(repo: String, collection: String, rkey: String? = nil, validate: Bool? = nil, record: ATProtocolValueContainer, swapCommit: String? = nil) {
                self.repo = repo
                self.collection = collection
                self.rkey = rkey
                self.validate = validate
                self.record = record
                self.swapCommit = swapCommit
                
            }
        }    
    
public struct Output: ATProtocolCodable { 
        
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
                case invalidSwap = "InvalidSwap.Indicates that 'swapCommit' didn't match current repo commit."
            public var description: String {
                return self.rawValue
            }
        }



}
extension ATProtoClient.Com.Atproto.Repo {
    /// Create a single new repository record. Requires auth, implemented by PDS.
    public func createRecord(input: ComAtprotoRepoCreateRecord.Input) async throws -> (responseCode: Int, data: ComAtprotoRepoCreateRecord.Output?) {
        let endpoint = "/com.atproto.repo.createRecord"
        
        
        let requestData = try JSONEncoder().encode(input)
        
        
        let urlRequest = try await networkManager.createURLRequest(
            endpoint: endpoint, 
            method: "POST", 
            headers: ["Content-Type": "application/json"], 
            body: requestData,
            queryItems: nil
        )
        
        let (responseData, response) = try await networkManager.performRequest(urlRequest)
        let responseCode = response.statusCode

        
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(ComAtprotoRepoCreateRecord.Output.self, from: responseData)
        return (responseCode, decodedData)
        
    }
}
                           
