import Foundation
import ZippyJSON
                            
// lexicon: 1, id: tools.ozone.team.updateMember


public struct ToolsOzoneTeamUpdateMember { 

    public static let typeIdentifier = "tools.ozone.team.updateMember"        
public struct Input: ATProtocolCodable {
            public let did: String
            public let disabled: Bool?
            public let role: String?

            // Standard public initializer
            public init(did: String, disabled: Bool? = nil, role: String? = nil) {
                self.did = did
                self.disabled = disabled
                self.role = role
                
            }
        }    
    public typealias Output = ToolsOzoneTeamDefs.Member
            
public enum Error: String, Swift.Error, CustomStringConvertible {
                case memberNotFound = "MemberNotFound.The member being updated does not exist in the team"
            public var description: String {
                return self.rawValue
            }
        }



}
extension ATProtoClient.Tools.Ozone.Team {
    /// Update a member in the ozone service. Requires admin role.
    
    public func updateMember(input: ToolsOzoneTeamUpdateMember.Input, duringInitialSetup: Bool = false) async throws -> (responseCode: Int, data: ToolsOzoneTeamUpdateMember.Output?) {
        let endpoint = "/tools.ozone.team.updateMember"
        
        
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
        let decodedData = try? decoder.decode(ToolsOzoneTeamUpdateMember.Output.self, from: responseData)
        return (responseCode, decodedData)
        
    }
}
                           
