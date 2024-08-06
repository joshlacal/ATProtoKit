import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.admin.disableInviteCodes


public struct ComAtprotoAdminDisableInviteCodes { 

    public static let typeIdentifier = "com.atproto.admin.disableInviteCodes"        
public struct Input: ATProtocolCodable {
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
    
    public func disableInviteCodes(input: ComAtprotoAdminDisableInviteCodes.Input, duringInitialSetup: Bool = false) async throws -> Int {
        let endpoint = "/com.atproto.admin.disableInviteCodes"
        
        
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
                           
