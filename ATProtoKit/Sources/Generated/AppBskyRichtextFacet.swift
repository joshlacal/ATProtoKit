import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.richtext.facet


public struct AppBskyRichtextFacet: ATProtocolCodable, ATProtocolValue { 
    public static let typeIdentifier = "app.bsky.richtext.facet"
        public let index: ByteSlice
        public let features: [AppBskyRichtextFacetFeaturesUnion]

        public init(index: ByteSlice, features: [AppBskyRichtextFacetFeaturesUnion]) {
            self.index = index
            self.features = features
            
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.index = try container.decode(ByteSlice.self, forKey: .index)
            
            
            self.features = try container.decode([AppBskyRichtextFacetFeaturesUnion].self, forKey: .features)
            
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            try container.encode(index, forKey: .index)
            
            
            try container.encode(features, forKey: .features)
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(index)
            hasher.combine(features)
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            if self.index != other.index {
                return false
            }
            if self.features != other.features {
                return false
            }
            return true
        }


        private enum CodingKeys: String, CodingKey {
            case index
            case features
        }
        
public struct Mention: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "app.bsky.richtext.facet#mention"
            public let did: String

        // Standard initializer
        public init(
            did: String
        ) {
            
            self.did = did
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.did = try container.decode(String.self, forKey: .did)
            
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            try container.encode(did, forKey: .did)
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(did)
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.did != other.did {
                return false
            }
            
            return true
        }

        private enum CodingKeys: String, CodingKey {
            case did
        }
    }
        
public struct Link: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "app.bsky.richtext.facet#link"
            public let uri: URI

        // Standard initializer
        public init(
            uri: URI
        ) {
            
            self.uri = uri
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.uri = try container.decode(URI.self, forKey: .uri)
            
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            try container.encode(uri, forKey: .uri)
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(uri)
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.uri != other.uri {
                return false
            }
            
            return true
        }

        private enum CodingKeys: String, CodingKey {
            case uri
        }
    }
        
public struct Tag: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "app.bsky.richtext.facet#tag"
            public let tag: String

        // Standard initializer
        public init(
            tag: String
        ) {
            
            self.tag = tag
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.tag = try container.decode(String.self, forKey: .tag)
            
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            try container.encode(tag, forKey: .tag)
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(tag)
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.tag != other.tag {
                return false
            }
            
            return true
        }

        private enum CodingKeys: String, CodingKey {
            case tag
        }
    }
        
public struct ByteSlice: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "app.bsky.richtext.facet#byteSlice"
            public let byteStart: Int
            public let byteEnd: Int

        // Standard initializer
        public init(
            byteStart: Int, byteEnd: Int
        ) {
            
            self.byteStart = byteStart
            self.byteEnd = byteEnd
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.byteStart = try container.decode(Int.self, forKey: .byteStart)
            
            
            self.byteEnd = try container.decode(Int.self, forKey: .byteEnd)
            
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            try container.encode(byteStart, forKey: .byteStart)
            
            
            try container.encode(byteEnd, forKey: .byteEnd)
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(byteStart)
            hasher.combine(byteEnd)
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.byteStart != other.byteStart {
                return false
            }
            
            
            if self.byteEnd != other.byteEnd {
                return false
            }
            
            return true
        }

        private enum CodingKeys: String, CodingKey {
            case byteStart
            case byteEnd
        }
    }


            // Union Type
            
public enum AppBskyRichtextFacetFeaturesUnion: Codable, ATProtocolCodable, ATProtocolValue {
                case appBskyRichtextFacetMention(AppBskyRichtextFacet.Mention)
                case appBskyRichtextFacetLink(AppBskyRichtextFacet.Link)
                case appBskyRichtextFacetTag(AppBskyRichtextFacet.Tag)
                case unexpected(JSONValue)

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    let typeValue = try container.decode(String.self, forKey: .type)
                    print("AppBskyRichtextFacetFeaturesUnion decoding: \(typeValue)")

                    switch typeValue {
                    case "app.bsky.richtext.facet#mention":
                        print("Decoding as app.bsky.richtext.facet#mention")
                        let value = try AppBskyRichtextFacet.Mention(from: decoder)
                        self = .appBskyRichtextFacetMention(value)
                    case "app.bsky.richtext.facet#link":
                        print("Decoding as app.bsky.richtext.facet#link")
                        let value = try AppBskyRichtextFacet.Link(from: decoder)
                        self = .appBskyRichtextFacetLink(value)
                    case "app.bsky.richtext.facet#tag":
                        print("Decoding as app.bsky.richtext.facet#tag")
                        let value = try AppBskyRichtextFacet.Tag(from: decoder)
                        self = .appBskyRichtextFacetTag(value)
                    default:
                        print("AppBskyRichtextFacetFeaturesUnion decoding encountered an unexpected type: \(typeValue)")
                        let unknownValue = try JSONValue(from: decoder)
                        self = .unexpected(unknownValue)
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)

                    switch self {
                    case .appBskyRichtextFacetMention(let value):
                        print("Encoding app.bsky.richtext.facet#mention")
                        try container.encode("app.bsky.richtext.facet#mention", forKey: .type)
                        try value.encode(to: encoder)
                    case .appBskyRichtextFacetLink(let value):
                        print("Encoding app.bsky.richtext.facet#link")
                        try container.encode("app.bsky.richtext.facet#link", forKey: .type)
                        try value.encode(to: encoder)
                    case .appBskyRichtextFacetTag(let value):
                        print("Encoding app.bsky.richtext.facet#tag")
                        try container.encode("app.bsky.richtext.facet#tag", forKey: .type)
                        try value.encode(to: encoder)
                    case .unexpected(let jsonValue):
                        print("AppBskyRichtextFacetFeaturesUnion encoding unexpected value")
                        try jsonValue.encode(to: encoder)
                    }
                }

                public func hash(into hasher: inout Hasher) {
                    switch self {
                    case .appBskyRichtextFacetMention(let value):
                        hasher.combine("app.bsky.richtext.facet#mention")
                        hasher.combine(value)
                    case .appBskyRichtextFacetLink(let value):
                        hasher.combine("app.bsky.richtext.facet#link")
                        hasher.combine(value)
                    case .appBskyRichtextFacetTag(let value):
                        hasher.combine("app.bsky.richtext.facet#tag")
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
                    guard let otherValue = other as? AppBskyRichtextFacetFeaturesUnion else { return false }

                    switch (self, otherValue) {
                        case (.appBskyRichtextFacetMention(let selfValue), 
                            .appBskyRichtextFacetMention(let otherValue)):
                            return selfValue == otherValue
                        case (.appBskyRichtextFacetLink(let selfValue), 
                            .appBskyRichtextFacetLink(let otherValue)):
                            return selfValue == otherValue
                        case (.appBskyRichtextFacetTag(let selfValue), 
                            .appBskyRichtextFacetTag(let otherValue)):
                            return selfValue == otherValue
                        case (.unexpected(let selfValue), .unexpected(let otherValue)):
                            return selfValue.isEqual(to: otherValue)
                        default:
                            return false
                    }
                }
            }


}

                           
