import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.server.reserveSigningKey


public struct ComAtprotoServerReserveSigningKey { 
    public static let typeIdentifier = "com.atproto.server.reserveSigningKey"        
public struct Input: Codable {
            public let did: String?

            // Standard public initializer
            public init(did: String? = nil) {
                self.did = did
                
            }
        }        
public struct Output: Codable {
            public let signingKey: String
                                    
            // Standard public initializer
            public init(signingKey: String) {
                self.signingKey = signingKey
                
            }

        }



}
extension ATProtoClient.Com.Atproto.Server {
    /// Reserve a repo signing key for account creation.
    public func reserveSigningKey(input: ComAtprotoServerReserveSigningKey.Input) async throws -> (responseCode: Int, data: ComAtprotoServerReserveSigningKey.Output?) {
        let endpoint = "/com.atproto.server.reserveSigningKey"
        
        let requestData = try JSONEncoder().encode(input)
        
        
        // Perform the network request
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "POST", body: requestData)

        
        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(ComAtprotoServerReserveSigningKey.Output.self, from: responseData)
        return (responseCode, decodedData)
        
    }
}
                           
