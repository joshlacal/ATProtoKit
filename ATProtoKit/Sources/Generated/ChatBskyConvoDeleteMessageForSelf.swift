import Foundation
import ZippyJSON
                            
// lexicon: 1, id: chat.bsky.convo.deleteMessageForSelf


public struct ChatBskyConvoDeleteMessageForSelf { 

    public static let typeIdentifier = "chat.bsky.convo.deleteMessageForSelf"        
public struct Input: ATProtocolCodable {
            public let convoId: String
            public let messageId: String

            // Standard public initializer
            public init(convoId: String, messageId: String) {
                self.convoId = convoId
                self.messageId = messageId
                
            }
        }    
    public typealias Output = ChatBskyConvoDefs.DeletedMessageView
    



}
extension ATProtoClient.Chat.Bsky.Convo {
    /// 
    public func deleteMessageForSelf(input: ChatBskyConvoDeleteMessageForSelf.Input, duringInitialSetup: Bool = false) async throws -> (responseCode: Int, data: ChatBskyConvoDeleteMessageForSelf.Output?) {
        let endpoint = "/chat.bsky.convo.deleteMessageForSelf"
        
        
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
        let decodedData = try? decoder.decode(ChatBskyConvoDeleteMessageForSelf.Output.self, from: responseData)
        return (responseCode, decodedData)
        
    }
}
                           
