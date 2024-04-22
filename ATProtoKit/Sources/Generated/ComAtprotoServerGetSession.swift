import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.server.getSession


public struct ComAtprotoServerGetSession { 
    public static let typeIdentifier = "com.atproto.server.getSession"    
    
public struct Output: ATProtocolCodable { 
        
        public let handle: String
        
        public let did: String
        
        public let email: String?
        
        public let emailConfirmed: Bool?
        
        public let didDoc: DIDDocument?
        
        
        // Standard public initializer
        public init(
            handle: String, 
        
            did: String, 
        
            email: String? = nil, 
        
            emailConfirmed: Bool? = nil, 
        
            didDoc: DIDDocument? = nil
        ) {
            
            self.handle = handle
            
            self.did = did
            
            self.email = email
            
            self.emailConfirmed = emailConfirmed
            
            self.didDoc = didDoc
            
        }
    }
    



}

extension ATProtoClient.Com.Atproto.Server {
    /// Get information about the current auth session. Requires auth.
    public func getSession() async throws -> (responseCode: Int, data: ComAtprotoServerGetSession.Output?) {
        let endpoint = "/com.atproto.server.getSession"
        
        
        let urlRequest = try await networkManager.createURLRequest(
            endpoint: endpoint,
            method: "GET",
            headers: [:],
            body: nil,
            queryItems: nil
        )
        
        
        let (responseData, response) = try await networkManager.performRequest(urlRequest)
        let responseCode = response.statusCode

        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(ComAtprotoServerGetSession.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
