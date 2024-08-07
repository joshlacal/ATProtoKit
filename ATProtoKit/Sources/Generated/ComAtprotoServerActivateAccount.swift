import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.server.activateAccount


public struct ComAtprotoServerActivateAccount { 

    public static let typeIdentifier = "com.atproto.server.activateAccount"



}
extension ATProtoClient.Com.Atproto.Server {
    /// Activates a currently deactivated account. Used to finalize account migration after the account's repo is imported and identity is setup.
    
    public func activateAccount( duringInitialSetup: Bool = false) async throws -> Int {
        let endpoint = "/com.atproto.server.activateAccount"
        
        
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
                           
