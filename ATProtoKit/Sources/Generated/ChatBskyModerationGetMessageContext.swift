import Foundation
import ZippyJSON
                            
// lexicon: 1, id: chat.bsky.moderation.getMessageContext


public struct ChatBskyModerationGetMessageContext { 

    public static let typeIdentifier = "chat.bsky.moderation.getMessageContext"    
public struct Parameters: Parametrizable {
        public let convoId: String?
        public let messageId: String
        public let before: Int?
        public let after: Int?
        
        public init(
            convoId: String? = nil, 
            messageId: String, 
            before: Int? = nil, 
            after: Int? = nil
            ) {
            self.convoId = convoId
            self.messageId = messageId
            self.before = before
            self.after = after
            
        }
    }    
    
public struct Output: ATProtocolCodable { 
        
        public let messages: [OutputMessagesUnion]
        
        
        // Standard public initializer
        public init(
            messages: [OutputMessagesUnion]
        ) {
            
            self.messages = messages
            
        }
    }
    





public enum OutputMessagesUnion: Codable, ATProtocolCodable, ATProtocolValue {
    case chatBskyConvoDefsMessageView(ChatBskyConvoDefs.MessageView)
    case chatBskyConvoDefsDeletedMessageView(ChatBskyConvoDefs.DeletedMessageView)
    case unexpected(ATProtocolValueContainer)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let typeValue = try container.decode(String.self, forKey: .type)
        print("OutputMessagesUnion decoding: \(typeValue)")

        switch typeValue {
        case "chat.bsky.convo.defs#messageView":
            print("Decoding as chat.bsky.convo.defs#messageView")
            let value = try ChatBskyConvoDefs.MessageView(from: decoder)
            self = .chatBskyConvoDefsMessageView(value)
        case "chat.bsky.convo.defs#deletedMessageView":
            print("Decoding as chat.bsky.convo.defs#deletedMessageView")
            let value = try ChatBskyConvoDefs.DeletedMessageView(from: decoder)
            self = .chatBskyConvoDefsDeletedMessageView(value)
        default:
            print("OutputMessagesUnion decoding encountered an unexpected type: \(typeValue)")
            let unknownValue = try ATProtocolValueContainer(from: decoder)
            self = .unexpected(unknownValue)
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        switch self {
        case .chatBskyConvoDefsMessageView(let value):
            print("Encoding chat.bsky.convo.defs#messageView")
            try container.encode("chat.bsky.convo.defs#messageView", forKey: .type)
            try value.encode(to: encoder)
        case .chatBskyConvoDefsDeletedMessageView(let value):
            print("Encoding chat.bsky.convo.defs#deletedMessageView")
            try container.encode("chat.bsky.convo.defs#deletedMessageView", forKey: .type)
            try value.encode(to: encoder)
        case .unexpected(let ATProtocolValueContainer):
            print("OutputMessagesUnion encoding unexpected value")
            try ATProtocolValueContainer.encode(to: encoder)
        }
    }

    public func hash(into hasher: inout Hasher) {
        switch self {
        case .chatBskyConvoDefsMessageView(let value):
            hasher.combine("chat.bsky.convo.defs#messageView")
            hasher.combine(value)
        case .chatBskyConvoDefsDeletedMessageView(let value):
            hasher.combine("chat.bsky.convo.defs#deletedMessageView")
            hasher.combine(value)
        case .unexpected(let ATProtocolValueContainer):
            hasher.combine("unexpected")
            hasher.combine(ATProtocolValueContainer)
        }
    }

    private enum CodingKeys: String, CodingKey {
        case type = "$type"
    }
    
    public func isEqual(to other: any ATProtocolValue) -> Bool {
        guard let otherValue = other as? OutputMessagesUnion else { return false }

        switch (self, otherValue) {
            case (.chatBskyConvoDefsMessageView(let selfValue), 
                .chatBskyConvoDefsMessageView(let otherValue)):
                return selfValue == otherValue
            case (.chatBskyConvoDefsDeletedMessageView(let selfValue), 
                .chatBskyConvoDefsDeletedMessageView(let otherValue)):
                return selfValue == otherValue
            case (.unexpected(let selfValue), .unexpected(let otherValue)):
                return selfValue.isEqual(to: otherValue)
            default:
                return false
        }
    }
}


}

extension ATProtoClient.Chat.Bsky.Moderation {
    /// 
    public func getMessageContext(input: ChatBskyModerationGetMessageContext.Parameters) async throws -> (responseCode: Int, data: ChatBskyModerationGetMessageContext.Output?) {
        let endpoint = "/chat.bsky.moderation.getMessageContext"
        
        
        let queryItems = input.asQueryItems()
        let urlRequest = try await networkManager.createURLRequest(
            endpoint: endpoint, 
            method: "GET", 
            headers: [:],
            body: nil, 
            queryItems: queryItems
        )
        
        
        let (responseData, response) = try await networkManager.performRequest(urlRequest, retryCount: 0, duringInitialSetup: false)
        let responseCode = response.statusCode

        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(ChatBskyModerationGetMessageContext.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
