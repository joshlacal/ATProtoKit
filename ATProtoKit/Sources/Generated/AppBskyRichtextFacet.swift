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
 
        public static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.isEqual(to: rhs)
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
            do {
                
                self.did = try container.decode(String.self, forKey: .did)
                
            } catch {
                print("Decoding error for property 'did': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
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

        public static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.isEqual(to: rhs)
        }

        private enum CodingKeys: String, CodingKey {
            case typeIdentifier = "$type"
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
            do {
                
                self.uri = try container.decode(URI.self, forKey: .uri)
                
            } catch {
                print("Decoding error for property 'uri': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
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

        public static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.isEqual(to: rhs)
        }

        private enum CodingKeys: String, CodingKey {
            case typeIdentifier = "$type"
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
            do {
                
                self.tag = try container.decode(String.self, forKey: .tag)
                
            } catch {
                print("Decoding error for property 'tag': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
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

        public static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.isEqual(to: rhs)
        }

        private enum CodingKeys: String, CodingKey {
            case typeIdentifier = "$type"
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
            do {
                
                self.byteStart = try container.decode(Int.self, forKey: .byteStart)
                
            } catch {
                print("Decoding error for property 'byteStart': \(error)")
                throw error
            }
            do {
                
                self.byteEnd = try container.decode(Int.self, forKey: .byteEnd)
                
            } catch {
                print("Decoding error for property 'byteEnd': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
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

        public static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.isEqual(to: rhs)
        }

        private enum CodingKeys: String, CodingKey {
            case typeIdentifier = "$type"
            case byteStart
            case byteEnd
        }
    }





public enum AppBskyRichtextFacetFeaturesUnion: Codable, ATProtocolCodable, ATProtocolValue {
    case appBskyRichtextFacetMention(AppBskyRichtextFacet.Mention)
    case appBskyRichtextFacetLink(AppBskyRichtextFacet.Link)
    case appBskyRichtextFacetTag(AppBskyRichtextFacet.Tag)
    case unexpected(ATProtocolValueContainer)

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
            let unknownValue = try ATProtocolValueContainer(from: decoder)
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
        case .unexpected(let ATProtocolValueContainer):
            print("AppBskyRichtextFacetFeaturesUnion encoding unexpected value")
            try ATProtocolValueContainer.encode(to: encoder)
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
        case .unexpected(let ATProtocolValueContainer):
            hasher.combine("unexpected")
            hasher.combine(ATProtocolValueContainer)
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

// Union Array Type


public struct Features: Codable, ATProtocolCodable, ATProtocolValue {
    public let items: [FeaturesForUnionArray]

    public init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        var items = [FeaturesForUnionArray]()
        while !container.isAtEnd {
            let item = try container.decode(FeaturesForUnionArray.self)
            items.append(item)
        }
        self.items = items
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()
        for item in items {
            try container.encode(item)
        }
    }

    public func isEqual(to other: any ATProtocolValue) -> Bool {
        guard let other = other as? Self else { return false }
        
        if self.items != other.items {
            return false
        }

        return true
    }

}


public enum FeaturesForUnionArray: Codable, ATProtocolCodable, ATProtocolValue {
    case mention(Mention)
    case link(Link)
    case tag(Tag)
    case unexpected(ATProtocolValueContainer)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let typeValue = try container.decode(String.self, forKey: .type)

        switch typeValue {
        case "Mention":
            let value = try Mention(from: decoder)
            self = .mention(value)
        case "Link":
            let value = try Link(from: decoder)
            self = .link(value)
        case "Tag":
            let value = try Tag(from: decoder)
            self = .tag(value)
        default:
            let unknownValue = try ATProtocolValueContainer(from: decoder)
            self = .unexpected(unknownValue)
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        switch self {
        case .mention(let value):
            try container.encode("Mention", forKey: .type)
            try value.encode(to: encoder)
        case .link(let value):
            try container.encode("Link", forKey: .type)
            try value.encode(to: encoder)
        case .tag(let value):
            try container.encode("Tag", forKey: .type)
            try value.encode(to: encoder)
        case .unexpected(let ATProtocolValueContainer):
            try ATProtocolValueContainer.encode(to: encoder)
        }
    }

    public func hash(into hasher: inout Hasher) {
        switch self {
        case .mention(let value):
            hasher.combine("Mention")
            hasher.combine(value)
        case .link(let value):
            hasher.combine("Link")
            hasher.combine(value)
        case .tag(let value):
            hasher.combine("Tag")
            hasher.combine(value)
        case .unexpected(let ATProtocolValueContainer):
            hasher.combine("unexpected")
            hasher.combine(ATProtocolValueContainer)
        }
    }

    public func isEqual(to other: any ATProtocolValue) -> Bool {
        guard let otherValue = other as? FeaturesForUnionArray else { return false }

        switch (self, otherValue) {
        case (.mention(let selfValue), 
              .mention(let otherValue)):
            return selfValue == otherValue
        case (.link(let selfValue), 
              .link(let otherValue)):
            return selfValue == otherValue
        case (.tag(let selfValue), 
              .tag(let otherValue)):
            return selfValue == otherValue
        case (.unexpected(let selfValue), .unexpected(let otherValue)):
            return selfValue.isEqual(to: otherValue)
        default:
            return false
        }
    }

    private enum CodingKeys: String, CodingKey {
        case type = "$type"
    }
}


}

                           
