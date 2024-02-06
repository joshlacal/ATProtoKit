import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.identity.resolveHandle


public struct ComAtprotoIdentityResolveHandle { 
    public static let typeIdentifier = "com.atproto.identity.resolveHandle"        
public struct Parameters: Parametrizable {
            public let handle: String
            
            public init(
                handle: String
                ) {
                self.handle = handle
                
            }
        }        
public struct Output: Codable {
            public let did: String
                                    
            // Standard public initializer
            public init(did: String) {
                self.did = did
                
            }

        }



}

extension ATProtoClient.Com.Atproto.Identity {
    /// Provides the DID of a repo. 
    public func resolveHandle(input: ComAtprotoIdentityResolveHandle.Parameters) async throws -> (responseCode: Int, data: ComAtprotoIdentityResolveHandle.Output?) {
        let endpoint = "/com.atproto.identity.resolveHandle"
        
        
        // Convert input to query items
        let queryItems = input.asQueryItems()
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "GET", queryItems: queryItems)
        

        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(ComAtprotoIdentityResolveHandle.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
