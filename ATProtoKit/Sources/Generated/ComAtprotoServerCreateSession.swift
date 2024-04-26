import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.server.createSession


public struct ComAtprotoServerCreateSession { 
    public static let typeIdentifier = "com.atproto.server.createSession"        
public struct Input: ATProtocolCodable {
            public let identifier: String
            public let password: String

            // Standard public initializer
            public init(identifier: String, password: String) {
                self.identifier = identifier
                self.password = password
                
            }
        }    
    
public struct Output: ATProtocolCodable { 
        
        public let accessJwt: String
        
        public let refreshJwt: String
        
        public let handle: String
        
        public let did: String
        
        public let didDoc: DIDDocument?
        
        public let email: String?
        
        public let emailConfirmed: Bool?
        
        
        // Standard public initializer
        public init(
            accessJwt: String, 
        
            refreshJwt: String, 
        
            handle: String, 
        
            did: String, 
        
            didDoc: DIDDocument? = nil, 
        
            email: String? = nil, 
        
            emailConfirmed: Bool? = nil
        ) {
            
            self.accessJwt = accessJwt
            
            self.refreshJwt = refreshJwt
            
            self.handle = handle
            
            self.did = did
            
            self.didDoc = didDoc
            
            self.email = email
            
            self.emailConfirmed = emailConfirmed
            
        }
    }
            
public enum Error: String, Swift.Error, CustomStringConvertible {
                case accountTakedown = "AccountTakedown."
            public var description: String {
                return self.rawValue
            }
        }



}
extension ATProtoClient.Com.Atproto.Server {
    /// Create an authentication session.
    public func createSession(input: ComAtprotoServerCreateSession.Input) async throws -> (responseCode: Int, data: ComAtprotoServerCreateSession.Output?) {
        let endpoint = "/com.atproto.server.createSession"
        
        
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

        
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(ComAtprotoServerCreateSession.Output.self, from: responseData)
        return (responseCode, decodedData)
        
    }
}
                           
