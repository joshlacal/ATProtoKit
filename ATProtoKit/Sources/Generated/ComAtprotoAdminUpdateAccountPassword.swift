import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.admin.updateAccountPassword


public struct ComAtprotoAdminUpdateAccountPassword { 
    public static let typeIdentifier = "com.atproto.admin.updateAccountPassword"        
public struct Input: ATProtocolCodable {
            public let did: String
            public let password: String

            // Standard public initializer
            public init(did: String, password: String) {
                self.did = did
                self.password = password
                
            }
        }



}
extension ATProtoClient.Com.Atproto.Admin {
    /// Update the password for a user account as an administrator.
    public func updateAccountPassword(input: ComAtprotoAdminUpdateAccountPassword.Input) async throws -> Int {
        let endpoint = "/com.atproto.admin.updateAccountPassword"
        
        
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
                           
