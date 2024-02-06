import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.admin.getInviteCodes


public struct ComAtprotoAdminGetInviteCodes { 
    public static let typeIdentifier = "com.atproto.admin.getInviteCodes"        
public struct Parameters: Parametrizable {
            public let sort: String?
            public let limit: Int?
            public let cursor: String?
            
            public init(
                sort: String? = nil, 
                limit: Int? = nil, 
                cursor: String? = nil
                ) {
                self.sort = sort
                self.limit = limit
                self.cursor = cursor
                
            }
        }        
public struct Output: Codable {
            public let cursor: String?
            public let codes: [ComAtprotoServerDefs.InviteCode]
                                    
            // Standard public initializer
            public init(cursor: String? = nil, codes: [ComAtprotoServerDefs.InviteCode]) {
                self.cursor = cursor
                self.codes = codes
                
            }

        }



}

extension ATProtoClient.Com.Atproto.Admin {
    /// Get an admin view of invite codes. 
    public func getInviteCodes(input: ComAtprotoAdminGetInviteCodes.Parameters) async throws -> (responseCode: Int, data: ComAtprotoAdminGetInviteCodes.Output?) {
        let endpoint = "/com.atproto.admin.getInviteCodes"
        
        
        // Convert input to query items
        let queryItems = input.asQueryItems()
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "GET", queryItems: queryItems)
        

        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(ComAtprotoAdminGetInviteCodes.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
