import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.graph.list


public struct AppBskyGraphList: ATProtocolCodable, ATProtocolValue { 
    public static let typeIdentifier = "app.bsky.graph.list"
        public let purpose: AppBskyGraphDefs.ListPurpose
        public let name: String
        public let description: String?
        public let descriptionFacets: [AppBskyRichtextFacet]?
        public let avatar: Blob?
        public let labels: AppBskyGraphListLabelsUnion?
        public let createdAt: ATProtocolDate

        // Standard initializer
        public init(purpose: AppBskyGraphDefs.ListPurpose, name: String, description: String?, descriptionFacets: [AppBskyRichtextFacet]?, avatar: Blob?, labels: AppBskyGraphListLabelsUnion?, createdAt: ATProtocolDate) {
            
            self.purpose = purpose
            
            self.name = name
            
            self.description = description
            
            self.descriptionFacets = descriptionFacets
            
            self.avatar = avatar
            
            self.labels = labels
            
            self.createdAt = createdAt
            
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.purpose = try container.decode(AppBskyGraphDefs.ListPurpose.self, forKey: .purpose)
            
            
            self.name = try container.decode(String.self, forKey: .name)
            
            
            self.description = try container.decodeIfPresent(String.self, forKey: .description)
            
            
            self.descriptionFacets = try container.decodeIfPresent([AppBskyRichtextFacet].self, forKey: .descriptionFacets)
            
            
            self.avatar = try container.decodeIfPresent(Blob.self, forKey: .avatar)
            
            
            self.labels = try container.decodeIfPresent(AppBskyGraphListLabelsUnion.self, forKey: .labels)
            
            
            self.createdAt = try container.decode(ATProtocolDate.self, forKey: .createdAt)
            
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            // Encode the $type field
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
            try container.encode(purpose, forKey: .purpose)
            
            
            try container.encode(name, forKey: .name)
            
            
            if let value = description {
                try container.encode(value, forKey: .description)
            }
            
            
            if let value = descriptionFacets {
                try container.encode(value, forKey: .descriptionFacets)
            }
            
            
            if let value = avatar {
                try container.encode(value, forKey: .avatar)
            }
            
            
            if let value = labels {
                try container.encode(value, forKey: .labels)
            }
            
            
            try container.encode(createdAt, forKey: .createdAt)
            
        }
                                            
        public static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.isEqual(to: rhs)
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.purpose != other.purpose {
                return false
            }
            
            
            if self.name != other.name {
                return false
            }
            
            
            if description != other.description {
                return false
            }
            
            
            if descriptionFacets != other.descriptionFacets {
                return false
            }
            
            
            if avatar != other.avatar {
                return false
            }
            
            
            if labels != other.labels {
                return false
            }
            
            
            if self.createdAt != other.createdAt {
                return false
            }
            
            return true
        }
        

        public func hash(into hasher: inout Hasher) {
            hasher.combine(purpose)
            hasher.combine(name)
            if let value = description {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?) // Placeholder for nil
            }
            if let value = descriptionFacets {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?) // Placeholder for nil
            }
            if let value = avatar {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?) // Placeholder for nil
            }
            if let value = labels {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?) // Placeholder for nil
            }
            hasher.combine(createdAt)
        }

        private enum CodingKeys: String, CodingKey {
            case typeIdentifier = "$type"
            case purpose
            case name
            case description
            case descriptionFacets
            case avatar
            case labels
            case createdAt
        }


            // Union Type
            
public enum AppBskyGraphListLabelsUnion: Codable, ATProtocolCodable, ATProtocolValue {
                case comAtprotoLabelDefsSelfLabels(ComAtprotoLabelDefs.SelfLabels)
                case unexpected(JSONValue)

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    let typeValue = try container.decode(String.self, forKey: .type)
                    print("AppBskyGraphListLabelsUnion decoding: \(typeValue)")

                    switch typeValue {
                    case "com.atproto.label.defs#selfLabels":
                        print("Decoding as com.atproto.label.defs#selfLabels")
                        let value = try ComAtprotoLabelDefs.SelfLabels(from: decoder)
                        self = .comAtprotoLabelDefsSelfLabels(value)
                    default:
                        print("AppBskyGraphListLabelsUnion decoding encountered an unexpected type: \(typeValue)")
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
                        print("AppBskyGraphListLabelsUnion encoding unexpected value")
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
                    guard let otherValue = other as? AppBskyGraphListLabelsUnion else { return false }

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

                           
