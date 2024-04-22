import Foundation
import ZippyJSON
                            
// lexicon: 1, id: tools.ozone.moderation.getRepo


public struct ToolsOzoneModerationGetRepo { 
    public static let typeIdentifier = "tools.ozone.moderation.getRepo"        
public struct Parameters: Parametrizable {
            public let did: String
            
            public init(
                did: String
                ) {
                self.did = did
                
            }
        }    
    public typealias Output = ToolsOzoneModerationDefs.RepoViewDetail
            
public enum Error: String, Swift.Error, CustomStringConvertible {
                case repoNotFound = "RepoNotFound."
            public var description: String {
                return self.rawValue
            }
        }



}

extension ATProtoClient.Tools.Ozone.Moderation {
    /// Get details about a repository.
    public func getRepo(input: ToolsOzoneModerationGetRepo.Parameters) async throws -> (responseCode: Int, data: ToolsOzoneModerationGetRepo.Output?) {
        let endpoint = "/tools.ozone.moderation.getRepo"
        
        
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
        let decodedData = try? decoder.decode(ToolsOzoneModerationGetRepo.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
