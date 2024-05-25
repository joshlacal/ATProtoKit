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
    
public struct Output: ATProtocolCodable { 
        
        public let uri: ATProtocolURI
        
        public let cid: String?
        
        public let value: ATProtocolValueContainer
        
        
        // Standard public initializer
        public init(
            uri: ATProtocolURI, 
        
            cid: String? = nil, 
        
            value: ATProtocolValueContainer
        ) {
            
            self.uri = uri
            
            self.cid = cid
            
            self.value = value
            
        }
    }
    



}

extension ATProtoClient.Com.Atproto.Repo {
    /// Get a single record from a repository. Does not require auth.
    public func getRecord(input: ComAtprotoRepoGetRecord.Parameters) async throws -> (responseCode: Int, data: ComAtprotoRepoGetRecord.Output?) {
        let endpoint = "/com.atproto.repo.getRecord"
        
        
        let queryItems = input.asQueryItems()
        let urlRequest = try await networkManager.createURLRequest(
            endpoint: endpoint, 
            method: "GET", 
            headers: [:],
            body: nil, 
            queryItems: queryItems
        )
        
        
        let (responseData, response) = try await networkManager.performRequest(urlRequest, retryCount: 0, duringInitialSetup: false)
        let responseCode = response.statusCode

        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(ComAtprotoRepoGetRecord.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
