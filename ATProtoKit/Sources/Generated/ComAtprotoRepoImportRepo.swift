import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.repo.importRepo


public struct ComAtprotoRepoImportRepo { 

    public static let typeIdentifier = "com.atproto.repo.importRepo"



}
extension ATProtoClient.Com.Atproto.Repo {
    /// Import a repo in the form of a CAR file. Requires Content-Length HTTP header to be set.
    
    public func importRepo( duringInitialSetup: Bool = false) async throws -> Int {
        let endpoint = "/com.atproto.repo.importRepo"
        
        
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
                           
