import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.admin.queryModerationStatuses


public struct ComAtprotoAdminQueryModerationStatuses { 
    public static let typeIdentifier = "com.atproto.admin.queryModerationStatuses"        
public struct Parameters: Parametrizable {
            public let subject: URI?
            public let comment: String?
            public let reportedAfter: ATProtocolDate?
            public let reportedBefore: ATProtocolDate?
            public let reviewedAfter: ATProtocolDate?
            public let reviewedBefore: ATProtocolDate?
            public let includeMuted: Bool?
            public let reviewState: String?
            public let ignoreSubjects: [URI]?
            public let lastReviewedBy: String?
            public let sortField: String?
            public let sortDirection: String?
            public let takendown: Bool?
            public let appealed: Bool?
            public let limit: Int?
            public let cursor: String?
            
            public init(
                subject: URI? = nil, 
                comment: String? = nil, 
                reportedAfter: ATProtocolDate? = nil, 
                reportedBefore: ATProtocolDate? = nil, 
                reviewedAfter: ATProtocolDate? = nil, 
                reviewedBefore: ATProtocolDate? = nil, 
                includeMuted: Bool? = nil, 
                reviewState: String? = nil, 
                ignoreSubjects: [URI]? = nil, 
                lastReviewedBy: String? = nil, 
                sortField: String? = nil, 
                sortDirection: String? = nil, 
                takendown: Bool? = nil, 
                appealed: Bool? = nil, 
                limit: Int? = nil, 
                cursor: String? = nil
                ) {
                self.subject = subject
                self.comment = comment
                self.reportedAfter = reportedAfter
                self.reportedBefore = reportedBefore
                self.reviewedAfter = reviewedAfter
                self.reviewedBefore = reviewedBefore
                self.includeMuted = includeMuted
                self.reviewState = reviewState
                self.ignoreSubjects = ignoreSubjects
                self.lastReviewedBy = lastReviewedBy
                self.sortField = sortField
                self.sortDirection = sortDirection
                self.takendown = takendown
                self.appealed = appealed
                self.limit = limit
                self.cursor = cursor
                
            }
        }        
public struct Output: Codable {
            public let cursor: String?
            public let subjectStatuses: [ComAtprotoAdminDefs.SubjectStatusView]
                                    
            // Standard public initializer
            public init(cursor: String? = nil, subjectStatuses: [ComAtprotoAdminDefs.SubjectStatusView]) {
                self.cursor = cursor
                self.subjectStatuses = subjectStatuses
                
            }

        }



}

extension ATProtoClient.Com.Atproto.Admin {
    /// View moderation statuses of subjects (record or repo). 
    public func queryModerationStatuses(input: ComAtprotoAdminQueryModerationStatuses.Parameters) async throws -> (responseCode: Int, data: ComAtprotoAdminQueryModerationStatuses.Output?) {
        let endpoint = "/com.atproto.admin.queryModerationStatuses"
        
        
        // Convert input to query items
        let queryItems = input.asQueryItems()
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "GET", queryItems: queryItems)
        

        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(ComAtprotoAdminQueryModerationStatuses.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
