import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.graph.defs


public struct AppBskyGraphDefs { 

    public static let typeIdentifier = "app.bsky.graph.defs"
        
public struct ListViewBasic: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "app.bsky.graph.defs#listViewBasic"
            public let uri: ATProtocolURI
            public let cid: String
            public let name: String
            public let purpose: ListPurpose
            public let avatar: URI?
            public let labels: [ComAtprotoLabelDefs.Label]?
            public let viewer: ListViewerState?
            public let indexedAt: ATProtocolDate?

        // Standard initializer
        public init(
            uri: ATProtocolURI, cid: String, name: String, purpose: ListPurpose, avatar: URI?, labels: [ComAtprotoLabelDefs.Label]?, viewer: ListViewerState?, indexedAt: ATProtocolDate?
        ) {
            
            self.uri = uri
            self.cid = cid
            self.name = name
            self.purpose = purpose
            self.avatar = avatar
            self.labels = labels
            self.viewer = viewer
            self.indexedAt = indexedAt
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
                
                self.name = try container.decode(String.self, forKey: .name)
                
            } catch {
                print("Decoding error for property 'name': \(error)")
                throw error
            }
            do {
                
                self.purpose = try container.decode(ListPurpose.self, forKey: .purpose)
                
            } catch {
                print("Decoding error for property 'purpose': \(error)")
                throw error
            }
            do {
                
                self.avatar = try container.decodeIfPresent(URI.self, forKey: .avatar)
                
            } catch {
                print("Decoding error for property 'avatar': \(error)")
                throw error
            }
            do {
                
                self.labels = try container.decodeIfPresent([ComAtprotoLabelDefs.Label].self, forKey: .labels)
                
            } catch {
                print("Decoding error for property 'labels': \(error)")
                throw error
            }
            do {
                
                self.viewer = try container.decodeIfPresent(ListViewerState.self, forKey: .viewer)
                
            } catch {
                print("Decoding error for property 'viewer': \(error)")
                throw error
            }
            do {
                
                self.indexedAt = try container.decodeIfPresent(ATProtocolDate.self, forKey: .indexedAt)
                
            } catch {
                print("Decoding error for property 'indexedAt': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
            try container.encode(uri, forKey: .uri)
            
            
            try container.encode(cid, forKey: .cid)
            
            
            try container.encode(name, forKey: .name)
            
            
            try container.encode(purpose, forKey: .purpose)
            
            
            if let value = avatar {
                try container.encode(value, forKey: .avatar)
            }
            
            
            if let value = labels {
                try container.encode(value, forKey: .labels)
            }
            
            
            if let value = viewer {
                try container.encode(value, forKey: .viewer)
            }
            
            
            if let value = indexedAt {
                try container.encode(value, forKey: .indexedAt)
            }
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(uri)
            hasher.combine(cid)
            hasher.combine(name)
            hasher.combine(purpose)
            if let value = avatar {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = labels {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = viewer {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = indexedAt {
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
            
            
            if self.name != other.name {
                return false
            }
            
            
            if self.purpose != other.purpose {
                return false
            }
            
            
            if avatar != other.avatar {
                return false
            }
            
            
            if labels != other.labels {
                return false
            }
            
            
            if viewer != other.viewer {
                return false
            }
            
            
            if indexedAt != other.indexedAt {
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
            case name
            case purpose
            case avatar
            case labels
            case viewer
            case indexedAt
        }
    }
        
public struct ListView: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "app.bsky.graph.defs#listView"
            public let uri: ATProtocolURI
            public let cid: String
            public let creator: AppBskyActorDefs.ProfileView
            public let name: String
            public let purpose: ListPurpose
            public let description: String?
            public let descriptionFacets: [AppBskyRichtextFacet]?
            public let avatar: URI?
            public let labels: [ComAtprotoLabelDefs.Label]?
            public let viewer: ListViewerState?
            public let indexedAt: ATProtocolDate

        // Standard initializer
        public init(
            uri: ATProtocolURI, cid: String, creator: AppBskyActorDefs.ProfileView, name: String, purpose: ListPurpose, description: String?, descriptionFacets: [AppBskyRichtextFacet]?, avatar: URI?, labels: [ComAtprotoLabelDefs.Label]?, viewer: ListViewerState?, indexedAt: ATProtocolDate
        ) {
            
            self.uri = uri
            self.cid = cid
            self.creator = creator
            self.name = name
            self.purpose = purpose
            self.description = description
            self.descriptionFacets = descriptionFacets
            self.avatar = avatar
            self.labels = labels
            self.viewer = viewer
            self.indexedAt = indexedAt
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
                
                self.name = try container.decode(String.self, forKey: .name)
                
            } catch {
                print("Decoding error for property 'name': \(error)")
                throw error
            }
            do {
                
                self.purpose = try container.decode(ListPurpose.self, forKey: .purpose)
                
            } catch {
                print("Decoding error for property 'purpose': \(error)")
                throw error
            }
            do {
                
                self.description = try container.decodeIfPresent(String.self, forKey: .description)
                
            } catch {
                print("Decoding error for property 'description': \(error)")
                throw error
            }
            do {
                
                self.descriptionFacets = try container.decodeIfPresent([AppBskyRichtextFacet].self, forKey: .descriptionFacets)
                
            } catch {
                print("Decoding error for property 'descriptionFacets': \(error)")
                throw error
            }
            do {
                
                self.avatar = try container.decodeIfPresent(URI.self, forKey: .avatar)
                
            } catch {
                print("Decoding error for property 'avatar': \(error)")
                throw error
            }
            do {
                
                self.labels = try container.decodeIfPresent([ComAtprotoLabelDefs.Label].self, forKey: .labels)
                
            } catch {
                print("Decoding error for property 'labels': \(error)")
                throw error
            }
            do {
                
                self.viewer = try container.decodeIfPresent(ListViewerState.self, forKey: .viewer)
                
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
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
            try container.encode(uri, forKey: .uri)
            
            
            try container.encode(cid, forKey: .cid)
            
            
            try container.encode(creator, forKey: .creator)
            
            
            try container.encode(name, forKey: .name)
            
            
            try container.encode(purpose, forKey: .purpose)
            
            
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
            
            
            if let value = viewer {
                try container.encode(value, forKey: .viewer)
            }
            
            
            try container.encode(indexedAt, forKey: .indexedAt)
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(uri)
            hasher.combine(cid)
            hasher.combine(creator)
            hasher.combine(name)
            hasher.combine(purpose)
            if let value = description {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = descriptionFacets {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = avatar {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = labels {
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
            
            
            if self.name != other.name {
                return false
            }
            
            
            if self.purpose != other.purpose {
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
            
            
            if viewer != other.viewer {
                return false
            }
            
            
            if self.indexedAt != other.indexedAt {
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
            case name
            case purpose
            case description
            case descriptionFacets
            case avatar
            case labels
            case viewer
            case indexedAt
        }
    }
        
public struct ListItemView: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "app.bsky.graph.defs#listItemView"
            public let uri: ATProtocolURI
            public let subject: AppBskyActorDefs.ProfileView

        // Standard initializer
        public init(
            uri: ATProtocolURI, subject: AppBskyActorDefs.ProfileView
        ) {
            
            self.uri = uri
            self.subject = subject
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
                
                self.subject = try container.decode(AppBskyActorDefs.ProfileView.self, forKey: .subject)
                
            } catch {
                print("Decoding error for property 'subject': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
            try container.encode(uri, forKey: .uri)
            
            
            try container.encode(subject, forKey: .subject)
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(uri)
            hasher.combine(subject)
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.uri != other.uri {
                return false
            }
            
            
            if self.subject != other.subject {
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
            case subject
        }
    }
        
public struct ListViewerState: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "app.bsky.graph.defs#listViewerState"
            public let muted: Bool?
            public let blocked: ATProtocolURI?

        // Standard initializer
        public init(
            muted: Bool?, blocked: ATProtocolURI?
        ) {
            
            self.muted = muted
            self.blocked = blocked
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            do {
                
                self.muted = try container.decodeIfPresent(Bool.self, forKey: .muted)
                
            } catch {
                print("Decoding error for property 'muted': \(error)")
                throw error
            }
            do {
                
                self.blocked = try container.decodeIfPresent(ATProtocolURI.self, forKey: .blocked)
                
            } catch {
                print("Decoding error for property 'blocked': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
            if let value = muted {
                try container.encode(value, forKey: .muted)
            }
            
            
            if let value = blocked {
                try container.encode(value, forKey: .blocked)
            }
            
        }

        public func hash(into hasher: inout Hasher) {
            if let value = muted {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = blocked {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if muted != other.muted {
                return false
            }
            
            
            if blocked != other.blocked {
                return false
            }
            
            return true
        }

        public static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.isEqual(to: rhs)
        }

        private enum CodingKeys: String, CodingKey {
            case typeIdentifier = "$type"
            case muted
            case blocked
        }
    }
        
public struct NotFoundActor: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "app.bsky.graph.defs#notFoundActor"
            public let actor: String
            public let notFound: Bool

        // Standard initializer
        public init(
            actor: String, notFound: Bool
        ) {
            
            self.actor = actor
            self.notFound = notFound
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            do {
                
                self.actor = try container.decode(String.self, forKey: .actor)
                
            } catch {
                print("Decoding error for property 'actor': \(error)")
                throw error
            }
            do {
                
                self.notFound = try container.decode(Bool.self, forKey: .notFound)
                
            } catch {
                print("Decoding error for property 'notFound': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
            try container.encode(actor, forKey: .actor)
            
            
            try container.encode(notFound, forKey: .notFound)
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(actor)
            hasher.combine(notFound)
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.actor != other.actor {
                return false
            }
            
            
            if self.notFound != other.notFound {
                return false
            }
            
            return true
        }

        public static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.isEqual(to: rhs)
        }

        private enum CodingKeys: String, CodingKey {
            case typeIdentifier = "$type"
            case actor
            case notFound
        }
    }
        
public struct Relationship: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "app.bsky.graph.defs#relationship"
            public let did: String
            public let following: ATProtocolURI?
            public let followedBy: ATProtocolURI?

        // Standard initializer
        public init(
            did: String, following: ATProtocolURI?, followedBy: ATProtocolURI?
        ) {
            
            self.did = did
            self.following = following
            self.followedBy = followedBy
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
            do {
                
                self.following = try container.decodeIfPresent(ATProtocolURI.self, forKey: .following)
                
            } catch {
                print("Decoding error for property 'following': \(error)")
                throw error
            }
            do {
                
                self.followedBy = try container.decodeIfPresent(ATProtocolURI.self, forKey: .followedBy)
                
            } catch {
                print("Decoding error for property 'followedBy': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
            try container.encode(did, forKey: .did)
            
            
            if let value = following {
                try container.encode(value, forKey: .following)
            }
            
            
            if let value = followedBy {
                try container.encode(value, forKey: .followedBy)
            }
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(did)
            if let value = following {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = followedBy {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.did != other.did {
                return false
            }
            
            
            if following != other.following {
                return false
            }
            
            
            if followedBy != other.followedBy {
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
            case following
            case followedBy
        }
    }


        
public enum ListPurpose: String, Codable, ATProtocolCodable, ATProtocolValue {
            // 
            case appbskygraphdefsmodlist = "app.bsky.graph.defs#modlist"
            // 
            case appbskygraphdefscuratelist = "app.bsky.graph.defs#curatelist"

            public func isEqual(to other: any ATProtocolValue) -> Bool {
                guard let otherEnum = other as? ListPurpose else { return false }
                return self.rawValue == otherEnum.rawValue
            }
        }


}

                           
