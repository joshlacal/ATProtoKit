import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.server.refreshSession


public struct ComAtprotoServerRefreshSession { 
    public static let typeIdentifier = "com.atproto.server.refreshSession"    
    
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
                case accountTakedown = "AccountTakedown."
            public var description: String {
                return self.rawValue
            }
        }



}
extension ATProtoClient.Com.Atproto.Server {
    /// Refresh an authentication session.
    public func refreshSession() async throws -> (responseCode: Int, data: ComAtprotoServerRefreshSession.Output?) {
        let endpoint = "/com.atproto.server.refreshSession"
        
        let requestData: Data? = nil
        
        
        // Perform the network request
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "POST", body: requestData)

        
        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(ComAtprotoServerRefreshSession.Output.self, from: responseData)
        return (responseCode, decodedData)
        
    }
}
                           
