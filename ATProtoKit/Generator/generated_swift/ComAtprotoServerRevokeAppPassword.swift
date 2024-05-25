import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.server.revokeAppPassword


public struct ComAtprotoServerRevokeAppPassword { 

    public static let typeIdentifier = "com.atproto.server.revokeAppPassword"        
public struct Input: ATProtocolCodable {
            public let name: String

            // Standard public initializer
            public init(name: String) {
                self.name = name
                
            }
        }



}
extension ATProtoClient.Com.Atproto.Server {
    /// Revoke an App Password by name.
    public func revokeAppPassword(input: ComAtprotoServerRevokeAppPassword.Input, duringInitialSetup: Bool = false) async throws -> Int {
        let endpoint = "/com.atproto.server.revokeAppPassword"
        
        
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
                           
