import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.server.createAccount


public struct ComAtprotoServerCreateAccount { 
    public static let typeIdentifier = "com.atproto.server.createAccount"        
public struct Input: Codable {
            public let email: String?
            public let handle: String
            public let did: String?
            public let inviteCode: String?
            public let password: String?
            public let recoveryKey: String?
            public let plcOp: JSONValue?

            // Standard public initializer
            public init(email: String? = nil, handle: String, did: String? = nil, inviteCode: String? = nil, password: String? = nil, recoveryKey: String? = nil, plcOp: JSONValue? = nil) {
                self.email = email
                self.handle = handle
                self.did = did
                self.inviteCode = inviteCode
                self.password = password
                self.recoveryKey = recoveryKey
                self.plcOp = plcOp
                
            }
        }    
    
public struct Output: Codable { 
        
        public let accessJwt: String
        
        public let refreshJwt: String
        
        public let handle: String
        
        public let did: String
        
        public let didDoc: DIDDocument?
        
        
        // Standard public initializer
        public init(
            accessJwt: String, 
        
            refreshJwt: String, 
        
            handle: String, 
        
            did: String, 
        
            didDoc: DIDDocument? = nil
        ) {
            
            self.accessJwt = accessJwt
            
            self.refreshJwt = refreshJwt
            
            self.handle = handle
            
            self.did = did
            
            self.didDoc = didDoc
            
        }
    }
            
public enum Error: String, Swift.Error, CustomStringConvertible {
                case invalidHandle = "InvalidHandle."
                case invalidPassword = "InvalidPassword."
                case invalidInviteCode = "InvalidInviteCode."
                case handleNotAvailable = "HandleNotAvailable."
                case unsupportedDomain = "UnsupportedDomain."
                case unresolvableDid = "UnresolvableDid."
                case incompatibleDidDoc = "IncompatibleDidDoc."
            public var description: String {
                return self.rawValue
            }
        }



}
extension ATProtoClient.Com.Atproto.Server {
    /// Create an account.
    public func createAccount(input: ComAtprotoServerCreateAccount.Input) async throws -> (responseCode: Int, data: ComAtprotoServerCreateAccount.Output?) {
        let endpoint = "/com.atproto.server.createAccount"
        
        let requestData = try JSONEncoder().encode(input)
        
        
        // Perform the network request
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "POST", body: requestData)

        
        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(ComAtprotoServerCreateAccount.Output.self, from: responseData)
        return (responseCode, decodedData)
        
    }
}
                           
