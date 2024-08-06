import Foundation
import ZippyJSON
                            
// lexicon: 1, id: chat.bsky.actor.deleteAccount


public struct ChatBskyActorDeleteAccount { 

    public static let typeIdentifier = "chat.bsky.actor.deleteAccount"    
    
public struct Output: ATProtocolCodable { 
        
        
        // Standard public initializer
        public init() {
            
        }
    }
    



}
extension ATProtoClient.Chat.Bsky.Actor {
    /// 
    
    public func deleteAccount( duringInitialSetup: Bool = false) async throws -> (responseCode: Int, data: ChatBskyActorDeleteAccount.Output?) {
        let endpoint = "/chat.bsky.actor.deleteAccount"
        
        
        let requestData: Data? = nil
        
        
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
        let decodedData = try? decoder.decode(ChatBskyActorDeleteAccount.Output.self, from: responseData)
        return (responseCode, decodedData)
        
    }
}
                           
