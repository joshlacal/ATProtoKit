import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.feed.threadgate


public struct AppBskyFeedThreadgate: ATProtocolCodable, ATProtocolValue { 
    public static let typeIdentifier = "app.bsky.feed.threadgate"
        public let post: ATProtocolURI
        public let allow: [AppBskyFeedThreadgateAllowUnion]?
        public let createdAt: ATProtocolDate

        // Standard initializer
        public init(post: ATProtocolURI, allow: [AppBskyFeedThreadgateAllowUnion]?, createdAt: ATProtocolDate) {
            
            self.post = post
            
            self.allow = allow
            
            self.createdAt = createdAt
            
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.post = try container.decode(ATProtocolURI.self, forKey: .post)
            
            
            self.allow = try container.decodeIfPresent([AppBskyFeedThreadgateAllowUnion].self, forKey: .allow)
            
            
            self.createdAt = try container.decode(ATProtocolDate.self, forKey: .createdAt)
            
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            // Encode the $type field
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
            try container.encode(post, forKey: .post)
            
            
            if let value = allow {
                try container.encode(value, forKey: .allow)
            }
            
            
            try container.encode(createdAt, forKey: .createdAt)
            
        }
                                            
        public static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.isEqual(to: rhs)
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.post != other.post {
                return false
            }
            
            
            if allow != other.allow {
                return false
            }
            
            
            if self.createdAt != other.createdAt {
                return false
            }
            
            return true
        }
        

        public func hash(into hasher: inout Hasher) {
            hasher.combine(post)
            if let value = allow {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?) // Placeholder for nil
            }
            hasher.combine(createdAt)
        }

        private enum CodingKeys: String, CodingKey {
            case typeIdentifier = "$type"
            case post
            case allow
            case createdAt
        }
        
public struct MentionRule: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "app.bsky.feed.threadgate#mentionRule"

        // Standard initializer
        public init(
            
        ) {
            
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
        }

        public func hash(into hasher: inout Hasher) {
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            return true
        }

        public static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.isEqual(to: rhs)
        }

        private enum CodingKeys: String, CodingKey {
            case typeIdentifier = "$type"
        }
    }
        
public struct FollowingRule: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "app.bsky.feed.threadgate#followingRule"

        // Standard initializer
        public init(
            
        ) {
            
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
        }

        public func hash(into hasher: inout Hasher) {
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            return true
        }

        public static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.isEqual(to: rhs)
        }

        private enum CodingKeys: String, CodingKey {
            case typeIdentifier = "$type"
        }
    }
        
public struct ListRule: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "app.bsky.feed.threadgate#listRule"
            public let list: ATProtocolURI

        // Standard initializer
        public init(
            list: ATProtocolURI
        ) {
            
            self.list = list
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            do {
                
                self.list = try container.decode(ATProtocolURI.self, forKey: .list)
                
            } catch {
                print("Decoding error for property 'list': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
            try container.encode(list, forKey: .list)
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(list)
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.list != other.list {
                return false
            }
            
            return true
        }

        public static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.isEqual(to: rhs)
        }

        private enum CodingKeys: String, CodingKey {
            case typeIdentifier = "$type"
            case list
        }
    }


            // Union Type
            
public enum AppBskyFeedThreadgateAllowUnion: Codable, ATProtocolCodable, ATProtocolValue {
                case appBskyFeedThreadgateMentionRule(AppBskyFeedThreadgate.MentionRule)
                case appBskyFeedThreadgateFollowingRule(AppBskyFeedThreadgate.FollowingRule)
                case appBskyFeedThreadgateListRule(AppBskyFeedThreadgate.ListRule)
                case unexpected(JSONValue)

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    let typeValue = try container.decode(String.self, forKey: .type)
                    print("AppBskyFeedThreadgateAllowUnion decoding: \(typeValue)")

                    switch typeValue {
                    case "app.bsky.feed.threadgate#mentionRule":
                        print("Decoding as app.bsky.feed.threadgate#mentionRule")
                        let value = try AppBskyFeedThreadgate.MentionRule(from: decoder)
                        self = .appBskyFeedThreadgateMentionRule(value)
                    case "app.bsky.feed.threadgate#followingRule":
                        print("Decoding as app.bsky.feed.threadgate#followingRule")
                        let value = try AppBskyFeedThreadgate.FollowingRule(from: decoder)
                        self = .appBskyFeedThreadgateFollowingRule(value)
                    case "app.bsky.feed.threadgate#listRule":
                        print("Decoding as app.bsky.feed.threadgate#listRule")
                        let value = try AppBskyFeedThreadgate.ListRule(from: decoder)
                        self = .appBskyFeedThreadgateListRule(value)
                    default:
                        print("AppBskyFeedThreadgateAllowUnion decoding encountered an unexpected type: \(typeValue)")
                        let unknownValue = try JSONValue(from: decoder)
                        self = .unexpected(unknownValue)
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)

                    switch self {
                    case .appBskyFeedThreadgateMentionRule(let value):
                        print("Encoding app.bsky.feed.threadgate#mentionRule")
                        try container.encode("app.bsky.feed.threadgate#mentionRule", forKey: .type)
                        try value.encode(to: encoder)
                    case .appBskyFeedThreadgateFollowingRule(let value):
                        print("Encoding app.bsky.feed.threadgate#followingRule")
                        try container.encode("app.bsky.feed.threadgate#followingRule", forKey: .type)
                        try value.encode(to: encoder)
                    case .appBskyFeedThreadgateListRule(let value):
                        print("Encoding app.bsky.feed.threadgate#listRule")
                        try container.encode("app.bsky.feed.threadgate#listRule", forKey: .type)
                        try value.encode(to: encoder)
                    case .unexpected(let jsonValue):
                        print("AppBskyFeedThreadgateAllowUnion encoding unexpected value")
                        try jsonValue.encode(to: encoder)
                    }
                }

                public func hash(into hasher: inout Hasher) {
                    switch self {
                    case .appBskyFeedThreadgateMentionRule(let value):
                        hasher.combine("app.bsky.feed.threadgate#mentionRule")
                        hasher.combine(value)
                    case .appBskyFeedThreadgateFollowingRule(let value):
                        hasher.combine("app.bsky.feed.threadgate#followingRule")
                        hasher.combine(value)
                    case .appBskyFeedThreadgateListRule(let value):
                        hasher.combine("app.bsky.feed.threadgate#listRule")
                        hasher.combine(value)
                    case .unexpected(let jsonValue):
                        hasher.combine("unexpected")
                        hasher.combine(jsonValue)
                    }
                }

                private enum CodingKeys: String, CodingKey {
                    case type = "$type"
                }
                
                public func isEqual(to other: any ATProtocolValue) -> Bool {
                    guard let otherValue = other as? AppBskyFeedThreadgateAllowUnion else { return false }

                    switch (self, otherValue) {
                        case (.appBskyFeedThreadgateMentionRule(let selfValue), 
                            .appBskyFeedThreadgateMentionRule(let otherValue)):
                            return selfValue == otherValue
                        case (.appBskyFeedThreadgateFollowingRule(let selfValue), 
                            .appBskyFeedThreadgateFollowingRule(let otherValue)):
                            return selfValue == otherValue
                        case (.appBskyFeedThreadgateListRule(let selfValue), 
                            .appBskyFeedThreadgateListRule(let otherValue)):
                            return selfValue == otherValue
                        case (.unexpected(let selfValue), .unexpected(let otherValue)):
                            return selfValue.isEqual(to: otherValue)
                        default:
                            return false
                    }
                }
            }


}

                           
