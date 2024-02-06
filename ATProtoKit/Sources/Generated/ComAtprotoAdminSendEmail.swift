import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.admin.sendEmail


public struct ComAtprotoAdminSendEmail { 
    public static let typeIdentifier = "com.atproto.admin.sendEmail"        
public struct Input: Codable {
            public let recipientDid: String
            public let content: String
            public let subject: String?
            public let senderDid: String
            public let comment: String?

            // Standard public initializer
            public init(recipientDid: String, content: String, subject: String? = nil, senderDid: String, comment: String? = nil) {
                self.recipientDid = recipientDid
                self.content = content
                self.subject = subject
                self.senderDid = senderDid
                self.comment = comment
                
            }
        }        
public struct Output: Codable {
            public let sent: Bool
                                    
            // Standard public initializer
            public init(sent: Bool) {
                self.sent = sent
                
            }

        }



}
extension ATProtoClient.Com.Atproto.Admin {
    /// Send email to a user's account email address.
    public func sendEmail(input: ComAtprotoAdminSendEmail.Input) async throws -> (responseCode: Int, data: ComAtprotoAdminSendEmail.Output?) {
        let endpoint = "/com.atproto.admin.sendEmail"
        
        let requestData = try JSONEncoder().encode(input)
        
        
        // Perform the network request
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "POST", body: requestData)

        
        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(ComAtprotoAdminSendEmail.Output.self, from: responseData)
        return (responseCode, decodedData)
        
    }
}
                           
