import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.sync.getHead


public struct ComAtprotoSyncGetHead { 
    public static let typeIdentifier = "com.atproto.sync.getHead"        
public struct Parameters: Parametrizable {
            public let did: String
            
            public init(
                did: String
                ) {
                self.did = did
                
            }
        }    
    
public struct Output: ATProtocolCodable { 
        
        public let root: String
        
        
        // Standard public initializer
        public init(
            root: String
        ) {
            
            self.root = root
            
        }
    }
            
public enum Error: String, Swift.Error, CustomStringConvertible {
                case headNotFound = "HeadNotFound."
            public var description: String {
                return self.rawValue
            }
        }



}

extension ATProtoClient.Com.Atproto.Sync {
    /// DEPRECATED - please use com.atproto.sync.getLatestCommit instead
    public func getHead(input: ComAtprotoSyncGetHead.Parameters) async throws -> (responseCode: Int, data: ComAtprotoSyncGetHead.Output?) {
        let endpoint = "/com.atproto.sync.getHead"
        
        
        let queryItems = input.asQueryItems()
        let urlRequest = try await networkManager.createURLRequest(
            endpoint: endpoint, 
            method: "GET", 
            headers: [:], // Typically, GET requests do not have a body
            body: nil, 
            queryItems: queryItems
        )
        
        
        let (responseData, response) = try await networkManager.performRequest(urlRequest)
        let responseCode = response.statusCode

        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(ComAtprotoSyncGetHead.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
