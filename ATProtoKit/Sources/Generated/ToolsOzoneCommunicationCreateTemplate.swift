import Foundation
import ZippyJSON
                            
// lexicon: 1, id: tools.ozone.communication.createTemplate


public struct ToolsOzoneCommunicationCreateTemplate { 
    public static let typeIdentifier = "tools.ozone.communication.createTemplate"        
public struct Input: ATProtocolCodable {
            public let name: String
            public let contentMarkdown: String
            public let subject: String
            public let createdBy: String?

            // Standard public initializer
            public init(name: String, contentMarkdown: String, subject: String, createdBy: String? = nil) {
                self.name = name
                self.contentMarkdown = contentMarkdown
                self.subject = subject
                self.createdBy = createdBy
                
            }
        }    
    public typealias Output = ToolsOzoneCommunicationDefs.TemplateView
    



}
extension ATProtoClient.Tools.Ozone.Communication {
    /// Administrative action to create a new, re-usable communication (email for now) template.
    public func createTemplate(input: ToolsOzoneCommunicationCreateTemplate.Input) async throws -> (responseCode: Int, data: ToolsOzoneCommunicationCreateTemplate.Output?) {
        let endpoint = "/tools.ozone.communication.createTemplate"
        
        
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
        let decodedData = try? decoder.decode(ToolsOzoneCommunicationCreateTemplate.Output.self, from: responseData)
        return (responseCode, decodedData)
        
    }
}
                           
