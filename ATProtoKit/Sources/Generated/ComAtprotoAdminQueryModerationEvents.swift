import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.admin.queryModerationEvents


public struct ComAtprotoAdminQueryModerationEvents { 
    public static let typeIdentifier = "com.atproto.admin.queryModerationEvents"        
public struct Parameters: Parametrizable {
            public let types: [String]?
            public let createdBy: String?
            public let sortDirection: String?
            public let subject: URI?
            public let includeAllUserRecords: Bool?
            public let limit: Int?
            public let cursor: String?
            
            public init(
                types: [String]? = nil, 
                createdBy: String? = nil, 
                sortDirection: String? = nil, 
                subject: URI? = nil, 
                includeAllUserRecords: Bool? = nil, 
                limit: Int? = nil, 
                cursor: String? = nil
                ) {
                self.types = types
                self.createdBy = createdBy
                self.sortDirection = sortDirection
                self.subject = subject
                self.includeAllUserRecords = includeAllUserRecords
                self.limit = limit
                self.cursor = cursor
                
            }
        }        
public struct Output: Codable {
            public let cursor: String?
            public let events: [ComAtprotoAdminDefs.ModEventView]
                                    
            // Standard public initializer
            public init(cursor: String? = nil, events: [ComAtprotoAdminDefs.ModEventView]) {
                self.cursor = cursor
                self.events = events
                
            }

        }



}

extension ATProtoClient.Com.Atproto.Admin {
    /// List moderation events related to a subject. 
    public func queryModerationEvents(input: ComAtprotoAdminQueryModerationEvents.Parameters) async throws -> (responseCode: Int, data: ComAtprotoAdminQueryModerationEvents.Output?) {
        let endpoint = "/com.atproto.admin.queryModerationEvents"
        
        
        // Convert input to query items
        let queryItems = input.asQueryItems()
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "GET", queryItems: queryItems)
        

        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(ComAtprotoAdminQueryModerationEvents.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
