import Foundation
import ZippyJSON
                            
// lexicon: 1, id: tools.ozone.moderation.getEvent


public struct ToolsOzoneModerationGetEvent { 
    public static let typeIdentifier = "tools.ozone.moderation.getEvent"        
public struct Parameters: Parametrizable {
            public let id: Int
            
            public init(
                id: Int
                ) {
                self.id = id
                
            }
        }    
    public typealias Output = ToolsOzoneModerationDefs.ModEventViewDetail
    



}

extension ATProtoClient.Tools.Ozone.Moderation {
    /// Get details about a moderation event.
    public func getEvent(input: ToolsOzoneModerationGetEvent.Parameters) async throws -> (responseCode: Int, data: ToolsOzoneModerationGetEvent.Output?) {
        let endpoint = "/tools.ozone.moderation.getEvent"
        
        
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
        let decodedData = try? decoder.decode(ToolsOzoneModerationGetEvent.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
