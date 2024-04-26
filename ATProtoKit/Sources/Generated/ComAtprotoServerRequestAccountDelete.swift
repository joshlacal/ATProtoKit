import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.server.requestAccountDelete


public struct ComAtprotoServerRequestAccountDelete { 
    public static let typeIdentifier = "com.atproto.server.requestAccountDelete"



}
extension ATProtoClient.Com.Atproto.Server {
    /// Initiate a user account deletion via email.
    public func requestAccountDelete() async throws -> Int {
        let endpoint = "/com.atproto.server.requestAccountDelete"
        
        
        let requestData: Data? = nil
        
        
        let urlRequest = try await networkManager.createURLRequest(
            endpoint: endpoint, 
            method: "POST", 
            headers: ["Content-Type": "application/json"], 
            body: requestData,
            queryItems: nil
        )
        
        let (responseData, response) = try await networkManager.performRequest(urlRequest, retryCount: 3, duringInitialSetup: false)
        let responseCode = response.statusCode

        
        // Return only the response code if no output type is expected
        return responseCode
        
    }
}
                           
