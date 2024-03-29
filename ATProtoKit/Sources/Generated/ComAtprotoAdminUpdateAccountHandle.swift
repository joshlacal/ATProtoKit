import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.admin.updateAccountHandle


public struct ComAtprotoAdminUpdateAccountHandle { 
    public static let typeIdentifier = "com.atproto.admin.updateAccountHandle"        
public struct Input: Codable {
            public let did: String
            public let handle: String

            // Standard public initializer
            public init(did: String, handle: String) {
                self.did = did
                self.handle = handle
                
            }
        }



}
extension ATProtoClient.Com.Atproto.Admin {
    /// Administrative action to update an account's handle.
    public func updateAccountHandle(input: ComAtprotoAdminUpdateAccountHandle.Input) async throws -> Int {
        let endpoint = "/com.atproto.admin.updateAccountHandle"
        
        let requestData = try JSONEncoder().encode(input)
        
        
        // Perform the network request
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "POST", body: requestData)

        
        // Return only the response code if no output type is expected
        return responseCode
        
    }
}
                           
