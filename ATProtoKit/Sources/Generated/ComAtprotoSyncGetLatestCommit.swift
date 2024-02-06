import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.sync.getLatestCommit


public struct ComAtprotoSyncGetLatestCommit { 
    public static let typeIdentifier = "com.atproto.sync.getLatestCommit"        
public struct Parameters: Parametrizable {
            public let did: String
            
            public init(
                did: String
                ) {
                self.did = did
                
            }
        }        
public struct Output: Codable {
            public let cid: String
            public let rev: String
                                    
            // Standard public initializer
            public init(cid: String, rev: String) {
                self.cid = cid
                self.rev = rev
                
            }

        }        
public enum Error: String, Swift.Error, CustomStringConvertible {
                case repoNotFound = "RepoNotFound."
            public var description: String {
                return self.rawValue
            }
        }



}

extension ATProtoClient.Com.Atproto.Sync {
    /// Get the current commit CID & revision of the repo. 
    public func getLatestCommit(input: ComAtprotoSyncGetLatestCommit.Parameters) async throws -> (responseCode: Int, data: ComAtprotoSyncGetLatestCommit.Output?) {
        let endpoint = "/com.atproto.sync.getLatestCommit"
        
        
        // Convert input to query items
        let queryItems = input.asQueryItems()
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "GET", queryItems: queryItems)
        

        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(ComAtprotoSyncGetLatestCommit.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
