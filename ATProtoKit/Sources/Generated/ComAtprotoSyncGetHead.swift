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
public struct Output: Codable {
            public let root: String
                                    
            // Standard public initializer
            public init(root: String) {
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
        
        
        // Convert input to query items
        let queryItems = input.asQueryItems()
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "GET", queryItems: queryItems)
        

        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(ComAtprotoSyncGetHead.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
