import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.admin.disableAccountInvites


public struct ComAtprotoAdminDisableAccountInvites { 
    public static let typeIdentifier = "com.atproto.admin.disableAccountInvites"        
public struct Input: ATProtocolCodable {
            public let account: String
            public let note: String?

            // Standard public initializer
            public init(account: String, note: String? = nil) {
                self.account = account
                self.note = note
                
            }
        }



}
extension ATProtoClient.Com.Atproto.Admin {
    /// Disable an account from receiving new invite codes, but does not invalidate existing codes.
    public func disableAccountInvites(input: ComAtprotoAdminDisableAccountInvites.Input) async throws -> Int {
        let endpoint = "/com.atproto.admin.disableAccountInvites"
        
        
        let requestData = try JSONEncoder().encode(input)
        
        
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
                           
