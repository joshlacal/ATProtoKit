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
    
public struct Output: Codable { 
        
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
    /// Get all invite codes for a given account. 
    public func getAccountInviteCodes(input: ComAtprotoServerGetAccountInviteCodes.Parameters) async throws -> (responseCode: Int, data: ComAtprotoServerGetAccountInviteCodes.Output?) {
        let endpoint = "/com.atproto.server.getAccountInviteCodes"
        
        
        // Convert input to query items
        let queryItems = input.asQueryItems()
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "GET", queryItems: queryItems)
        

        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(ComAtprotoServerGetAccountInviteCodes.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
