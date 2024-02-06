import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.server.getSession


public struct ComAtprotoServerGetSession { 
    public static let typeIdentifier = "com.atproto.server.getSession"        
public struct Output: Codable {
            public let handle: String
            public let did: String
            public let email: String?
            public let emailConfirmed: Bool?
            public let didDoc: DIDDocument?
                                    
            // Standard public initializer
            public init(handle: String, did: String, email: String? = nil, emailConfirmed: Bool? = nil, didDoc: DIDDocument? = nil) {
                self.handle = handle
                self.did = did
                self.email = email
                self.emailConfirmed = emailConfirmed
                self.didDoc = didDoc
                
            }

        }



}

extension ATProtoClient.Com.Atproto.Server {
    /// Get information about the current session. 
    public func getSession() async throws -> (responseCode: Int, data: ComAtprotoServerGetSession.Output?) {
        let endpoint = "/com.atproto.server.getSession"
        
        
        // Perform a GET request without a body or query items
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "GET", body: nil)
        

        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(ComAtprotoServerGetSession.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
