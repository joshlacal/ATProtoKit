import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.sync.getRepo


public struct ComAtprotoSyncGetRepo { 
    public static let typeIdentifier = "com.atproto.sync.getRepo"        
public struct Parameters: Parametrizable {
            public let did: String
            public let since: String?
            
            public init(
                did: String, 
                since: String? = nil
                ) {
                self.did = did
                self.since = since
                
            }
        }    
    
public struct Output: Codable { 
        
        
        // Standard public initializer
        public init() {
            
        }
    }
    



}

extension ATProtoClient.Com.Atproto.Sync {
    /// Gets the DID's repo, optionally catching up from a specific revision. 
    public func getRepo(input: ComAtprotoSyncGetRepo.Parameters) async throws -> (responseCode: Int, data: ComAtprotoSyncGetRepo.Output?) {
        let endpoint = "/com.atproto.sync.getRepo"
        
        
        // Convert input to query items
        let queryItems = input.asQueryItems()
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "GET", queryItems: queryItems)
        

        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(ComAtprotoSyncGetRepo.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
