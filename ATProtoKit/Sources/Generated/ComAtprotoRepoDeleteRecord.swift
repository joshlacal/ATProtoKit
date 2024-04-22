import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.repo.deleteRecord


public struct ComAtprotoRepoDeleteRecord { 
    public static let typeIdentifier = "com.atproto.repo.deleteRecord"        
public struct Input: ATProtocolCodable {
            public let repo: String
            public let collection: String
            public let rkey: String
            public let swapRecord: String?
            public let swapCommit: String?

            // Standard public initializer
            public init(repo: String, collection: String, rkey: String, swapRecord: String? = nil, swapCommit: String? = nil) {
                self.repo = repo
                self.collection = collection
                self.rkey = rkey
                self.swapRecord = swapRecord
                self.swapCommit = swapCommit
                
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
    /// Delete a repository record, or ensure it doesn't exist. Requires auth, implemented by PDS.
    public func deleteRecord(input: ComAtprotoRepoDeleteRecord.Input) async throws -> Int {
        let endpoint = "/com.atproto.repo.deleteRecord"
        
        
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

        
        // Return only the response code if no output type is expected
        return responseCode
        
    }
}
                           
