import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.server.createSession


public struct ComAtprotoServerCreateSession { 
    public static let typeIdentifier = "com.atproto.server.createSession"        
public struct Input: Codable {
            public let identifier: String
            public let password: String

            // Standard public initializer
            public init(identifier: String, password: String) {
                self.identifier = identifier
                self.password = password
                
            }
        }    
    
public struct Output: Codable { 
        
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
        
        
        // Perform the network request
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "POST", body: requestData)

        
        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(ComAtprotoServerCreateSession.Output.self, from: responseData)
        return (responseCode, decodedData)
        
    }
}
                           
