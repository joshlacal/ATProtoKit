import Foundation
import ZippyJSON
                            
// lexicon: 1, id: chat.bsky.convo.leaveConvo


public struct ChatBskyConvoLeaveConvo { 

    public static let typeIdentifier = "chat.bsky.convo.leaveConvo"        
public struct Input: ATProtocolCodable {
            public let convoId: String

            // Standard public initializer
            public init(convoId: String) {
                self.convoId = convoId
                
            }
        }    
    
public struct Output: ATProtocolCodable { 
        
        public let convoId: String
        
        public let rev: String
        
        
        // Standard public initializer
        public init(
            convoId: String, 
        
            rev: String
        ) {
            
            self.convoId = convoId
            
            self.rev = rev
            
        }
    }
    



}
extension ATProtoClient.Chat.Bsky.Convo {
    /// 
    public func leaveConvo(input: ChatBskyConvoLeaveConvo.Input, duringInitialSetup: Bool = false) async throws -> (responseCode: Int, data: ChatBskyConvoLeaveConvo.Output?) {
        let endpoint = "/chat.bsky.convo.leaveConvo"
        
        
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
        let decodedData = try? decoder.decode(ChatBskyConvoLeaveConvo.Output.self, from: responseData)
        return (responseCode, decodedData)
        
    }
}
                           
