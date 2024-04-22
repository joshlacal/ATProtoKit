import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.identity.requestPlcOperationSignature


public struct ComAtprotoIdentityRequestPlcOperationSignature { 
    public static let typeIdentifier = "com.atproto.identity.requestPlcOperationSignature"



}
extension ATProtoClient.Com.Atproto.Identity {
    /// Request an email with a code to in order to request a signed PLC operation. Requires Auth.
    public func requestPlcOperationSignature() async throws -> Int {
        let endpoint = "/com.atproto.identity.requestPlcOperationSignature"
        
        
        let requestData: Data? = nil
        
        
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
                           
