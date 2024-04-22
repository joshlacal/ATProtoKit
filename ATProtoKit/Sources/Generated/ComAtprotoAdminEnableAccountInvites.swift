import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.admin.enableAccountInvites


public struct ComAtprotoAdminEnableAccountInvites { 
    public static let typeIdentifier = "com.atproto.admin.enableAccountInvites"        
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
    /// Re-enable an account's ability to receive invite codes.
    public func enableAccountInvites(input: ComAtprotoAdminEnableAccountInvites.Input) async throws -> Int {
        let endpoint = "/com.atproto.admin.enableAccountInvites"
        
        
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
                           
