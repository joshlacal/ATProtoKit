import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.server.deactivateAccount


public struct ComAtprotoServerDeactivateAccount { 

    public static let typeIdentifier = "com.atproto.server.deactivateAccount"        
public struct Input: ATProtocolCodable {
            public let deleteAfter: ATProtocolDate?

            // Standard public initializer
            public init(deleteAfter: ATProtocolDate? = nil) {
                self.deleteAfter = deleteAfter
                
            }
        }



}
extension ATProtoClient.Com.Atproto.Server {
    /// Deactivates a currently active account. Stops serving of repo, and future writes to repo until reactivated. Used to finalize account migration with the old host after the account has been activated on the new host.
    public func deactivateAccount(input: ComAtprotoServerDeactivateAccount.Input, duringInitialSetup: Bool = false) async throws -> Int {
        let endpoint = "/com.atproto.server.deactivateAccount"
        
        
        let requestData = try JSONEncoder().encode(input)
        
        
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
                           
