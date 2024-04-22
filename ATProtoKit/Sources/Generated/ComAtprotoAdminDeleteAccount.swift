import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.admin.deleteAccount


public struct ComAtprotoAdminDeleteAccount { 
    public static let typeIdentifier = "com.atproto.admin.deleteAccount"        
public struct Input: ATProtocolCodable {
            public let did: String

            // Standard public initializer
            public init(did: String) {
                self.did = did
                
            }
        }



}
extension ATProtoClient.Com.Atproto.Admin {
    /// Delete a user account as an administrator.
    public func deleteAccount(input: ComAtprotoAdminDeleteAccount.Input) async throws -> Int {
        let endpoint = "/com.atproto.admin.deleteAccount"
        
        
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
                           
