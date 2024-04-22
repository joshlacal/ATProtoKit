import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.server.getAccountInviteCodes


public struct ComAtprotoServerGetAccountInviteCodes { 
    public static let typeIdentifier = "com.atproto.server.getAccountInviteCodes"        
public struct Parameters: Parametrizable {
            public let includeUsed: Bool?
            public let createAvailable: Bool?
            
            public init(
                includeUsed: Bool? = nil, 
                createAvailable: Bool? = nil
                ) {
                self.includeUsed = includeUsed
                self.createAvailable = createAvailable
                
            }
        }    
    
public struct Output: ATProtocolCodable { 
        
        public let codes: [ComAtprotoServerDefs.InviteCode]
        
        
        // Standard public initializer
        public init(
            codes: [ComAtprotoServerDefs.InviteCode]
        ) {
            
            self.codes = codes
            
        }
    }
            
public enum Error: String, Swift.Error, CustomStringConvertible {
                case duplicateCreate = "DuplicateCreate."
            public var description: String {
                return self.rawValue
            }
        }



}

extension ATProtoClient.Com.Atproto.Server {
    /// Get all invite codes for the current account. Requires auth.
    public func getAccountInviteCodes(input: ComAtprotoServerGetAccountInviteCodes.Parameters) async throws -> (responseCode: Int, data: ComAtprotoServerGetAccountInviteCodes.Output?) {
        let endpoint = "/com.atproto.server.getAccountInviteCodes"
        
        
        let queryItems = input.asQueryItems()
        let urlRequest = try await networkManager.createURLRequest(
            endpoint: endpoint, 
            method: "GET", 
            headers: [:], // Typically, GET requests do not have a body
            body: nil, 
            queryItems: queryItems
        )
        
        
        let (responseData, response) = try await networkManager.performRequest(urlRequest)
        let responseCode = response.statusCode

        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(ComAtprotoServerGetAccountInviteCodes.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
