import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.repo.describeRepo


public struct ComAtprotoRepoDescribeRepo { 
    public static let typeIdentifier = "com.atproto.repo.describeRepo"        
public struct Parameters: Parametrizable {
            public let repo: String
            
            public init(
                repo: String
                ) {
                self.repo = repo
                
            }
        }    
    
public struct Output: Codable { 
        
        public let handle: String
        
        public let did: String
        
        public let didDoc: DIDDocument
        
        public let collections: [String]
        
        public let handleIsCorrect: Bool
        
        
        // Standard public initializer
        public init(
            handle: String, 
        
            did: String, 
        
            didDoc: DIDDocument, 
        
            collections: [String], 
        
            handleIsCorrect: Bool
        ) {
            
            self.handle = handle
            
            self.did = did
            
            self.didDoc = didDoc
            
            self.collections = collections
            
            self.handleIsCorrect = handleIsCorrect
            
        }
    }
    



}

extension ATProtoClient.Com.Atproto.Repo {
    /// Get information about the repo, including the list of collections. 
    public func describeRepo(input: ComAtprotoRepoDescribeRepo.Parameters) async throws -> (responseCode: Int, data: ComAtprotoRepoDescribeRepo.Output?) {
        let endpoint = "/com.atproto.repo.describeRepo"
        
        
        // Convert input to query items
        let queryItems = input.asQueryItems()
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "GET", queryItems: queryItems)
        

        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(ComAtprotoRepoDescribeRepo.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
