import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.embed.recordWithMedia


public struct AppBskyEmbedRecordWithMedia: ATProtocolCodable, ATProtocolValue { 
    public static let typeIdentifier = "app.bsky.embed.recordWithMedia"
        public let record: AppBskyEmbedRecord
        public let media: AppBskyEmbedRecordWithMediaMediaUnion

        public init(record: AppBskyEmbedRecord, media: AppBskyEmbedRecordWithMediaMediaUnion) {
            self.record = record
            self.media = media
            
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.record = try container.decode(AppBskyEmbedRecord.self, forKey: .record)
            
            
            self.media = try container.decode(AppBskyEmbedRecordWithMediaMediaUnion.self, forKey: .media)
            
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            try container.encode(record, forKey: .record)
            
            
            try container.encode(media, forKey: .media)
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(record)
            hasher.combine(media)
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            if self.record != other.record {
                return false
            }
            if self.media != other.media {
                return false
            }
            return true
        }


        private enum CodingKeys: String, CodingKey {
            case record
            case media
        }
        
public struct View: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "app.bsky.embed.recordWithMedia#view"
            public let record: AppBskyEmbedRecord.View
            public let media: ViewMediaUnion

        // Standard initializer
        public init(
            record: AppBskyEmbedRecord.View, media: ViewMediaUnion
        ) {
            
            self.record = record
            self.media = media
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.record = try container.decode(AppBskyEmbedRecord.View.self, forKey: .record)
            
            
            self.media = try container.decode(ViewMediaUnion.self, forKey: .media)
            
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            try container.encode(record, forKey: .record)
            
            
            try container.encode(media, forKey: .media)
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(record)
            hasher.combine(media)
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.record != other.record {
                return false
            }
            
            
            if self.media != other.media {
                return false
            }
            
            return true
        }

        private enum CodingKeys: String, CodingKey {
            case record
            case media
        }
    }


            // Union Type
            
public enum ViewMediaUnion: Codable, ATProtocolCodable, ATProtocolValue {
                case appBskyEmbedImagesView(AppBskyEmbedImages.View)
                case appBskyEmbedExternalView(AppBskyEmbedExternal.View)
                case unexpected(JSONValue)

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    let typeValue = try container.decode(String.self, forKey: .type)
                    print("ViewMediaUnion decoding: \(typeValue)")

                    switch typeValue {
                    case "app.bsky.embed.images#view":
                        print("Decoding as app.bsky.embed.images#view")
                        let value = try AppBskyEmbedImages.View(from: decoder)
                        self = .appBskyEmbedImagesView(value)
                    case "app.bsky.embed.external#view":
                        print("Decoding as app.bsky.embed.external#view")
                        let value = try AppBskyEmbedExternal.View(from: decoder)
                        self = .appBskyEmbedExternalView(value)
                    default:
                        print("ViewMediaUnion decoding encountered an unexpected type: \(typeValue)")
                        let unknownValue = try JSONValue(from: decoder)
                        self = .unexpected(unknownValue)
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)

                    switch self {
                    case .appBskyEmbedImagesView(let value):
                        print("Encoding app.bsky.embed.images#view")
                        try container.encode("app.bsky.embed.images#view", forKey: .type)
                        try value.encode(to: encoder)
                    case .appBskyEmbedExternalView(let value):
                        print("Encoding app.bsky.embed.external#view")
                        try container.encode("app.bsky.embed.external#view", forKey: .type)
                        try value.encode(to: encoder)
                    case .unexpected(let jsonValue):
                        print("ViewMediaUnion encoding unexpected value")
                        try jsonValue.encode(to: encoder)
                    }
                }

                public func hash(into hasher: inout Hasher) {
                    switch self {
                    case .appBskyEmbedImagesView(let value):
                        hasher.combine("app.bsky.embed.images#view")
                        hasher.combine(value)
                    case .appBskyEmbedExternalView(let value):
                        hasher.combine("app.bsky.embed.external#view")
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
                    guard let otherValue = other as? ViewMediaUnion else { return false }

                    switch (self, otherValue) {
                        case (.appBskyEmbedImagesView(let selfValue), 
                            .appBskyEmbedImagesView(let otherValue)):
                            return selfValue == otherValue
                        case (.appBskyEmbedExternalView(let selfValue), 
                            .appBskyEmbedExternalView(let otherValue)):
                            return selfValue == otherValue
                        case (.unexpected(let selfValue), .unexpected(let otherValue)):
                            return selfValue.isEqual(to: otherValue)
                        default:
                            return false
                    }
                }
            }

            // Union Type
            
public enum AppBskyEmbedRecordWithMediaMediaUnion: Codable, ATProtocolCodable, ATProtocolValue {
                case appBskyEmbedImages(AppBskyEmbedImages)
                case appBskyEmbedExternal(AppBskyEmbedExternal)
                case unexpected(JSONValue)

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    let typeValue = try container.decode(String.self, forKey: .type)
                    print("AppBskyEmbedRecordWithMediaMediaUnion decoding: \(typeValue)")

                    switch typeValue {
                    case "app.bsky.embed.images":
                        print("Decoding as app.bsky.embed.images")
                        let value = try AppBskyEmbedImages(from: decoder)
                        self = .appBskyEmbedImages(value)
                    case "app.bsky.embed.external":
                        print("Decoding as app.bsky.embed.external")
                        let value = try AppBskyEmbedExternal(from: decoder)
                        self = .appBskyEmbedExternal(value)
                    default:
                        print("AppBskyEmbedRecordWithMediaMediaUnion decoding encountered an unexpected type: \(typeValue)")
                        let unknownValue = try JSONValue(from: decoder)
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
                    case .unexpected(let jsonValue):
                        print("AppBskyEmbedRecordWithMediaMediaUnion encoding unexpected value")
                        try jsonValue.encode(to: encoder)
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
                    case .unexpected(let jsonValue):
                        hasher.combine("unexpected")
                        hasher.combine(jsonValue)
                    }
                }

                private enum CodingKeys: String, CodingKey {
                    case type = "$type"
                }
                
                public func isEqual(to other: any ATProtocolValue) -> Bool {
                    guard let otherValue = other as? AppBskyEmbedRecordWithMediaMediaUnion else { return false }

                    switch (self, otherValue) {
                        case (.appBskyEmbedImages(let selfValue), 
                            .appBskyEmbedImages(let otherValue)):
                            return selfValue == otherValue
                        case (.appBskyEmbedExternal(let selfValue), 
                            .appBskyEmbedExternal(let otherValue)):
                            return selfValue == otherValue
                        case (.unexpected(let selfValue), .unexpected(let otherValue)):
                            return selfValue.isEqual(to: otherValue)
                        default:
                            return false
                    }
                }
            }


}

                           
