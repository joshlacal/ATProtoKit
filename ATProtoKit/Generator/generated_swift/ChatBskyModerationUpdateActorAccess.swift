import Foundation
import ZippyJSON
                            
// lexicon: 1, id: chat.bsky.moderation.updateActorAccess


public struct ChatBskyModerationUpdateActorAccess { 

    public static let typeIdentifier = "chat.bsky.moderation.updateActorAccess"        
public struct Input: ATProtocolCodable {
            public let actor: String
            public let allowAccess: Bool
            public let ref: String?

            // Standard public initializer
            public init(actor: String, allowAccess: Bool, ref: String? = nil) {
                self.actor = actor
                self.allowAccess = allowAccess
                self.ref = ref
                
            }
        }



}
extension ATProtoClient.Chat.Bsky.Moderation {
    /// 
    public func updateActorAccess(input: ChatBskyModerationUpdateActorAccess.Input, duringInitialSetup: Bool = false) async throws -> Int {
        let endpoint = "/chat.bsky.moderation.updateActorAccess"
        
        
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
                           
