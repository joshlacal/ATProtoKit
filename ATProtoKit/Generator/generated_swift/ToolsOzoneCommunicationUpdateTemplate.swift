import Foundation
import ZippyJSON
                            
// lexicon: 1, id: tools.ozone.communication.updateTemplate


public struct ToolsOzoneCommunicationUpdateTemplate { 

    public static let typeIdentifier = "tools.ozone.communication.updateTemplate"        
public struct Input: ATProtocolCodable {
            public let id: String
            public let name: String?
            public let contentMarkdown: String?
            public let subject: String?
            public let updatedBy: String?
            public let disabled: Bool?

            // Standard public initializer
            public init(id: String, name: String? = nil, contentMarkdown: String? = nil, subject: String? = nil, updatedBy: String? = nil, disabled: Bool? = nil) {
                self.id = id
                self.name = name
                self.contentMarkdown = contentMarkdown
                self.subject = subject
                self.updatedBy = updatedBy
                self.disabled = disabled
                
            }
        }    
    public typealias Output = ToolsOzoneCommunicationDefs.TemplateView
    



}
extension ATProtoClient.Tools.Ozone.Communication {
    /// Administrative action to update an existing communication template. Allows passing partial fields to patch specific fields only.
    public func updateTemplate(input: ToolsOzoneCommunicationUpdateTemplate.Input, duringInitialSetup: Bool = false) async throws -> (responseCode: Int, data: ToolsOzoneCommunicationUpdateTemplate.Output?) {
        let endpoint = "/tools.ozone.communication.updateTemplate"
        
        
        let requestData = try JSONEncoder().encode(input)
        
        
        let urlRequest = try await networkManager.createURLRequest(
            endpoint: endpoint, 
            method: "POST", 
            headers: ["Content-Type": "application/json"], 
            body: requestData,
            queryItems: nil
        )
        
        let (responseData, response) = try await networkManager.performRequest(urlRequest, retryCount: 0, duringInitialSetup: duringInitialSetup)
        let responseCode = response.statusCode

        
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(ToolsOzoneCommunicationUpdateTemplate.Output.self, from: responseData)
        return (responseCode, decodedData)
        
    }
}
                           
