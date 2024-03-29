import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.actor.profile


public struct AppBskyActorProfile: ATProtocolCodable, ATProtocolValue { 
    public static let typeIdentifier = "app.bsky.actor.profile"
        public let displayName: String?
        public let description: String?
        public let avatar: Blob?
        public let banner: Blob?
        public let labels: AppBskyActorProfileLabelsUnion?

        // Standard initializer
        public init(displayName: String?, description: String?, avatar: Blob?, banner: Blob?, labels: AppBskyActorProfileLabelsUnion?) {
            
            self.displayName = displayName
            
            self.description = description
            
            self.avatar = avatar
            
            self.banner = banner
            
            self.labels = labels
            
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.displayName = try container.decodeIfPresent(String.self, forKey: .displayName)
            
            
            self.description = try container.decodeIfPresent(String.self, forKey: .description)
            
            
            self.avatar = try container.decodeIfPresent(Blob.self, forKey: .avatar)
            
            
            self.banner = try container.decodeIfPresent(Blob.self, forKey: .banner)
            
            
            self.labels = try container.decodeIfPresent(AppBskyActorProfileLabelsUnion.self, forKey: .labels)
            
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            // Encode the $type field
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
            if let value = displayName {
                try container.encode(value, forKey: .displayName)
            }
            
            
            if let value = description {
                try container.encode(value, forKey: .description)
            }
            
            
            if let value = avatar {
                try container.encode(value, forKey: .avatar)
            }
            
            
            if let value = banner {
                try container.encode(value, forKey: .banner)
            }
            
            
            if let value = labels {
                try container.encode(value, forKey: .labels)
            }
            
        }
                                            
        public static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.isEqual(to: rhs)
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if displayName != other.displayName {
                return false
            }
            
            
            if description != other.description {
                return false
            }
            
            
            if avatar != other.avatar {
                return false
            }
            
            
            if banner != other.banner {
                return false
            }
            
            
            if labels != other.labels {
                return false
            }
            
            return true
        }
        

        public func hash(into hasher: inout Hasher) {
            if let value = displayName {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?) // Placeholder for nil
            }
            if let value = description {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?) // Placeholder for nil
            }
            if let value = avatar {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?) // Placeholder for nil
            }
            if let value = banner {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?) // Placeholder for nil
            }
            if let value = labels {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?) // Placeholder for nil
            }
        }

        private enum CodingKeys: String, CodingKey {
            case typeIdentifier = "$type"
            case displayName
            case description
            case avatar
            case banner
            case labels
        }


            // Union Type
            
public enum AppBskyActorProfileLabelsUnion: Codable, ATProtocolCodable, ATProtocolValue {
                case comAtprotoLabelDefsSelfLabels(ComAtprotoLabelDefs.SelfLabels)
                case unexpected(JSONValue)

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    let typeValue = try container.decode(String.self, forKey: .type)
                    print("AppBskyActorProfileLabelsUnion decoding: \(typeValue)")

                    switch typeValue {
                    case "com.atproto.label.defs#selfLabels":
                        print("Decoding as com.atproto.label.defs#selfLabels")
                        let value = try ComAtprotoLabelDefs.SelfLabels(from: decoder)
                        self = .comAtprotoLabelDefsSelfLabels(value)
                    default:
                        print("AppBskyActorProfileLabelsUnion decoding encountered an unexpected type: \(typeValue)")
                        let unknownValue = try JSONValue(from: decoder)
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
                    case .unexpected(let jsonValue):
                        print("AppBskyActorProfileLabelsUnion encoding unexpected value")
                        try jsonValue.encode(to: encoder)
                    }
                }

                public func hash(into hasher: inout Hasher) {
                    switch self {
                    case .comAtprotoLabelDefsSelfLabels(let value):
                        hasher.combine("com.atproto.label.defs#selfLabels")
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
                    guard let otherValue = other as? AppBskyActorProfileLabelsUnion else { return false }

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

                           
