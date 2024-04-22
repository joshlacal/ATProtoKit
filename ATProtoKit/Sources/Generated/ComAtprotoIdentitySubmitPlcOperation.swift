import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.identity.submitPlcOperation


public struct ComAtprotoIdentitySubmitPlcOperation { 
    public static let typeIdentifier = "com.atproto.identity.submitPlcOperation"        
public struct Input: ATProtocolCodable {
            public let operation: ATProtocolValueContainer

            // Standard public initializer
            public init(operation: ATProtocolValueContainer) {
                self.operation = operation
                
            }
        }



}
extension ATProtoClient.Com.Atproto.Identity {
    /// Validates a PLC operation to ensure that it doesn't violate a service's constraints or get the identity into a bad state, then submits it to the PLC registry
    public func submitPlcOperation(input: ComAtprotoIdentitySubmitPlcOperation.Input) async throws -> Int {
        let endpoint = "/com.atproto.identity.submitPlcOperation"
        
        
        let requestData = try JSONEncoder().encode(input)
        
        
        let urlRequest = try await networkManager.createURLRequest(
            endpoint: endpoint, 
            method: "POST", 
            headers: ["Content-Type": "application/json"], 
            body: requestData,
            queryItems: nil
        )
        
        let (responseData, response) = try await networkManager.performRequest(urlRequest)
        let responseCode = response.statusCode

        
        // Return only the response code if no output type is expected
        return responseCode
        
    }
}
                           
