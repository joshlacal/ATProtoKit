import Foundation
import ZippyJSON
                            
// lexicon: 1, id: chat.bsky.convo.sendMessageBatch


public struct ChatBskyConvoSendMessageBatch { 

    public static let typeIdentifier = "chat.bsky.convo.sendMessageBatch"
        
public struct BatchItem: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "chat.bsky.convo.sendMessageBatch#batchItem"
            public let convoId: String
            public let message: ChatBskyConvoDefs.MessageInput

        // Standard initializer
        public init(
            convoId: String, message: ChatBskyConvoDefs.MessageInput
        ) {
            
            self.convoId = convoId
            self.message = message
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            do {
                
                self.convoId = try container.decode(String.self, forKey: .convoId)
                
            } catch {
                print("Decoding error for property 'convoId': \(error)")
                throw error
            }
            do {
                
                self.message = try container.decode(ChatBskyConvoDefs.MessageInput.self, forKey: .message)
                
            } catch {
                print("Decoding error for property 'message': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
            try container.encode(convoId, forKey: .convoId)
            
            
            try container.encode(message, forKey: .message)
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(convoId)
            hasher.combine(message)
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.convoId != other.convoId {
                return false
            }
            
            
            if self.message != other.message {
                return false
            }
            
            return true
        }

        public static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.isEqual(to: rhs)
        }

        private enum CodingKeys: String, CodingKey {
            case typeIdentifier = "$type"
            case convoId
            case message
        }
    }        
public struct Input: ATProtocolCodable {
            public let items: [BatchItem]

            // Standard public initializer
            public init(items: [BatchItem]) {
                self.items = items
                
            }
        }    
    
public struct Output: ATProtocolCodable { 
        
        public let items: [ChatBskyConvoDefs.MessageView]
        
        
        // Standard public initializer
        public init(
            items: [ChatBskyConvoDefs.MessageView]
        ) {
            
            self.items = items
            
        }
    }
    



}
extension ATProtoClient.Chat.Bsky.Convo {
    /// 
    
    public func sendMessageBatch(input: ChatBskyConvoSendMessageBatch.Input, duringInitialSetup: Bool = false) async throws -> (responseCode: Int, data: ChatBskyConvoSendMessageBatch.Output?) {
        let endpoint = "/chat.bsky.convo.sendMessageBatch"
        
        
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
        let decodedData = try? decoder.decode(ChatBskyConvoSendMessageBatch.Output.self, from: responseData)
        return (responseCode, decodedData)
        
    }
}
                           
