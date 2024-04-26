import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.sync.getBlocks


public struct ComAtprotoSyncGetBlocks { 
    public static let typeIdentifier = "com.atproto.sync.getBlocks"        
public struct Parameters: Parametrizable {
            public let did: String
            public let cids: [String]
            
            public init(
                did: String, 
                cids: [String]
                ) {
                self.did = did
                self.cids = cids
                
            }
        }    
    
public struct Output: ATProtocolCodable { 
        
        
        // Standard public initializer
        public init() {
            
        }
    }
    



}

extension ATProtoClient.Com.Atproto.Sync {
    /// Get data blocks from a given repo, by CID. For example, intermediate MST nodes, or records. Does not require auth; implemented by PDS.
    public func getBlocks(input: ComAtprotoSyncGetBlocks.Parameters) async throws -> (responseCode: Int, data: ComAtprotoSyncGetBlocks.Output?) {
        let endpoint = "/com.atproto.sync.getBlocks"
        
        
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
        let decodedData = try? decoder.decode(ComAtprotoSyncGetBlocks.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
