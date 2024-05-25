import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.server.getServiceAuth


public struct ComAtprotoServerGetServiceAuth { 

    public static let typeIdentifier = "com.atproto.server.getServiceAuth"    
public struct Parameters: Parametrizable {
        public let aud: String
        
        public init(
            aud: String
            ) {
            self.aud = aud
            
        }
    }    
    
public struct Output: ATProtocolCodable { 
        
        public let token: String
        
        
        // Standard public initializer
        public init(
            token: String
        ) {
            
            self.token = token
            
        }
    }
    



}

extension ATProtoClient.Com.Atproto.Server {
    /// Get a signed token on behalf of the requesting DID for the requested service.
    public func getServiceAuth(input: ComAtprotoServerGetServiceAuth.Parameters) async throws -> (responseCode: Int, data: ComAtprotoServerGetServiceAuth.Output?) {
        let endpoint = "/com.atproto.server.getServiceAuth"
        
        
        let queryItems = input.asQueryItems()
        let urlRequest = try await networkManager.createURLRequest(
            endpoint: endpoint, 
            method: "GET", 
            headers: [:],
            body: nil, 
            queryItems: queryItems
        )
        
        
        let (responseData, response) = try await networkManager.performRequest(urlRequest, retryCount: 0, duringInitialSetup: false)
        let responseCode = response.statusCode

        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(ComAtprotoServerGetServiceAuth.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
