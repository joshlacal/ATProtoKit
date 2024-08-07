import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.repo.putRecord


public struct ComAtprotoRepoPutRecord { 

    public static let typeIdentifier = "com.atproto.repo.putRecord"        
public struct Input: ATProtocolCodable {
            public let repo: String
            public let collection: String
            public let rkey: String
            public let validate: Bool?
            public let record: ATProtocolValueContainer
            public let swapRecord: String?
            public let swapCommit: String?

            // Standard public initializer
            public init(repo: String, collection: String, rkey: String, validate: Bool? = nil, record: ATProtocolValueContainer, swapRecord: String? = nil, swapCommit: String? = nil) {
                self.repo = repo
                self.collection = collection
                self.rkey = rkey
                self.validate = validate
                self.record = record
                self.swapRecord = swapRecord
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
                case invalidSwap = "InvalidSwap."
            public var description: String {
                return self.rawValue
            }
        }



}
extension ATProtoClient.Com.Atproto.Repo {
    /// Write a repository record, creating or updating it as needed. Requires auth, implemented by PDS.
    
    public func putRecord(input: ComAtprotoRepoPutRecord.Input, duringInitialSetup: Bool = false) async throws -> (responseCode: Int, data: ComAtprotoRepoPutRecord.Output?) {
        let endpoint = "/com.atproto.repo.putRecord"
        
        
        let requestData = try JSONEncoder().encode(input)
        
        
        let urlRequest = try await networkManager.createURLRequest(
            endpoint: endpoint, 
            method: "POST", 
            headers: ["Content-Type": "application/json"], 
            body: requestData,
            queryItems: nil
        )
    
        
        let (responseData, response) = try await networkManager.performRequest(urlRequest, retryCount: 0, duringInitialSetup: duringInitialSetup)
        let responseCode = response.statusCode
        
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(ComAtprotoRepoPutRecord.Output.self, from: responseData)
        return (responseCode, decodedData)
        
    }
}
                           
