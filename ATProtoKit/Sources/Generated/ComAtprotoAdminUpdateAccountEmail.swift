import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.admin.updateAccountEmail


public struct ComAtprotoAdminUpdateAccountEmail { 
    public static let typeIdentifier = "com.atproto.admin.updateAccountEmail"        
public struct Input: Codable {
            public let account: String
            public let email: String

            // Standard public initializer
            public init(account: String, email: String) {
                self.account = account
                self.email = email
                
            }
        }



}
extension ATProtoClient.Com.Atproto.Admin {
    /// Administrative action to update an account's email.
    public func updateAccountEmail(input: ComAtprotoAdminUpdateAccountEmail.Input) async throws -> Int {
        let endpoint = "/com.atproto.admin.updateAccountEmail"
        
        let requestData = try JSONEncoder().encode(input)
        
        
        // Perform the network request
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "POST", body: requestData)

        
        // Return only the response code if no output type is expected
        return responseCode
        
    }
}
                           
