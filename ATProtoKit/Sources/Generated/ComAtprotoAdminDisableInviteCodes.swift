import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.admin.disableInviteCodes


public struct ComAtprotoAdminDisableInviteCodes { 
    public static let typeIdentifier = "com.atproto.admin.disableInviteCodes"        
public struct Input: Codable {
            public let codes: [String]?
            public let accounts: [String]?

            // Standard public initializer
            public init(codes: [String]? = nil, accounts: [String]? = nil) {
                self.codes = codes
                self.accounts = accounts
                
            }
        }



}
extension ATProtoClient.Com.Atproto.Admin {
    /// Disable some set of codes and/or all codes associated with a set of users.
    public func disableInviteCodes(input: ComAtprotoAdminDisableInviteCodes.Input) async throws -> Int {
        let endpoint = "/com.atproto.admin.disableInviteCodes"
        
        let requestData = try JSONEncoder().encode(input)
        
        
        // Perform the network request
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "POST", body: requestData)

        
        // Return only the response code if no output type is expected
        return responseCode
        
    }
}
                           
