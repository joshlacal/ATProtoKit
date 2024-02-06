import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.repo.deleteRecord


public struct ComAtprotoRepoDeleteRecord { 
    public static let typeIdentifier = "com.atproto.repo.deleteRecord"        
public struct Input: Codable {
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
    /// Delete a record, or ensure it doesn't exist.
    public func deleteRecord(input: ComAtprotoRepoDeleteRecord.Input) async throws -> Int {
        let endpoint = "/com.atproto.repo.deleteRecord"
        
        let requestData = try JSONEncoder().encode(input)
        
        
        // Perform the network request
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "POST", body: requestData)

        
        // Return only the response code if no output type is expected
        return responseCode
        
    }
}
                           
