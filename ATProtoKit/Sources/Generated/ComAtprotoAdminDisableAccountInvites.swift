import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.admin.disableAccountInvites


public struct ComAtprotoAdminDisableAccountInvites { 
    public static let typeIdentifier = "com.atproto.admin.disableAccountInvites"        
public struct Input: Codable {
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
        
        
        // Perform the network request
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "POST", body: requestData)

        
        // Return only the response code if no output type is expected
        return responseCode
        
    }
}
                           
