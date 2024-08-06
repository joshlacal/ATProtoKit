import Foundation
import ZippyJSON
                            
// lexicon: 1, id: chat.bsky.convo.sendMessage


public struct ChatBskyConvoSendMessage { 

    public static let typeIdentifier = "chat.bsky.convo.sendMessage"        
public struct Input: ATProtocolCodable {
            public let convoId: String
            public let message: ChatBskyConvoDefs.MessageInput

            // Standard public initializer
            public init(convoId: String, message: ChatBskyConvoDefs.MessageInput) {
                self.convoId = convoId
                self.message = message
                
            }
        }    
    public typealias Output = ChatBskyConvoDefs.MessageView
    



}
extension ATProtoClient.Chat.Bsky.Convo {
    /// 
    
    public func sendMessage(input: ChatBskyConvoSendMessage.Input, duringInitialSetup: Bool = false) async throws -> (responseCode: Int, data: ChatBskyConvoSendMessage.Output?) {
        let endpoint = "/chat.bsky.convo.sendMessage"
        
        
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
        let decodedData = try? decoder.decode(ChatBskyConvoSendMessage.Output.self, from: responseData)
        return (responseCode, decodedData)
        
    }
}
                           
