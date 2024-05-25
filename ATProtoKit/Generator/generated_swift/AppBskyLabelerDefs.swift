import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.labeler.defs


public struct AppBskyLabelerDefs { 

    public static let typeIdentifier = "app.bsky.labeler.defs"
        
public struct LabelerView: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "app.bsky.labeler.defs#labelerView"
            public let uri: ATProtocolURI
            public let cid: String
            public let creator: AppBskyActorDefs.ProfileView
            public let likeCount: Int?
            public let viewer: LabelerViewerState?
            public let indexedAt: ATProtocolDate
            public let labels: [ComAtprotoLabelDefs.Label]?

        // Standard initializer
        public init(
            uri: ATProtocolURI, cid: String, creator: AppBskyActorDefs.ProfileView, likeCount: Int?, viewer: LabelerViewerState?, indexedAt: ATProtocolDate, labels: [ComAtprotoLabelDefs.Label]?
        ) {
            
            self.uri = uri
            self.cid = cid
            self.creator = creator
            self.likeCount = likeCount
            self.viewer = viewer
            self.indexedAt = indexedAt
            self.labels = labels
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            do {
                
                self.uri = try container.decode(ATProtocolURI.self, forKey: .uri)
                
            } catch {
                print("Decoding error for property 'uri': \(error)")
                throw error
            }
            do {
                
                self.cid = try container.decode(String.self, forKey: .cid)
                
            } catch {
                print("Decoding error for property 'cid': \(error)")
                throw error
            }
            do {
                
                self.creator = try container.decode(AppBskyActorDefs.ProfileView.self, forKey: .creator)
                
            } catch {
                print("Decoding error for property 'creator': \(error)")
                throw error
            }
            do {
                
                self.likeCount = try container.decodeIfPresent(Int.self, forKey: .likeCount)
                
            } catch {
                print("Decoding error for property 'likeCount': \(error)")
                throw error
            }
            do {
                
                self.viewer = try container.decodeIfPresent(LabelerViewerState.self, forKey: .viewer)
                
            } catch {
                print("Decoding error for property 'viewer': \(error)")
                throw error
            }
            do {
                
                self.indexedAt = try container.decode(ATProtocolDate.self, forKey: .indexedAt)
                
            } catch {
                print("Decoding error for property 'indexedAt': \(error)")
                throw error
            }
            do {
                
                self.labels = try container.decodeIfPresent([ComAtprotoLabelDefs.Label].self, forKey: .labels)
                
            } catch {
                print("Decoding error for property 'labels': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
            try container.encode(uri, forKey: .uri)
            
            
            try container.encode(cid, forKey: .cid)
            
            
            try container.encode(creator, forKey: .creator)
            
            
            if let value = likeCount {
                try container.encode(value, forKey: .likeCount)
            }
            
            
            if let value = viewer {
                try container.encode(value, forKey: .viewer)
            }
            
            
            try container.encode(indexedAt, forKey: .indexedAt)
            
            
            if let value = labels {
                try container.encode(value, forKey: .labels)
            }
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(uri)
            hasher.combine(cid)
            hasher.combine(creator)
            if let value = likeCount {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = viewer {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            hasher.combine(indexedAt)
            if let value = labels {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.uri != other.uri {
                return false
            }
            
            
            if self.cid != other.cid {
                return false
            }
            
            
            if self.creator != other.creator {
                return false
            }
            
            
            if likeCount != other.likeCount {
                return false
            }
            
            
            if viewer != other.viewer {
                return false
            }
            
            
            if self.indexedAt != other.indexedAt {
                return false
            }
            
            
            if labels != other.labels {
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
            case cid
            case creator
            case likeCount
            case viewer
            case indexedAt
            case labels
        }
    }
        
public struct LabelerViewDetailed: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "app.bsky.labeler.defs#labelerViewDetailed"
            public let uri: ATProtocolURI
            public let cid: String
            public let creator: AppBskyActorDefs.ProfileView
            public let policies: AppBskyLabelerDefs.LabelerPolicies
            public let likeCount: Int?
            public let viewer: LabelerViewerState?
            public let indexedAt: ATProtocolDate
            public let labels: [ComAtprotoLabelDefs.Label]?

        // Standard initializer
        public init(
            uri: ATProtocolURI, cid: String, creator: AppBskyActorDefs.ProfileView, policies: AppBskyLabelerDefs.LabelerPolicies, likeCount: Int?, viewer: LabelerViewerState?, indexedAt: ATProtocolDate, labels: [ComAtprotoLabelDefs.Label]?
        ) {
            
            self.uri = uri
            self.cid = cid
            self.creator = creator
            self.policies = policies
            self.likeCount = likeCount
            self.viewer = viewer
            self.indexedAt = indexedAt
            self.labels = labels
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            do {
                
                self.uri = try container.decode(ATProtocolURI.self, forKey: .uri)
                
            } catch {
                print("Decoding error for property 'uri': \(error)")
                throw error
            }
            do {
                
                self.cid = try container.decode(String.self, forKey: .cid)
                
            } catch {
                print("Decoding error for property 'cid': \(error)")
                throw error
            }
            do {
                
                self.creator = try container.decode(AppBskyActorDefs.ProfileView.self, forKey: .creator)
                
            } catch {
                print("Decoding error for property 'creator': \(error)")
                throw error
            }
            do {
                
                self.policies = try container.decode(AppBskyLabelerDefs.LabelerPolicies.self, forKey: .policies)
                
            } catch {
                print("Decoding error for property 'policies': \(error)")
                throw error
            }
            do {
                
                self.likeCount = try container.decodeIfPresent(Int.self, forKey: .likeCount)
                
            } catch {
                print("Decoding error for property 'likeCount': \(error)")
                throw error
            }
            do {
                
                self.viewer = try container.decodeIfPresent(LabelerViewerState.self, forKey: .viewer)
                
            } catch {
                print("Decoding error for property 'viewer': \(error)")
                throw error
            }
            do {
                
                self.indexedAt = try container.decode(ATProtocolDate.self, forKey: .indexedAt)
                
            } catch {
                print("Decoding error for property 'indexedAt': \(error)")
                throw error
            }
            do {
                
                self.labels = try container.decodeIfPresent([ComAtprotoLabelDefs.Label].self, forKey: .labels)
                
            } catch {
                print("Decoding error for property 'labels': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
            try container.encode(uri, forKey: .uri)
            
            
            try container.encode(cid, forKey: .cid)
            
            
            try container.encode(creator, forKey: .creator)
            
            
            try container.encode(policies, forKey: .policies)
            
            
            if let value = likeCount {
                try container.encode(value, forKey: .likeCount)
            }
            
            
            if let value = viewer {
                try container.encode(value, forKey: .viewer)
            }
            
            
            try container.encode(indexedAt, forKey: .indexedAt)
            
            
            if let value = labels {
                try container.encode(value, forKey: .labels)
            }
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(uri)
            hasher.combine(cid)
            hasher.combine(creator)
            hasher.combine(policies)
            if let value = likeCount {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = viewer {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            hasher.combine(indexedAt)
            if let value = labels {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.uri != other.uri {
                return false
            }
            
            
            if self.cid != other.cid {
                return false
            }
            
            
            if self.creator != other.creator {
                return false
            }
            
            
            if self.policies != other.policies {
                return false
            }
            
            
            if likeCount != other.likeCount {
                return false
            }
            
            
            if viewer != other.viewer {
                return false
            }
            
            
            if self.indexedAt != other.indexedAt {
                return false
            }
            
            
            if labels != other.labels {
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
            case cid
            case creator
            case policies
            case likeCount
            case viewer
            case indexedAt
            case labels
        }
    }
        
public struct LabelerViewerState: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "app.bsky.labeler.defs#labelerViewerState"
            public let like: ATProtocolURI?

        // Standard initializer
        public init(
            like: ATProtocolURI?
        ) {
            
            self.like = like
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            do {
                
                self.like = try container.decodeIfPresent(ATProtocolURI.self, forKey: .like)
                
            } catch {
                print("Decoding error for property 'like': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
            if let value = like {
                try container.encode(value, forKey: .like)
            }
            
        }

        public func hash(into hasher: inout Hasher) {
            if let value = like {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if like != other.like {
                return false
            }
            
            return true
        }

        public static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.isEqual(to: rhs)
        }

        private enum CodingKeys: String, CodingKey {
            case typeIdentifier = "$type"
            case like
        }
    }
        
public struct LabelerPolicies: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "app.bsky.labeler.defs#labelerPolicies"
            public let labelValues: [ComAtprotoLabelDefs.LabelValue]
            public let labelValueDefinitions: [ComAtprotoLabelDefs.LabelValueDefinition]?

        // Standard initializer
        public init(
            labelValues: [ComAtprotoLabelDefs.LabelValue], labelValueDefinitions: [ComAtprotoLabelDefs.LabelValueDefinition]?
        ) {
            
            self.labelValues = labelValues
            self.labelValueDefinitions = labelValueDefinitions
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            do {
                
                self.labelValues = try container.decode([ComAtprotoLabelDefs.LabelValue].self, forKey: .labelValues)
                
            } catch {
                print("Decoding error for property 'labelValues': \(error)")
                throw error
            }
            do {
                
                self.labelValueDefinitions = try container.decodeIfPresent([ComAtprotoLabelDefs.LabelValueDefinition].self, forKey: .labelValueDefinitions)
                
            } catch {
                print("Decoding error for property 'labelValueDefinitions': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
            try container.encode(labelValues, forKey: .labelValues)
            
            
            if let value = labelValueDefinitions {
                try container.encode(value, forKey: .labelValueDefinitions)
            }
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(labelValues)
            if let value = labelValueDefinitions {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.labelValues != other.labelValues {
                return false
            }
            
            
            if labelValueDefinitions != other.labelValueDefinitions {
                return false
            }
            
            return true
        }

        public static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.isEqual(to: rhs)
        }

        private enum CodingKeys: String, CodingKey {
            case typeIdentifier = "$type"
            case labelValues
            case labelValueDefinitions
        }
    }



}

                           
