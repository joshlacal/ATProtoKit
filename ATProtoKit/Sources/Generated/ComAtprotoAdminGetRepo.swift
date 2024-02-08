import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.admin.getRepo


public struct ComAtprotoAdminGetRepo { 
    public static let typeIdentifier = "com.atproto.admin.getRepo"        
public struct Parameters: Parametrizable {
            public let did: String
            
            public init(
                did: String
                ) {
                self.did = did
                
            }
        }    
    public typealias Output = ComAtprotoAdminDefs.RepoViewDetail
            
public enum Error: String, Swift.Error, CustomStringConvertible {
                case repoNotFound = "RepoNotFound."
            public var description: String {
                return self.rawValue
            }
        }



}

extension ATProtoClient.Com.Atproto.Admin {
    /// Get details about a repository. 
    public func getRepo(input: ComAtprotoAdminGetRepo.Parameters) async throws -> (responseCode: Int, data: ComAtprotoAdminGetRepo.Output?) {
        let endpoint = "/com.atproto.admin.getRepo"
        
        
        // Convert input to query items
        let queryItems = input.asQueryItems()
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "GET", queryItems: queryItems)
        

        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(ComAtprotoAdminGetRepo.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
