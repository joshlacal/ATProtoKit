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
    
public struct Output: ATProtocolCodable { 
        
        
        // Standard public initializer
        public init() {
            
        }
    }
    



}

extension ATProtoClient.Com.Atproto.Sync {
    /// Download a repository export as CAR file. Optionally only a 'diff' since a previous revision. Does not require auth; implemented by PDS.
    public func getRepo(input: ComAtprotoSyncGetRepo.Parameters) async throws -> (responseCode: Int, data: ComAtprotoSyncGetRepo.Output?) {
        let endpoint = "/com.atproto.sync.getRepo"
        
        
        let queryItems = input.asQueryItems()
        let urlRequest = try await networkManager.createURLRequest(
            endpoint: endpoint, 
            method: "GET", 
            headers: [:], // Typically, GET requests do not have a body
            body: nil, 
            queryItems: queryItems
        )
        
        
        let (responseData, response) = try await networkManager.performRequest(urlRequest, retryCount: 3, duringInitialSetup: false)
        let responseCode = response.statusCode

        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(ComAtprotoSyncGetRepo.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
