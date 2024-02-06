import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.admin.searchRepos


public struct ComAtprotoAdminSearchRepos { 
    public static let typeIdentifier = "com.atproto.admin.searchRepos"        
public struct Parameters: Parametrizable {
            public let term: String?
            public let q: String?
            public let limit: Int?
            public let cursor: String?
            
            public init(
                term: String? = nil, 
                q: String? = nil, 
                limit: Int? = nil, 
                cursor: String? = nil
                ) {
                self.term = term
                self.q = q
                self.limit = limit
                self.cursor = cursor
                
            }
        }        
public struct Output: Codable {
            public let cursor: String?
            public let repos: [ComAtprotoAdminDefs.RepoView]
                                    
            // Standard public initializer
            public init(cursor: String? = nil, repos: [ComAtprotoAdminDefs.RepoView]) {
                self.cursor = cursor
                self.repos = repos
                
            }

        }



}

extension ATProtoClient.Com.Atproto.Admin {
    /// Find repositories based on a search term. 
    public func searchRepos(input: ComAtprotoAdminSearchRepos.Parameters) async throws -> (responseCode: Int, data: ComAtprotoAdminSearchRepos.Output?) {
        let endpoint = "/com.atproto.admin.searchRepos"
        
        
        // Convert input to query items
        let queryItems = input.asQueryItems()
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "GET", queryItems: queryItems)
        

        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(ComAtprotoAdminSearchRepos.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
