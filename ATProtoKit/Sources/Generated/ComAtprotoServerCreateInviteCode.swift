import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.server.createInviteCode


public struct ComAtprotoServerCreateInviteCode { 
    public static let typeIdentifier = "com.atproto.server.createInviteCode"        
public struct Input: ATProtocolCodable {
            public let useCount: Int
            public let forAccount: String?

            // Standard public initializer
            public init(useCount: Int, forAccount: String? = nil) {
                self.useCount = useCount
                self.forAccount = forAccount
                
            }
        }    
    
public struct Output: ATProtocolCodable { 
        
        public let code: String
        
        
        // Standard public initializer
        public init(
            code: String
        ) {
            
            self.code = code
            
        }
    }
    



}
extension ATProtoClient.Com.Atproto.Server {
    /// Create an invite code.
    public func createInviteCode(input: ComAtprotoServerCreateInviteCode.Input) async throws -> (responseCode: Int, data: ComAtprotoServerCreateInviteCode.Output?) {
        let endpoint = "/com.atproto.server.createInviteCode"
        
        
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
        let decodedData = try? decoder.decode(ComAtprotoServerCreateInviteCode.Output.self, from: responseData)
        return (responseCode, decodedData)
        
    }
}
                           
