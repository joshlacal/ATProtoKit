import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.sync.getCheckout


public struct ComAtprotoSyncGetCheckout { 
    public static let typeIdentifier = "com.atproto.sync.getCheckout"        
public struct Parameters: Parametrizable {
            public let did: String
            
            public init(
                did: String
                ) {
                self.did = did
                
            }
        }        
public struct Output: Codable {
                                    
            // Standard public initializer
            public init() {
                
            }

        }



}

extension ATProtoClient.Com.Atproto.Sync {
    /// DEPRECATED - please use com.atproto.sync.getRepo instead 
    public func getCheckout(input: ComAtprotoSyncGetCheckout.Parameters) async throws -> (responseCode: Int, data: ComAtprotoSyncGetCheckout.Output?) {
        let endpoint = "/com.atproto.sync.getCheckout"
        
        
        // Convert input to query items
        let queryItems = input.asQueryItems()
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "GET", queryItems: queryItems)
        

        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(ComAtprotoSyncGetCheckout.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
