import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.server.requestAccountDelete


public struct ComAtprotoServerRequestAccountDelete { 

    public static let typeIdentifier = "com.atproto.server.requestAccountDelete"



}
extension ATProtoClient.Com.Atproto.Server {
    /// Initiate a user account deletion via email.
    
    public func requestAccountDelete( duringInitialSetup: Bool = false) async throws -> Int {
        let endpoint = "/com.atproto.server.requestAccountDelete"
        
        
        let requestData: Data? = nil
        
        
        let urlRequest = try await networkManager.createURLRequest(
            endpoint: endpoint, 
            method: "POST", 
            headers: ["Content-Type": "application/json"], 
            body: requestData,
            queryItems: nil
        )
    
        
        let (responseData, response) = try await networkManager.performRequest(urlRequest, retryCount: 0, duringInitialSetup: duringInitialSetup)
        let responseCode = response.statusCode
        
        return responseCode
        
    }
}
                           
