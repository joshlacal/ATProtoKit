import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.feed.getPostThread


public struct AppBskyFeedGetPostThread { 

    public static let typeIdentifier = "app.bsky.feed.getPostThread"    
public struct Parameters: Parametrizable {
        public let uri: ATProtocolURI
        public let depth: Int?
        public let parentHeight: Int?
        
        public init(
            uri: ATProtocolURI, 
            depth: Int? = nil, 
            parentHeight: Int? = nil
            ) {
            self.uri = uri
            self.depth = depth
            self.parentHeight = parentHeight
            
        }
    }    
    
public struct Output: ATProtocolCodable { 
        
        public let thread: OutputThreadUnion
        
        
        // Standard public initializer
        public init(
            thread: OutputThreadUnion
        ) {
            
            self.thread = thread
            
        }
    }
            
public enum Error: String, Swift.Error, CustomStringConvertible {
                case notFound = "NotFound."
            public var description: String {
                return self.rawValue
            }
        }




public indirect enum OutputThreadUnion: Codable, ATProtocolCodable, ATProtocolValue {
    case appBskyFeedDefsThreadViewPost(AppBskyFeedDefs.ThreadViewPost)
    case appBskyFeedDefsNotFoundPost(AppBskyFeedDefs.NotFoundPost)
    case appBskyFeedDefsBlockedPost(AppBskyFeedDefs.BlockedPost)
    case unexpected(ATProtocolValueContainer)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let typeValue = try container.decode(String.self, forKey: .type)
        print("OutputThreadUnion decoding: \(typeValue)")

        switch typeValue {
        case "app.bsky.feed.defs#threadViewPost":
            print("Decoding as app.bsky.feed.defs#threadViewPost")
            let value = try AppBskyFeedDefs.ThreadViewPost(from: decoder)
            self = .appBskyFeedDefsThreadViewPost(value)
        case "app.bsky.feed.defs#notFoundPost":
            print("Decoding as app.bsky.feed.defs#notFoundPost")
            let value = try AppBskyFeedDefs.NotFoundPost(from: decoder)
            self = .appBskyFeedDefsNotFoundPost(value)
        case "app.bsky.feed.defs#blockedPost":
            print("Decoding as app.bsky.feed.defs#blockedPost")
            let value = try AppBskyFeedDefs.BlockedPost(from: decoder)
            self = .appBskyFeedDefsBlockedPost(value)
        default:
            print("OutputThreadUnion decoding encountered an unexpected type: \(typeValue)")
            let unknownValue = try ATProtocolValueContainer(from: decoder)
            self = .unexpected(unknownValue)
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        switch self {
        case .appBskyFeedDefsThreadViewPost(let value):
            print("Encoding app.bsky.feed.defs#threadViewPost")
            try container.encode("app.bsky.feed.defs#threadViewPost", forKey: .type)
            try value.encode(to: encoder)
        case .appBskyFeedDefsNotFoundPost(let value):
            print("Encoding app.bsky.feed.defs#notFoundPost")
            try container.encode("app.bsky.feed.defs#notFoundPost", forKey: .type)
            try value.encode(to: encoder)
        case .appBskyFeedDefsBlockedPost(let value):
            print("Encoding app.bsky.feed.defs#blockedPost")
            try container.encode("app.bsky.feed.defs#blockedPost", forKey: .type)
            try value.encode(to: encoder)
        case .unexpected(let ATProtocolValueContainer):
            print("OutputThreadUnion encoding unexpected value")
            try ATProtocolValueContainer.encode(to: encoder)
        }
    }

    public func hash(into hasher: inout Hasher) {
        switch self {
        case .appBskyFeedDefsThreadViewPost(let value):
            hasher.combine("app.bsky.feed.defs#threadViewPost")
            hasher.combine(value)
        case .appBskyFeedDefsNotFoundPost(let value):
            hasher.combine("app.bsky.feed.defs#notFoundPost")
            hasher.combine(value)
        case .appBskyFeedDefsBlockedPost(let value):
            hasher.combine("app.bsky.feed.defs#blockedPost")
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
        guard let otherValue = other as? OutputThreadUnion else { return false }

        switch (self, otherValue) {
            case (.appBskyFeedDefsThreadViewPost(let selfValue), 
                .appBskyFeedDefsThreadViewPost(let otherValue)):
                return selfValue == otherValue
            case (.appBskyFeedDefsNotFoundPost(let selfValue), 
                .appBskyFeedDefsNotFoundPost(let otherValue)):
                return selfValue == otherValue
            case (.appBskyFeedDefsBlockedPost(let selfValue), 
                .appBskyFeedDefsBlockedPost(let otherValue)):
                return selfValue == otherValue
            case (.unexpected(let selfValue), .unexpected(let otherValue)):
                return selfValue.isEqual(to: otherValue)
            default:
                return false
        }
    }
}


}

extension ATProtoClient.App.Bsky.Feed {
    /// Get posts in a thread. Does not require auth, but additional metadata and filtering will be applied for authed requests.
    public func getPostThread(input: AppBskyFeedGetPostThread.Parameters) async throws -> (responseCode: Int, data: AppBskyFeedGetPostThread.Output?) {
        let endpoint = "/app.bsky.feed.getPostThread"
        
        
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
        let decodedData = try? decoder.decode(AppBskyFeedGetPostThread.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
