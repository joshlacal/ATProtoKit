import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.server.refreshSession


public struct ComAtprotoServerRefreshSession { 

    public static let typeIdentifier = "com.atproto.server.refreshSession"    
    
public struct Output: ATProtocolCodable { 
        
        public let accessJwt: String
        
        public let refreshJwt: String
        
        public let handle: String
        
        public let did: String
        
        public let didDoc: DIDDocument?
        
        public let active: Bool?
        
        public let status: String?
        
        
        // Standard public initializer
        public init(
            accessJwt: String, 
        
            refreshJwt: String, 
        
            handle: String, 
        
            did: String, 
        
            didDoc: DIDDocument? = nil, 
        
            active: Bool? = nil, 
        
            status: String? = nil
        ) {
            
            self.accessJwt = accessJwt
            
            self.refreshJwt = refreshJwt
            
            self.handle = handle
            
            self.did = did
            
            self.didDoc = didDoc
            
            self.active = active
            
            self.status = status
            
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
    /// Refresh an authentication session. Requires auth using the 'refreshJwt' (not the 'accessJwt').
    
    public func refreshSession( duringInitialSetup: Bool = false) async throws -> (responseCode: Int, data: ComAtprotoServerRefreshSession.Output?) {
        let endpoint = "/com.atproto.server.refreshSession"
        
        
        let requestData: Data? = nil
        
        
        let urlRequest = try await networkManager.createURLRequest(
            endpoint: endpoint, 
            method: "POST", 
            headers: ["Content-Type": "application/json"], 
            body: requestData,
            queryItems: nil
        )
    
        
        let (responseData, response) = try await networkManager.performRequest(urlRequest, retryCount: 0, duringInitialSetup: duringInitialSetup)
        let responseCode = response.statusCode
        
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(ComAtprotoServerRefreshSession.Output.self, from: responseData)
        return (responseCode, decodedData)
        
    }
}
                           
