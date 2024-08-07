import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.labeler.service


public struct AppBskyLabelerService: ATProtocolCodable, ATProtocolValue { 

    public static let typeIdentifier = "app.bsky.labeler.service"
        public let policies: AppBskyLabelerDefs.LabelerPolicies
        public let labels: AppBskyLabelerServiceLabelsUnion?
        public let createdAt: ATProtocolDate

        // Standard initializer
        public init(policies: AppBskyLabelerDefs.LabelerPolicies, labels: AppBskyLabelerServiceLabelsUnion?, createdAt: ATProtocolDate) {
            
            self.policies = policies
            
            self.labels = labels
            
            self.createdAt = createdAt
            
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.policies = try container.decode(AppBskyLabelerDefs.LabelerPolicies.self, forKey: .policies)
            
            
            self.labels = try container.decodeIfPresent(AppBskyLabelerServiceLabelsUnion.self, forKey: .labels)
            
            
            self.createdAt = try container.decode(ATProtocolDate.self, forKey: .createdAt)
            
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            // Encode the $type field
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
            try container.encode(policies, forKey: .policies)
            
            
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
            
            if self.policies != other.policies {
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
            hasher.combine(policies)
            if let value = labels {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?) // Placeholder for nil
            }
            hasher.combine(createdAt)
        }

        private enum CodingKeys: String, CodingKey {
            case typeIdentifier = "$type"
            case policies
            case labels
            case createdAt
        }





public enum AppBskyLabelerServiceLabelsUnion: Codable, ATProtocolCodable, ATProtocolValue {
    case comAtprotoLabelDefsSelfLabels(ComAtprotoLabelDefs.SelfLabels)
    case unexpected(ATProtocolValueContainer)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let typeValue = try container.decode(String.self, forKey: .type)
        print("AppBskyLabelerServiceLabelsUnion decoding: \(typeValue)")

        switch typeValue {
        case "com.atproto.label.defs#selfLabels":
            print("Decoding as com.atproto.label.defs#selfLabels")
            let value = try ComAtprotoLabelDefs.SelfLabels(from: decoder)
            self = .comAtprotoLabelDefsSelfLabels(value)
        default:
            print("AppBskyLabelerServiceLabelsUnion decoding encountered an unexpected type: \(typeValue)")
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
            print("AppBskyLabelerServiceLabelsUnion encoding unexpected value")
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
        guard let otherValue = other as? AppBskyLabelerServiceLabelsUnion else { return false }

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

                           
