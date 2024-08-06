import Foundation
import ZippyJSON
                            
// lexicon: 1, id: tools.ozone.team.deleteMember


public struct ToolsOzoneTeamDeleteMember { 

    public static let typeIdentifier = "tools.ozone.team.deleteMember"        
public struct Input: ATProtocolCodable {
            public let did: String

            // Standard public initializer
            public init(did: String) {
                self.did = did
                
            }
        }        
public enum Error: String, Swift.Error, CustomStringConvertible {
                case memberNotFound = "MemberNotFound.The member being deleted does not exist"
                case cannotDeleteSelf = "CannotDeleteSelf.You can not delete yourself from the team"
            public var description: String {
                return self.rawValue
            }
        }



}
extension ATProtoClient.Tools.Ozone.Team {
    /// Delete a member from ozone team. Requires admin role.
    
    public func deleteMember(input: ToolsOzoneTeamDeleteMember.Input, duringInitialSetup: Bool = false) async throws -> Int {
        let endpoint = "/tools.ozone.team.deleteMember"
        
        
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
        
        return responseCode
        
    }
}
                           
