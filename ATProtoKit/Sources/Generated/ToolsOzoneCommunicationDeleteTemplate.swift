import Foundation
import ZippyJSON
                            
// lexicon: 1, id: tools.ozone.communication.deleteTemplate


public struct ToolsOzoneCommunicationDeleteTemplate { 
    public static let typeIdentifier = "tools.ozone.communication.deleteTemplate"        
public struct Input: ATProtocolCodable {
            public let id: String

            // Standard public initializer
            public init(id: String) {
                self.id = id
                
            }
        }



}
extension ATProtoClient.Tools.Ozone.Communication {
    /// Delete a communication template.
    public func deleteTemplate(input: ToolsOzoneCommunicationDeleteTemplate.Input) async throws -> Int {
        let endpoint = "/tools.ozone.communication.deleteTemplate"
        
        
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

        
        // Return only the response code if no output type is expected
        return responseCode
        
    }
}
                           
