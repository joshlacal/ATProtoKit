import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.server.deleteSession


public struct ComAtprotoServerDeleteSession { 

    public static let typeIdentifier = "com.atproto.server.deleteSession"



}
extension ATProtoClient.Com.Atproto.Server {
    /// Delete the current session. Requires auth.
    public func deleteSession( duringInitialSetup: Bool = false) async throws -> Int {
        let endpoint = "/com.atproto.server.deleteSession"
        
        
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
                           
