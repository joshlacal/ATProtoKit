import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.admin.getModerationEvent


public struct ComAtprotoAdminGetModerationEvent { 
    public static let typeIdentifier = "com.atproto.admin.getModerationEvent"        
public struct Parameters: Parametrizable {
            public let id: Int
            
            public init(
                id: Int
                ) {
                self.id = id
                
            }
        }        
public struct Output: Codable {
            public let data: ComAtprotoAdminDefs.ModEventViewDetail
                                    
            // Standard public initializer
            public init(data: ComAtprotoAdminDefs.ModEventViewDetail) {
                self.data = data
                
            }

        }



}

extension ATProtoClient.Com.Atproto.Admin {
    /// Get details about a moderation event. 
    public func getModerationEvent(input: ComAtprotoAdminGetModerationEvent.Parameters) async throws -> (responseCode: Int, data: ComAtprotoAdminGetModerationEvent.Output?) {
        let endpoint = "/com.atproto.admin.getModerationEvent"
        
        
        // Convert input to query items
        let queryItems = input.asQueryItems()
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "GET", queryItems: queryItems)
        

        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(ComAtprotoAdminGetModerationEvent.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
