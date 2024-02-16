import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.actor.defs


public struct AppBskyActorDefs { 
    public static let typeIdentifier = "app.bsky.actor.defs"
        
public struct ProfileViewBasic: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "app.bsky.actor.defs#profileViewBasic"
            public let did: String
            public let handle: String
            public let displayName: String?
            public let avatar: String?
            public let viewer: ViewerState?
            public let labels: [ComAtprotoLabelDefs.Label]?

        // Standard initializer
        public init(
            did: String, handle: String, displayName: String?, avatar: String?, viewer: ViewerState?, labels: [ComAtprotoLabelDefs.Label]?
        ) {
            
            self.did = did
            self.handle = handle
            self.displayName = displayName
            self.avatar = avatar
            self.viewer = viewer
            self.labels = labels
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
                
                self.handle = try container.decode(String.self, forKey: .handle)
                
            } catch {
                print("Decoding error for property 'handle': \(error)")
                throw error
            }
            do {
                
                self.displayName = try container.decodeIfPresent(String.self, forKey: .displayName)
                
            } catch {
                print("Decoding error for property 'displayName': \(error)")
                throw error
            }
            do {
                
                self.avatar = try container.decodeIfPresent(String.self, forKey: .avatar)
                
            } catch {
                print("Decoding error for property 'avatar': \(error)")
                throw error
            }
            do {
                
                self.viewer = try container.decodeIfPresent(ViewerState.self, forKey: .viewer)
                
            } catch {
                print("Decoding error for property 'viewer': \(error)")
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
            
            try container.encode(did, forKey: .did)
            
            
            try container.encode(handle, forKey: .handle)
            
            
            if let value = displayName {
                try container.encode(value, forKey: .displayName)
            }
            
            
            if let value = avatar {
                try container.encode(value, forKey: .avatar)
            }
            
            
            if let value = viewer {
                try container.encode(value, forKey: .viewer)
            }
            
            
            if let value = labels {
                try container.encode(value, forKey: .labels)
            }
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(did)
            hasher.combine(handle)
            if let value = displayName {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = avatar {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = viewer {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = labels {
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
            
            
            if self.handle != other.handle {
                return false
            }
            
            
            if displayName != other.displayName {
                return false
            }
            
            
            if avatar != other.avatar {
                return false
            }
            
            
            if viewer != other.viewer {
                return false
            }
            
            
            if labels != other.labels {
                return false
            }
            
            return true
        }

        private enum CodingKeys: String, CodingKey {
            case did
            case handle
            case displayName
            case avatar
            case viewer
            case labels
        }
    }
        
public struct ProfileView: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "app.bsky.actor.defs#profileView"
            public let did: String
            public let handle: String
            public let displayName: String?
            public let description: String?
            public let avatar: String?
            public let indexedAt: ATProtocolDate?
            public let viewer: ViewerState?
            public let labels: [ComAtprotoLabelDefs.Label]?

        // Standard initializer
        public init(
            did: String, handle: String, displayName: String?, description: String?, avatar: String?, indexedAt: ATProtocolDate?, viewer: ViewerState?, labels: [ComAtprotoLabelDefs.Label]?
        ) {
            
            self.did = did
            self.handle = handle
            self.displayName = displayName
            self.description = description
            self.avatar = avatar
            self.indexedAt = indexedAt
            self.viewer = viewer
            self.labels = labels
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
                
                self.handle = try container.decode(String.self, forKey: .handle)
                
            } catch {
                print("Decoding error for property 'handle': \(error)")
                throw error
            }
            do {
                
                self.displayName = try container.decodeIfPresent(String.self, forKey: .displayName)
                
            } catch {
                print("Decoding error for property 'displayName': \(error)")
                throw error
            }
            do {
                
                self.description = try container.decodeIfPresent(String.self, forKey: .description)
                
            } catch {
                print("Decoding error for property 'description': \(error)")
                throw error
            }
            do {
                
                self.avatar = try container.decodeIfPresent(String.self, forKey: .avatar)
                
            } catch {
                print("Decoding error for property 'avatar': \(error)")
                throw error
            }
            do {
                
                self.indexedAt = try container.decodeIfPresent(ATProtocolDate.self, forKey: .indexedAt)
                
            } catch {
                print("Decoding error for property 'indexedAt': \(error)")
                throw error
            }
            do {
                
                self.viewer = try container.decodeIfPresent(ViewerState.self, forKey: .viewer)
                
            } catch {
                print("Decoding error for property 'viewer': \(error)")
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
            
            try container.encode(did, forKey: .did)
            
            
            try container.encode(handle, forKey: .handle)
            
            
            if let value = displayName {
                try container.encode(value, forKey: .displayName)
            }
            
            
            if let value = description {
                try container.encode(value, forKey: .description)
            }
            
            
            if let value = avatar {
                try container.encode(value, forKey: .avatar)
            }
            
            
            if let value = indexedAt {
                try container.encode(value, forKey: .indexedAt)
            }
            
            
            if let value = viewer {
                try container.encode(value, forKey: .viewer)
            }
            
            
            if let value = labels {
                try container.encode(value, forKey: .labels)
            }
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(did)
            hasher.combine(handle)
            if let value = displayName {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = description {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = avatar {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = indexedAt {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = viewer {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = labels {
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
            
            
            if self.handle != other.handle {
                return false
            }
            
            
            if displayName != other.displayName {
                return false
            }
            
            
            if description != other.description {
                return false
            }
            
            
            if avatar != other.avatar {
                return false
            }
            
            
            if indexedAt != other.indexedAt {
                return false
            }
            
            
            if viewer != other.viewer {
                return false
            }
            
            
            if labels != other.labels {
                return false
            }
            
            return true
        }

        private enum CodingKeys: String, CodingKey {
            case did
            case handle
            case displayName
            case description
            case avatar
            case indexedAt
            case viewer
            case labels
        }
    }
        
public struct ProfileViewDetailed: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "app.bsky.actor.defs#profileViewDetailed"
            public let did: String
            public let handle: String
            public let displayName: String?
            public let description: String?
            public let avatar: String?
            public let banner: String?
            public let followersCount: Int?
            public let followsCount: Int?
            public let postsCount: Int?
            public let indexedAt: ATProtocolDate?
            public let viewer: ViewerState?
            public let labels: [ComAtprotoLabelDefs.Label]?

        // Standard initializer
        public init(
            did: String, handle: String, displayName: String?, description: String?, avatar: String?, banner: String?, followersCount: Int?, followsCount: Int?, postsCount: Int?, indexedAt: ATProtocolDate?, viewer: ViewerState?, labels: [ComAtprotoLabelDefs.Label]?
        ) {
            
            self.did = did
            self.handle = handle
            self.displayName = displayName
            self.description = description
            self.avatar = avatar
            self.banner = banner
            self.followersCount = followersCount
            self.followsCount = followsCount
            self.postsCount = postsCount
            self.indexedAt = indexedAt
            self.viewer = viewer
            self.labels = labels
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
                
                self.handle = try container.decode(String.self, forKey: .handle)
                
            } catch {
                print("Decoding error for property 'handle': \(error)")
                throw error
            }
            do {
                
                self.displayName = try container.decodeIfPresent(String.self, forKey: .displayName)
                
            } catch {
                print("Decoding error for property 'displayName': \(error)")
                throw error
            }
            do {
                
                self.description = try container.decodeIfPresent(String.self, forKey: .description)
                
            } catch {
                print("Decoding error for property 'description': \(error)")
                throw error
            }
            do {
                
                self.avatar = try container.decodeIfPresent(String.self, forKey: .avatar)
                
            } catch {
                print("Decoding error for property 'avatar': \(error)")
                throw error
            }
            do {
                
                self.banner = try container.decodeIfPresent(String.self, forKey: .banner)
                
            } catch {
                print("Decoding error for property 'banner': \(error)")
                throw error
            }
            do {
                
                self.followersCount = try container.decodeIfPresent(Int.self, forKey: .followersCount)
                
            } catch {
                print("Decoding error for property 'followersCount': \(error)")
                throw error
            }
            do {
                
                self.followsCount = try container.decodeIfPresent(Int.self, forKey: .followsCount)
                
            } catch {
                print("Decoding error for property 'followsCount': \(error)")
                throw error
            }
            do {
                
                self.postsCount = try container.decodeIfPresent(Int.self, forKey: .postsCount)
                
            } catch {
                print("Decoding error for property 'postsCount': \(error)")
                throw error
            }
            do {
                
                self.indexedAt = try container.decodeIfPresent(ATProtocolDate.self, forKey: .indexedAt)
                
            } catch {
                print("Decoding error for property 'indexedAt': \(error)")
                throw error
            }
            do {
                
                self.viewer = try container.decodeIfPresent(ViewerState.self, forKey: .viewer)
                
            } catch {
                print("Decoding error for property 'viewer': \(error)")
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
            
            try container.encode(did, forKey: .did)
            
            
            try container.encode(handle, forKey: .handle)
            
            
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
            
            
            if let value = followersCount {
                try container.encode(value, forKey: .followersCount)
            }
            
            
            if let value = followsCount {
                try container.encode(value, forKey: .followsCount)
            }
            
            
            if let value = postsCount {
                try container.encode(value, forKey: .postsCount)
            }
            
            
            if let value = indexedAt {
                try container.encode(value, forKey: .indexedAt)
            }
            
            
            if let value = viewer {
                try container.encode(value, forKey: .viewer)
            }
            
            
            if let value = labels {
                try container.encode(value, forKey: .labels)
            }
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(did)
            hasher.combine(handle)
            if let value = displayName {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = description {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = avatar {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = banner {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = followersCount {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = followsCount {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = postsCount {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = indexedAt {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = viewer {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = labels {
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
            
            
            if self.handle != other.handle {
                return false
            }
            
            
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
            
            
            if followersCount != other.followersCount {
                return false
            }
            
            
            if followsCount != other.followsCount {
                return false
            }
            
            
            if postsCount != other.postsCount {
                return false
            }
            
            
            if indexedAt != other.indexedAt {
                return false
            }
            
            
            if viewer != other.viewer {
                return false
            }
            
            
            if labels != other.labels {
                return false
            }
            
            return true
        }

        private enum CodingKeys: String, CodingKey {
            case did
            case handle
            case displayName
            case description
            case avatar
            case banner
            case followersCount
            case followsCount
            case postsCount
            case indexedAt
            case viewer
            case labels
        }
    }
        
public struct ViewerState: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "app.bsky.actor.defs#viewerState"
            public let muted: Bool?
            public let mutedByList: AppBskyGraphDefs.ListViewBasic?
            public let blockedBy: Bool?
            public let blocking: ATProtocolURI?
            public let blockingByList: AppBskyGraphDefs.ListViewBasic?
            public let following: ATProtocolURI?
            public let followedBy: ATProtocolURI?

        // Standard initializer
        public init(
            muted: Bool?, mutedByList: AppBskyGraphDefs.ListViewBasic?, blockedBy: Bool?, blocking: ATProtocolURI?, blockingByList: AppBskyGraphDefs.ListViewBasic?, following: ATProtocolURI?, followedBy: ATProtocolURI?
        ) {
            
            self.muted = muted
            self.mutedByList = mutedByList
            self.blockedBy = blockedBy
            self.blocking = blocking
            self.blockingByList = blockingByList
            self.following = following
            self.followedBy = followedBy
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
                
                self.mutedByList = try container.decodeIfPresent(AppBskyGraphDefs.ListViewBasic.self, forKey: .mutedByList)
                
            } catch {
                print("Decoding error for property 'mutedByList': \(error)")
                throw error
            }
            do {
                
                self.blockedBy = try container.decodeIfPresent(Bool.self, forKey: .blockedBy)
                
            } catch {
                print("Decoding error for property 'blockedBy': \(error)")
                throw error
            }
            do {
                
                self.blocking = try container.decodeIfPresent(ATProtocolURI.self, forKey: .blocking)
                
            } catch {
                print("Decoding error for property 'blocking': \(error)")
                throw error
            }
            do {
                
                self.blockingByList = try container.decodeIfPresent(AppBskyGraphDefs.ListViewBasic.self, forKey: .blockingByList)
                
            } catch {
                print("Decoding error for property 'blockingByList': \(error)")
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
            
            if let value = muted {
                try container.encode(value, forKey: .muted)
            }
            
            
            if let value = mutedByList {
                try container.encode(value, forKey: .mutedByList)
            }
            
            
            if let value = blockedBy {
                try container.encode(value, forKey: .blockedBy)
            }
            
            
            if let value = blocking {
                try container.encode(value, forKey: .blocking)
            }
            
            
            if let value = blockingByList {
                try container.encode(value, forKey: .blockingByList)
            }
            
            
            if let value = following {
                try container.encode(value, forKey: .following)
            }
            
            
            if let value = followedBy {
                try container.encode(value, forKey: .followedBy)
            }
            
        }

        public func hash(into hasher: inout Hasher) {
            if let value = muted {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = mutedByList {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = blockedBy {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = blocking {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = blockingByList {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
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
            
            if muted != other.muted {
                return false
            }
            
            
            if mutedByList != other.mutedByList {
                return false
            }
            
            
            if blockedBy != other.blockedBy {
                return false
            }
            
            
            if blocking != other.blocking {
                return false
            }
            
            
            if blockingByList != other.blockingByList {
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

        private enum CodingKeys: String, CodingKey {
            case muted
            case mutedByList
            case blockedBy
            case blocking
            case blockingByList
            case following
            case followedBy
        }
    }
        
public struct AdultContentPref: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "app.bsky.actor.defs#adultContentPref"
            public let enabled: Bool

        // Standard initializer
        public init(
            enabled: Bool
        ) {
            
            self.enabled = enabled
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            do {
                
                self.enabled = try container.decode(Bool.self, forKey: .enabled)
                
            } catch {
                print("Decoding error for property 'enabled': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            try container.encode(enabled, forKey: .enabled)
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(enabled)
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.enabled != other.enabled {
                return false
            }
            
            return true
        }

        private enum CodingKeys: String, CodingKey {
            case enabled
        }
    }
        
public struct ContentLabelPref: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "app.bsky.actor.defs#contentLabelPref"
            public let label: String
            public let visibility: String

        // Standard initializer
        public init(
            label: String, visibility: String
        ) {
            
            self.label = label
            self.visibility = visibility
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            do {
                
                self.label = try container.decode(String.self, forKey: .label)
                
            } catch {
                print("Decoding error for property 'label': \(error)")
                throw error
            }
            do {
                
                self.visibility = try container.decode(String.self, forKey: .visibility)
                
            } catch {
                print("Decoding error for property 'visibility': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            try container.encode(label, forKey: .label)
            
            
            try container.encode(visibility, forKey: .visibility)
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(label)
            hasher.combine(visibility)
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.label != other.label {
                return false
            }
            
            
            if self.visibility != other.visibility {
                return false
            }
            
            return true
        }

        private enum CodingKeys: String, CodingKey {
            case label
            case visibility
        }
    }
        
public struct SavedFeedsPref: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "app.bsky.actor.defs#savedFeedsPref"
            public let pinned: [ATProtocolURI]
            public let saved: [ATProtocolURI]

        // Standard initializer
        public init(
            pinned: [ATProtocolURI], saved: [ATProtocolURI]
        ) {
            
            self.pinned = pinned
            self.saved = saved
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            do {
                
                self.pinned = try container.decode([ATProtocolURI].self, forKey: .pinned)
                
            } catch {
                print("Decoding error for property 'pinned': \(error)")
                throw error
            }
            do {
                
                self.saved = try container.decode([ATProtocolURI].self, forKey: .saved)
                
            } catch {
                print("Decoding error for property 'saved': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            try container.encode(pinned, forKey: .pinned)
            
            
            try container.encode(saved, forKey: .saved)
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(pinned)
            hasher.combine(saved)
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.pinned != other.pinned {
                return false
            }
            
            
            if self.saved != other.saved {
                return false
            }
            
            return true
        }

        private enum CodingKeys: String, CodingKey {
            case pinned
            case saved
        }
    }
        
public struct PersonalDetailsPref: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "app.bsky.actor.defs#personalDetailsPref"
            public let birthDate: ATProtocolDate?

        // Standard initializer
        public init(
            birthDate: ATProtocolDate?
        ) {
            
            self.birthDate = birthDate
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            do {
                
                self.birthDate = try container.decodeIfPresent(ATProtocolDate.self, forKey: .birthDate)
                
            } catch {
                print("Decoding error for property 'birthDate': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            if let value = birthDate {
                try container.encode(value, forKey: .birthDate)
            }
            
        }

        public func hash(into hasher: inout Hasher) {
            if let value = birthDate {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if birthDate != other.birthDate {
                return false
            }
            
            return true
        }

        private enum CodingKeys: String, CodingKey {
            case birthDate
        }
    }
        
public struct FeedViewPref: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "app.bsky.actor.defs#feedViewPref"
            public let feed: String
            public let hideReplies: Bool?
            public let hideRepliesByUnfollowed: Bool?
            public let hideRepliesByLikeCount: Int?
            public let hideReposts: Bool?
            public let hideQuotePosts: Bool?

        // Standard initializer
        public init(
            feed: String, hideReplies: Bool?, hideRepliesByUnfollowed: Bool?, hideRepliesByLikeCount: Int?, hideReposts: Bool?, hideQuotePosts: Bool?
        ) {
            
            self.feed = feed
            self.hideReplies = hideReplies
            self.hideRepliesByUnfollowed = hideRepliesByUnfollowed
            self.hideRepliesByLikeCount = hideRepliesByLikeCount
            self.hideReposts = hideReposts
            self.hideQuotePosts = hideQuotePosts
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            do {
                
                self.feed = try container.decode(String.self, forKey: .feed)
                
            } catch {
                print("Decoding error for property 'feed': \(error)")
                throw error
            }
            do {
                
                self.hideReplies = try container.decodeIfPresent(Bool.self, forKey: .hideReplies)
                
            } catch {
                print("Decoding error for property 'hideReplies': \(error)")
                throw error
            }
            do {
                
                self.hideRepliesByUnfollowed = try container.decodeIfPresent(Bool.self, forKey: .hideRepliesByUnfollowed)
                
            } catch {
                print("Decoding error for property 'hideRepliesByUnfollowed': \(error)")
                throw error
            }
            do {
                
                self.hideRepliesByLikeCount = try container.decodeIfPresent(Int.self, forKey: .hideRepliesByLikeCount)
                
            } catch {
                print("Decoding error for property 'hideRepliesByLikeCount': \(error)")
                throw error
            }
            do {
                
                self.hideReposts = try container.decodeIfPresent(Bool.self, forKey: .hideReposts)
                
            } catch {
                print("Decoding error for property 'hideReposts': \(error)")
                throw error
            }
            do {
                
                self.hideQuotePosts = try container.decodeIfPresent(Bool.self, forKey: .hideQuotePosts)
                
            } catch {
                print("Decoding error for property 'hideQuotePosts': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            try container.encode(feed, forKey: .feed)
            
            
            if let value = hideReplies {
                try container.encode(value, forKey: .hideReplies)
            }
            
            
            if let value = hideRepliesByUnfollowed {
                try container.encode(value, forKey: .hideRepliesByUnfollowed)
            }
            
            
            if let value = hideRepliesByLikeCount {
                try container.encode(value, forKey: .hideRepliesByLikeCount)
            }
            
            
            if let value = hideReposts {
                try container.encode(value, forKey: .hideReposts)
            }
            
            
            if let value = hideQuotePosts {
                try container.encode(value, forKey: .hideQuotePosts)
            }
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(feed)
            if let value = hideReplies {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = hideRepliesByUnfollowed {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = hideRepliesByLikeCount {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = hideReposts {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = hideQuotePosts {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.feed != other.feed {
                return false
            }
            
            
            if hideReplies != other.hideReplies {
                return false
            }
            
            
            if hideRepliesByUnfollowed != other.hideRepliesByUnfollowed {
                return false
            }
            
            
            if hideRepliesByLikeCount != other.hideRepliesByLikeCount {
                return false
            }
            
            
            if hideReposts != other.hideReposts {
                return false
            }
            
            
            if hideQuotePosts != other.hideQuotePosts {
                return false
            }
            
            return true
        }

        private enum CodingKeys: String, CodingKey {
            case feed
            case hideReplies
            case hideRepliesByUnfollowed
            case hideRepliesByLikeCount
            case hideReposts
            case hideQuotePosts
        }
    }
        
public struct ThreadViewPref: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "app.bsky.actor.defs#threadViewPref"
            public let sort: String?
            public let prioritizeFollowedUsers: Bool?

        // Standard initializer
        public init(
            sort: String?, prioritizeFollowedUsers: Bool?
        ) {
            
            self.sort = sort
            self.prioritizeFollowedUsers = prioritizeFollowedUsers
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            do {
                
                self.sort = try container.decodeIfPresent(String.self, forKey: .sort)
                
            } catch {
                print("Decoding error for property 'sort': \(error)")
                throw error
            }
            do {
                
                self.prioritizeFollowedUsers = try container.decodeIfPresent(Bool.self, forKey: .prioritizeFollowedUsers)
                
            } catch {
                print("Decoding error for property 'prioritizeFollowedUsers': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            if let value = sort {
                try container.encode(value, forKey: .sort)
            }
            
            
            if let value = prioritizeFollowedUsers {
                try container.encode(value, forKey: .prioritizeFollowedUsers)
            }
            
        }

        public func hash(into hasher: inout Hasher) {
            if let value = sort {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = prioritizeFollowedUsers {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if sort != other.sort {
                return false
            }
            
            
            if prioritizeFollowedUsers != other.prioritizeFollowedUsers {
                return false
            }
            
            return true
        }

        private enum CodingKeys: String, CodingKey {
            case sort
            case prioritizeFollowedUsers
        }
    }


// Union Array Type

public enum Preferences: Codable, ATProtocolCodable, ATProtocolValue {
    case adultContentPref(AdultContentPref)
    case contentLabelPref(ContentLabelPref)
    case savedFeedsPref(SavedFeedsPref)
    case personalDetailsPref(PersonalDetailsPref)
    case feedViewPref(FeedViewPref)
    case threadViewPref(ThreadViewPref)
    case unexpected(JSONValue)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let typeValue = try container.decode(String.self, forKey: .type)

        switch typeValue {
        case "app.bsky.actor.defs#adultContentPref":
            let value = try AdultContentPref(from: decoder)
            self = .adultContentPref(value)
        case "app.bsky.actor.defs#contentLabelPref":
            let value = try ContentLabelPref(from: decoder)
            self = .contentLabelPref(value)
        case "app.bsky.actor.defs#savedFeedsPref":
            let value = try SavedFeedsPref(from: decoder)
            self = .savedFeedsPref(value)
        case "app.bsky.actor.defs#personalDetailsPref":
            let value = try PersonalDetailsPref(from: decoder)
            self = .personalDetailsPref(value)
        case "app.bsky.actor.defs#feedViewPref":
            let value = try FeedViewPref(from: decoder)
            self = .feedViewPref(value)
        case "app.bsky.actor.defs#threadViewPref":
            let value = try ThreadViewPref(from: decoder)
            self = .threadViewPref(value)
        default:
            let unknownValue = try JSONValue(from: decoder)
            self = .unexpected(unknownValue)
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        switch self {
        case .adultContentPref(let value):
            try container.encode("app.bsky.actor.defs#adultContentPref", forKey: .type)
            try value.encode(to: encoder)
        case .contentLabelPref(let value):
            try container.encode("app.bsky.actor.defs#contentLabelPref", forKey: .type)
            try value.encode(to: encoder)
        case .savedFeedsPref(let value):
            try container.encode("app.bsky.actor.defs#savedFeedsPref", forKey: .type)
            try value.encode(to: encoder)
        case .personalDetailsPref(let value):
            try container.encode("app.bsky.actor.defs#personalDetailsPref", forKey: .type)
            try value.encode(to: encoder)
        case .feedViewPref(let value):
            try container.encode("app.bsky.actor.defs#feedViewPref", forKey: .type)
            try value.encode(to: encoder)
        case .threadViewPref(let value):
            try container.encode("app.bsky.actor.defs#threadViewPref", forKey: .type)
            try value.encode(to: encoder)
        case .unexpected(let jsonValue):
            try jsonValue.encode(to: encoder)
        }
    }

    public func hash(into hasher: inout Hasher) {
        switch self {
        case .adultContentPref(let value):
            hasher.combine("app.bsky.actor.defs#adultContentPref")
            hasher.combine(value)
        case .contentLabelPref(let value):
            hasher.combine("app.bsky.actor.defs#contentLabelPref")
            hasher.combine(value)
        case .savedFeedsPref(let value):
            hasher.combine("app.bsky.actor.defs#savedFeedsPref")
            hasher.combine(value)
        case .personalDetailsPref(let value):
            hasher.combine("app.bsky.actor.defs#personalDetailsPref")
            hasher.combine(value)
        case .feedViewPref(let value):
            hasher.combine("app.bsky.actor.defs#feedViewPref")
            hasher.combine(value)
        case .threadViewPref(let value):
            hasher.combine("app.bsky.actor.defs#threadViewPref")
            hasher.combine(value)
        case .unexpected(let jsonValue):
            hasher.combine("unexpected")
            hasher.combine(jsonValue)
        }
    }

    public func isEqual(to other: any ATProtocolValue) -> Bool {
        guard let otherValue = other as? Preferences else { return false }

        switch (self, otherValue) {
        case (.adultContentPref(let selfValue), 
              .adultContentPref(let otherValue)):
            return selfValue == otherValue
        case (.contentLabelPref(let selfValue), 
              .contentLabelPref(let otherValue)):
            return selfValue == otherValue
        case (.savedFeedsPref(let selfValue), 
              .savedFeedsPref(let otherValue)):
            return selfValue == otherValue
        case (.personalDetailsPref(let selfValue), 
              .personalDetailsPref(let otherValue)):
            return selfValue == otherValue
        case (.feedViewPref(let selfValue), 
              .feedViewPref(let otherValue)):
            return selfValue == otherValue
        case (.threadViewPref(let selfValue), 
              .threadViewPref(let otherValue)):
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

                           
