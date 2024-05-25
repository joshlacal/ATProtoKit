import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.feed.post


public struct AppBskyFeedPost: ATProtocolCodable, ATProtocolValue { 

    public static let typeIdentifier = "app.bsky.feed.post"
        public let text: String
        public let entities: [Entity]?
        public let facets: [AppBskyRichtextFacet]?
        public let reply: ReplyRef?
        public let embed: AppBskyFeedPostEmbedUnion?
        public let langs: [LanguageCodeContainer]?
        public let labels: AppBskyFeedPostLabelsUnion?
        public let tags: [String]?
        public let createdAt: ATProtocolDate

        // Standard initializer
        public init(text: String, entities: [Entity]?, facets: [AppBskyRichtextFacet]?, reply: ReplyRef?, embed: AppBskyFeedPostEmbedUnion?, langs: [LanguageCodeContainer]?, labels: AppBskyFeedPostLabelsUnion?, tags: [String]?, createdAt: ATProtocolDate) {
            
            self.text = text
            
            self.entities = entities
            
            self.facets = facets
            
            self.reply = reply
            
            self.embed = embed
            
            self.langs = langs
            
            self.labels = labels
            
            self.tags = tags
            
            self.createdAt = createdAt
            
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.text = try container.decode(String.self, forKey: .text)
            
            
            self.entities = try container.decodeIfPresent([Entity].self, forKey: .entities)
            
            
            self.facets = try container.decodeIfPresent([AppBskyRichtextFacet].self, forKey: .facets)
            
            
            self.reply = try container.decodeIfPresent(ReplyRef.self, forKey: .reply)
            
            
            self.embed = try container.decodeIfPresent(AppBskyFeedPostEmbedUnion.self, forKey: .embed)
            
            
            self.langs = try container.decodeIfPresent([LanguageCodeContainer].self, forKey: .langs)
            
            
            self.labels = try container.decodeIfPresent(AppBskyFeedPostLabelsUnion.self, forKey: .labels)
            
            
            self.tags = try container.decodeIfPresent([String].self, forKey: .tags)
            
            
            self.createdAt = try container.decode(ATProtocolDate.self, forKey: .createdAt)
            
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            // Encode the $type field
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
            try container.encode(text, forKey: .text)
            
            
            if let value = entities {
                try container.encode(value, forKey: .entities)
            }
            
            
            if let value = facets {
                try container.encode(value, forKey: .facets)
            }
            
            
            if let value = reply {
                try container.encode(value, forKey: .reply)
            }
            
            
            if let value = embed {
                try container.encode(value, forKey: .embed)
            }
            
            
            if let value = langs {
                try container.encode(value, forKey: .langs)
            }
            
            
            if let value = labels {
                try container.encode(value, forKey: .labels)
            }
            
            
            if let value = tags {
                try container.encode(value, forKey: .tags)
            }
            
            
            try container.encode(createdAt, forKey: .createdAt)
            
        }
                                            
        public static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.isEqual(to: rhs)
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.text != other.text {
                return false
            }
            
            
            if entities != other.entities {
                return false
            }
            
            
            if facets != other.facets {
                return false
            }
            
            
            if reply != other.reply {
                return false
            }
            
            
            if embed != other.embed {
                return false
            }
            
            
            if langs != other.langs {
                return false
            }
            
            
            if labels != other.labels {
                return false
            }
            
            
            if tags != other.tags {
                return false
            }
            
            
            if self.createdAt != other.createdAt {
                return false
            }
            
            return true
        }
        

        public func hash(into hasher: inout Hasher) {
            hasher.combine(text)
            if let value = entities {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?) // Placeholder for nil
            }
            if let value = facets {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?) // Placeholder for nil
            }
            if let value = reply {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?) // Placeholder for nil
            }
            if let value = embed {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?) // Placeholder for nil
            }
            if let value = langs {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?) // Placeholder for nil
            }
            if let value = labels {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?) // Placeholder for nil
            }
            if let value = tags {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?) // Placeholder for nil
            }
            hasher.combine(createdAt)
        }

        private enum CodingKeys: String, CodingKey {
            case typeIdentifier = "$type"
            case text
            case entities
            case facets
            case reply
            case embed
            case langs
            case labels
            case tags
            case createdAt
        }
        
public struct ReplyRef: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "app.bsky.feed.post#replyRef"
            public let root: ComAtprotoRepoStrongRef
            public let parent: ComAtprotoRepoStrongRef

        // Standard initializer
        public init(
            root: ComAtprotoRepoStrongRef, parent: ComAtprotoRepoStrongRef
        ) {
            
            self.root = root
            self.parent = parent
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            do {
                
                self.root = try container.decode(ComAtprotoRepoStrongRef.self, forKey: .root)
                
            } catch {
                print("Decoding error for property 'root': \(error)")
                throw error
            }
            do {
                
                self.parent = try container.decode(ComAtprotoRepoStrongRef.self, forKey: .parent)
                
            } catch {
                print("Decoding error for property 'parent': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
            try container.encode(root, forKey: .root)
            
            
            try container.encode(parent, forKey: .parent)
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(root)
            hasher.combine(parent)
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.root != other.root {
                return false
            }
            
            
            if self.parent != other.parent {
                return false
            }
            
            return true
        }

        public static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.isEqual(to: rhs)
        }

        private enum CodingKeys: String, CodingKey {
            case typeIdentifier = "$type"
            case root
            case parent
        }
    }
        
public struct Entity: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "app.bsky.feed.post#entity"
            public let index: TextSlice
            public let type: String
            public let value: String

        // Standard initializer
        public init(
            index: TextSlice, type: String, value: String
        ) {
            
            self.index = index
            self.type = type
            self.value = value
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            do {
                
                self.index = try container.decode(TextSlice.self, forKey: .index)
                
            } catch {
                print("Decoding error for property 'index': \(error)")
                throw error
            }
            do {
                
                self.type = try container.decode(String.self, forKey: .type)
                
            } catch {
                print("Decoding error for property 'type': \(error)")
                throw error
            }
            do {
                
                self.value = try container.decode(String.self, forKey: .value)
                
            } catch {
                print("Decoding error for property 'value': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
            try container.encode(index, forKey: .index)
            
            
            try container.encode(type, forKey: .type)
            
            
            try container.encode(value, forKey: .value)
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(index)
            hasher.combine(type)
            hasher.combine(value)
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.index != other.index {
                return false
            }
            
            
            if self.type != other.type {
                return false
            }
            
            
            if self.value != other.value {
                return false
            }
            
            return true
        }

        public static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.isEqual(to: rhs)
        }

        private enum CodingKeys: String, CodingKey {
            case typeIdentifier = "$type"
            case index
            case type
            case value
        }
    }
        
public struct TextSlice: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "app.bsky.feed.post#textSlice"
            public let start: Int
            public let end: Int

        // Standard initializer
        public init(
            start: Int, end: Int
        ) {
            
            self.start = start
            self.end = end
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            do {
                
                self.start = try container.decode(Int.self, forKey: .start)
                
            } catch {
                print("Decoding error for property 'start': \(error)")
                throw error
            }
            do {
                
                self.end = try container.decode(Int.self, forKey: .end)
                
            } catch {
                print("Decoding error for property 'end': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
            try container.encode(start, forKey: .start)
            
            
            try container.encode(end, forKey: .end)
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(start)
            hasher.combine(end)
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.start != other.start {
                return false
            }
            
            
            if self.end != other.end {
                return false
            }
            
            return true
        }

        public static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.isEqual(to: rhs)
        }

        private enum CodingKeys: String, CodingKey {
            case typeIdentifier = "$type"
            case start
            case end
        }
    }


            // Union Type
            
public enum AppBskyFeedPostEmbedUnion: Codable, ATProtocolCodable, ATProtocolValue {
                case appBskyEmbedImages(AppBskyEmbedImages)
                case appBskyEmbedExternal(AppBskyEmbedExternal)
                case appBskyEmbedRecord(AppBskyEmbedRecord)
                case appBskyEmbedRecordWithMedia(AppBskyEmbedRecordWithMedia)
                case unexpected(ATProtocolValueContainer)

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    let typeValue = try container.decode(String.self, forKey: .type)
                    print("AppBskyFeedPostEmbedUnion decoding: \(typeValue)")

                    switch typeValue {
                    case "app.bsky.embed.images":
                        print("Decoding as app.bsky.embed.images")
                        let value = try AppBskyEmbedImages(from: decoder)
                        self = .appBskyEmbedImages(value)
                    case "app.bsky.embed.external":
                        print("Decoding as app.bsky.embed.external")
                        let value = try AppBskyEmbedExternal(from: decoder)
                        self = .appBskyEmbedExternal(value)
                    case "app.bsky.embed.record":
                        print("Decoding as app.bsky.embed.record")
                        let value = try AppBskyEmbedRecord(from: decoder)
                        self = .appBskyEmbedRecord(value)
                    case "app.bsky.embed.recordWithMedia":
                        print("Decoding as app.bsky.embed.recordWithMedia")
                        let value = try AppBskyEmbedRecordWithMedia(from: decoder)
                        self = .appBskyEmbedRecordWithMedia(value)
                    default:
                        print("AppBskyFeedPostEmbedUnion decoding encountered an unexpected type: \(typeValue)")
                        let unknownValue = try ATProtocolValueContainer(from: decoder)
                        self = .unexpected(unknownValue)
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)

                    switch self {
                    case .appBskyEmbedImages(let value):
                        print("Encoding app.bsky.embed.images")
                        try container.encode("app.bsky.embed.images", forKey: .type)
                        try value.encode(to: encoder)
                    case .appBskyEmbedExternal(let value):
                        print("Encoding app.bsky.embed.external")
                        try container.encode("app.bsky.embed.external", forKey: .type)
                        try value.encode(to: encoder)
                    case .appBskyEmbedRecord(let value):
                        print("Encoding app.bsky.embed.record")
                        try container.encode("app.bsky.embed.record", forKey: .type)
                        try value.encode(to: encoder)
                    case .appBskyEmbedRecordWithMedia(let value):
                        print("Encoding app.bsky.embed.recordWithMedia")
                        try container.encode("app.bsky.embed.recordWithMedia", forKey: .type)
                        try value.encode(to: encoder)
                    case .unexpected(let ATProtocolValueContainer):
                        print("AppBskyFeedPostEmbedUnion encoding unexpected value")
                        try ATProtocolValueContainer.encode(to: encoder)
                    }
                }

                public func hash(into hasher: inout Hasher) {
                    switch self {
                    case .appBskyEmbedImages(let value):
                        hasher.combine("app.bsky.embed.images")
                        hasher.combine(value)
                    case .appBskyEmbedExternal(let value):
                        hasher.combine("app.bsky.embed.external")
                        hasher.combine(value)
                    case .appBskyEmbedRecord(let value):
                        hasher.combine("app.bsky.embed.record")
                        hasher.combine(value)
                    case .appBskyEmbedRecordWithMedia(let value):
                        hasher.combine("app.bsky.embed.recordWithMedia")
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
                    guard let otherValue = other as? AppBskyFeedPostEmbedUnion else { return false }

                    switch (self, otherValue) {
                        case (.appBskyEmbedImages(let selfValue), 
                            .appBskyEmbedImages(let otherValue)):
                            return selfValue == otherValue
                        case (.appBskyEmbedExternal(let selfValue), 
                            .appBskyEmbedExternal(let otherValue)):
                            return selfValue == otherValue
                        case (.appBskyEmbedRecord(let selfValue), 
                            .appBskyEmbedRecord(let otherValue)):
                            return selfValue == otherValue
                        case (.appBskyEmbedRecordWithMedia(let selfValue), 
                            .appBskyEmbedRecordWithMedia(let otherValue)):
                            return selfValue == otherValue
                        case (.unexpected(let selfValue), .unexpected(let otherValue)):
                            return selfValue.isEqual(to: otherValue)
                        default:
                            return false
                    }
                }
            }

            // Union Type
            
public enum AppBskyFeedPostLabelsUnion: Codable, ATProtocolCodable, ATProtocolValue {
                case comAtprotoLabelDefsSelfLabels(ComAtprotoLabelDefs.SelfLabels)
                case unexpected(ATProtocolValueContainer)

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    let typeValue = try container.decode(String.self, forKey: .type)
                    print("AppBskyFeedPostLabelsUnion decoding: \(typeValue)")

                    switch typeValue {
                    case "com.atproto.label.defs#selfLabels":
                        print("Decoding as com.atproto.label.defs#selfLabels")
                        let value = try ComAtprotoLabelDefs.SelfLabels(from: decoder)
                        self = .comAtprotoLabelDefsSelfLabels(value)
                    default:
                        print("AppBskyFeedPostLabelsUnion decoding encountered an unexpected type: \(typeValue)")
                        let unknownValue = try ATProtocolValueContainer(from: decoder)
                        self = .unexpected(unknownValue)
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)

                    switch self {
                    case .comAtprotoLabelDefsSelfLabels(let value):
                        print("Encoding com.atproto.label.defs#selfLabels")
                        try container.encode("com.atproto.label.defs#selfLabels", forKey: .type)
                        try value.encode(to: encoder)
                    case .unexpected(let ATProtocolValueContainer):
                        print("AppBskyFeedPostLabelsUnion encoding unexpected value")
                        try ATProtocolValueContainer.encode(to: encoder)
                    }
                }

                public func hash(into hasher: inout Hasher) {
                    switch self {
                    case .comAtprotoLabelDefsSelfLabels(let value):
                        hasher.combine("com.atproto.label.defs#selfLabels")
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
                    guard let otherValue = other as? AppBskyFeedPostLabelsUnion else { return false }

                    switch (self, otherValue) {
                        case (.comAtprotoLabelDefsSelfLabels(let selfValue), 
                            .comAtprotoLabelDefsSelfLabels(let otherValue)):
                            return selfValue == otherValue
                        case (.unexpected(let selfValue), .unexpected(let otherValue)):
                            return selfValue.isEqual(to: otherValue)
                        default:
                            return false
                    }
                }
            }


}

                           
