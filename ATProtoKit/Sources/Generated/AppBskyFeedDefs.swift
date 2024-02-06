import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.feed.defs


public struct AppBskyFeedDefs { 
    public static let typeIdentifier = "app.bsky.feed.defs"
        
public struct PostView: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "app.bsky.feed.defs#postView"
            public let uri: ATProtocolURI
            public let cid: String
            public let author: AppBskyActorDefs.ProfileViewBasic
            public let record: JSONValue
            public let embed: PostViewEmbedUnion?
            public let replyCount: Int?
            public let repostCount: Int?
            public let likeCount: Int?
            public let indexedAt: ATProtocolDate
            public let viewer: ViewerState?
            public let labels: [ComAtprotoLabelDefs.Label]?
            public let threadgate: ThreadgateView?

        // Standard initializer
        public init(
            uri: ATProtocolURI, cid: String, author: AppBskyActorDefs.ProfileViewBasic, record: JSONValue, embed: PostViewEmbedUnion?, replyCount: Int?, repostCount: Int?, likeCount: Int?, indexedAt: ATProtocolDate, viewer: ViewerState?, labels: [ComAtprotoLabelDefs.Label]?, threadgate: ThreadgateView?
        ) {
            
            self.uri = uri
            self.cid = cid
            self.author = author
            self.record = record
            self.embed = embed
            self.replyCount = replyCount
            self.repostCount = repostCount
            self.likeCount = likeCount
            self.indexedAt = indexedAt
            self.viewer = viewer
            self.labels = labels
            self.threadgate = threadgate
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.uri = try container.decode(ATProtocolURI.self, forKey: .uri)
            
            
            self.cid = try container.decode(String.self, forKey: .cid)
            
            
            self.author = try container.decode(AppBskyActorDefs.ProfileViewBasic.self, forKey: .author)
            
            
            self.record = try container.decode(JSONValue.self, forKey: .record)
            
            
            self.embed = try container.decodeIfPresent(PostViewEmbedUnion.self, forKey: .embed)
            
            
            self.replyCount = try container.decodeIfPresent(Int.self, forKey: .replyCount)
            
            
            self.repostCount = try container.decodeIfPresent(Int.self, forKey: .repostCount)
            
            
            self.likeCount = try container.decodeIfPresent(Int.self, forKey: .likeCount)
            
            
            self.indexedAt = try container.decode(ATProtocolDate.self, forKey: .indexedAt)
            
            
            self.viewer = try container.decodeIfPresent(ViewerState.self, forKey: .viewer)
            
            
            self.labels = try container.decodeIfPresent([ComAtprotoLabelDefs.Label].self, forKey: .labels)
            
            
            self.threadgate = try container.decodeIfPresent(ThreadgateView.self, forKey: .threadgate)
            
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            try container.encode(uri, forKey: .uri)
            
            
            try container.encode(cid, forKey: .cid)
            
            
            try container.encode(author, forKey: .author)
            
            
            try container.encode(record, forKey: .record)
            
            
            if let value = embed {
                try container.encode(value, forKey: .embed)
            }
            
            
            if let value = replyCount {
                try container.encode(value, forKey: .replyCount)
            }
            
            
            if let value = repostCount {
                try container.encode(value, forKey: .repostCount)
            }
            
            
            if let value = likeCount {
                try container.encode(value, forKey: .likeCount)
            }
            
            
            try container.encode(indexedAt, forKey: .indexedAt)
            
            
            if let value = viewer {
                try container.encode(value, forKey: .viewer)
            }
            
            
            if let value = labels {
                try container.encode(value, forKey: .labels)
            }
            
            
            if let value = threadgate {
                try container.encode(value, forKey: .threadgate)
            }
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(uri)
            hasher.combine(cid)
            hasher.combine(author)
            hasher.combine(record)
            if let value = embed {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = replyCount {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = repostCount {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = likeCount {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            hasher.combine(indexedAt)
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
            if let value = threadgate {
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
            
            
            if self.author != other.author {
                return false
            }
            
            
            if self.record != other.record {
                return false
            }
            
            
            if embed != other.embed {
                return false
            }
            
            
            if replyCount != other.replyCount {
                return false
            }
            
            
            if repostCount != other.repostCount {
                return false
            }
            
            
            if likeCount != other.likeCount {
                return false
            }
            
            
            if self.indexedAt != other.indexedAt {
                return false
            }
            
            
            if viewer != other.viewer {
                return false
            }
            
            
            if labels != other.labels {
                return false
            }
            
            
            if threadgate != other.threadgate {
                return false
            }
            
            return true
        }

        private enum CodingKeys: String, CodingKey {
            case uri
            case cid
            case author
            case record
            case embed
            case replyCount
            case repostCount
            case likeCount
            case indexedAt
            case viewer
            case labels
            case threadgate
        }
    }
        
public struct ViewerState: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "app.bsky.feed.defs#viewerState"
            public let repost: ATProtocolURI?
            public let like: ATProtocolURI?
            public let replyDisabled: Bool?

        // Standard initializer
        public init(
            repost: ATProtocolURI?, like: ATProtocolURI?, replyDisabled: Bool?
        ) {
            
            self.repost = repost
            self.like = like
            self.replyDisabled = replyDisabled
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.repost = try container.decodeIfPresent(ATProtocolURI.self, forKey: .repost)
            
            
            self.like = try container.decodeIfPresent(ATProtocolURI.self, forKey: .like)
            
            
            self.replyDisabled = try container.decodeIfPresent(Bool.self, forKey: .replyDisabled)
            
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            if let value = repost {
                try container.encode(value, forKey: .repost)
            }
            
            
            if let value = like {
                try container.encode(value, forKey: .like)
            }
            
            
            if let value = replyDisabled {
                try container.encode(value, forKey: .replyDisabled)
            }
            
        }

        public func hash(into hasher: inout Hasher) {
            if let value = repost {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = like {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = replyDisabled {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if repost != other.repost {
                return false
            }
            
            
            if like != other.like {
                return false
            }
            
            
            if replyDisabled != other.replyDisabled {
                return false
            }
            
            return true
        }

        private enum CodingKeys: String, CodingKey {
            case repost
            case like
            case replyDisabled
        }
    }
        
public struct FeedViewPost: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "app.bsky.feed.defs#feedViewPost"
            public let post: PostView
            public let reply: ReplyRef?
            public let reason: FeedViewPostReasonUnion?

        // Standard initializer
        public init(
            post: PostView, reply: ReplyRef?, reason: FeedViewPostReasonUnion?
        ) {
            
            self.post = post
            self.reply = reply
            self.reason = reason
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.post = try container.decode(PostView.self, forKey: .post)
            
            
            self.reply = try container.decodeIfPresent(ReplyRef.self, forKey: .reply)
            
            
            self.reason = try container.decodeIfPresent(FeedViewPostReasonUnion.self, forKey: .reason)
            
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            try container.encode(post, forKey: .post)
            
            
            if let value = reply {
                try container.encode(value, forKey: .reply)
            }
            
            
            if let value = reason {
                try container.encode(value, forKey: .reason)
            }
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(post)
            if let value = reply {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = reason {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.post != other.post {
                return false
            }
            
            
            if reply != other.reply {
                return false
            }
            
            
            if reason != other.reason {
                return false
            }
            
            return true
        }

        private enum CodingKeys: String, CodingKey {
            case post
            case reply
            case reason
        }
    }
        
public struct ReplyRef: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "app.bsky.feed.defs#replyRef"
            public let root: ReplyRefRootUnion
            public let parent: ReplyRefParentUnion

        // Standard initializer
        public init(
            root: ReplyRefRootUnion, parent: ReplyRefParentUnion
        ) {
            
            self.root = root
            self.parent = parent
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.root = try container.decode(ReplyRefRootUnion.self, forKey: .root)
            
            
            self.parent = try container.decode(ReplyRefParentUnion.self, forKey: .parent)
            
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
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

        private enum CodingKeys: String, CodingKey {
            case root
            case parent
        }
    }
        
public struct ReasonRepost: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "app.bsky.feed.defs#reasonRepost"
            public let by: AppBskyActorDefs.ProfileViewBasic
            public let indexedAt: ATProtocolDate

        // Standard initializer
        public init(
            by: AppBskyActorDefs.ProfileViewBasic, indexedAt: ATProtocolDate
        ) {
            
            self.by = by
            self.indexedAt = indexedAt
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.by = try container.decode(AppBskyActorDefs.ProfileViewBasic.self, forKey: .by)
            
            
            self.indexedAt = try container.decode(ATProtocolDate.self, forKey: .indexedAt)
            
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            try container.encode(by, forKey: .by)
            
            
            try container.encode(indexedAt, forKey: .indexedAt)
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(by)
            hasher.combine(indexedAt)
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.by != other.by {
                return false
            }
            
            
            if self.indexedAt != other.indexedAt {
                return false
            }
            
            return true
        }

        private enum CodingKeys: String, CodingKey {
            case by
            case indexedAt
        }
    }
        
public struct ThreadViewPost: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "app.bsky.feed.defs#threadViewPost"
            public let post: PostView
            public let parent: ThreadViewPostParentUnion?
            public let replies: [ThreadViewPostRepliesUnion]?

        // Standard initializer
        public init(
            post: PostView, parent: ThreadViewPostParentUnion?, replies: [ThreadViewPostRepliesUnion]?
        ) {
            
            self.post = post
            self.parent = parent
            self.replies = replies
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.post = try container.decode(PostView.self, forKey: .post)
            
            
            self.parent = try container.decodeIfPresent(ThreadViewPostParentUnion.self, forKey: .parent)
            
            
            self.replies = try container.decodeIfPresent([ThreadViewPostRepliesUnion].self, forKey: .replies)
            
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            try container.encode(post, forKey: .post)
            
            
            if let value = parent {
                try container.encode(value, forKey: .parent)
            }
            
            
            if let value = replies {
                try container.encode(value, forKey: .replies)
            }
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(post)
            if let value = parent {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = replies {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.post != other.post {
                return false
            }
            
            
            if parent != other.parent {
                return false
            }
            
            
            if replies != other.replies {
                return false
            }
            
            return true
        }

        private enum CodingKeys: String, CodingKey {
            case post
            case parent
            case replies
        }
    }
        
public struct NotFoundPost: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "app.bsky.feed.defs#notFoundPost"
            public let uri: ATProtocolURI
            public let notFound: Bool

        // Standard initializer
        public init(
            uri: ATProtocolURI, notFound: Bool
        ) {
            
            self.uri = uri
            self.notFound = notFound
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.uri = try container.decode(ATProtocolURI.self, forKey: .uri)
            
            
            self.notFound = try container.decode(Bool.self, forKey: .notFound)
            
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            try container.encode(uri, forKey: .uri)
            
            
            try container.encode(notFound, forKey: .notFound)
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(uri)
            hasher.combine(notFound)
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.uri != other.uri {
                return false
            }
            
            
            if self.notFound != other.notFound {
                return false
            }
            
            return true
        }

        private enum CodingKeys: String, CodingKey {
            case uri
            case notFound
        }
    }
        
public struct BlockedPost: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "app.bsky.feed.defs#blockedPost"
            public let uri: ATProtocolURI
            public let blocked: Bool
            public let author: BlockedAuthor

        // Standard initializer
        public init(
            uri: ATProtocolURI, blocked: Bool, author: BlockedAuthor
        ) {
            
            self.uri = uri
            self.blocked = blocked
            self.author = author
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.uri = try container.decode(ATProtocolURI.self, forKey: .uri)
            
            
            self.blocked = try container.decode(Bool.self, forKey: .blocked)
            
            
            self.author = try container.decode(BlockedAuthor.self, forKey: .author)
            
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            try container.encode(uri, forKey: .uri)
            
            
            try container.encode(blocked, forKey: .blocked)
            
            
            try container.encode(author, forKey: .author)
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(uri)
            hasher.combine(blocked)
            hasher.combine(author)
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.uri != other.uri {
                return false
            }
            
            
            if self.blocked != other.blocked {
                return false
            }
            
            
            if self.author != other.author {
                return false
            }
            
            return true
        }

        private enum CodingKeys: String, CodingKey {
            case uri
            case blocked
            case author
        }
    }
        
public struct BlockedAuthor: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "app.bsky.feed.defs#blockedAuthor"
            public let did: String
            public let viewer: AppBskyActorDefs.ViewerState?

        // Standard initializer
        public init(
            did: String, viewer: AppBskyActorDefs.ViewerState?
        ) {
            
            self.did = did
            self.viewer = viewer
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.did = try container.decode(String.self, forKey: .did)
            
            
            self.viewer = try container.decodeIfPresent(AppBskyActorDefs.ViewerState.self, forKey: .viewer)
            
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            try container.encode(did, forKey: .did)
            
            
            if let value = viewer {
                try container.encode(value, forKey: .viewer)
            }
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(did)
            if let value = viewer {
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
            
            
            if viewer != other.viewer {
                return false
            }
            
            return true
        }

        private enum CodingKeys: String, CodingKey {
            case did
            case viewer
        }
    }
        
public struct GeneratorView: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "app.bsky.feed.defs#generatorView"
            public let uri: ATProtocolURI
            public let cid: String
            public let did: String
            public let creator: AppBskyActorDefs.ProfileView
            public let displayName: String
            public let description: String?
            public let descriptionFacets: [AppBskyRichtextFacet]?
            public let avatar: String?
            public let likeCount: Int?
            public let viewer: GeneratorViewerState?
            public let indexedAt: ATProtocolDate

        // Standard initializer
        public init(
            uri: ATProtocolURI, cid: String, did: String, creator: AppBskyActorDefs.ProfileView, displayName: String, description: String?, descriptionFacets: [AppBskyRichtextFacet]?, avatar: String?, likeCount: Int?, viewer: GeneratorViewerState?, indexedAt: ATProtocolDate
        ) {
            
            self.uri = uri
            self.cid = cid
            self.did = did
            self.creator = creator
            self.displayName = displayName
            self.description = description
            self.descriptionFacets = descriptionFacets
            self.avatar = avatar
            self.likeCount = likeCount
            self.viewer = viewer
            self.indexedAt = indexedAt
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.uri = try container.decode(ATProtocolURI.self, forKey: .uri)
            
            
            self.cid = try container.decode(String.self, forKey: .cid)
            
            
            self.did = try container.decode(String.self, forKey: .did)
            
            
            self.creator = try container.decode(AppBskyActorDefs.ProfileView.self, forKey: .creator)
            
            
            self.displayName = try container.decode(String.self, forKey: .displayName)
            
            
            self.description = try container.decodeIfPresent(String.self, forKey: .description)
            
            
            self.descriptionFacets = try container.decodeIfPresent([AppBskyRichtextFacet].self, forKey: .descriptionFacets)
            
            
            self.avatar = try container.decodeIfPresent(String.self, forKey: .avatar)
            
            
            self.likeCount = try container.decodeIfPresent(Int.self, forKey: .likeCount)
            
            
            self.viewer = try container.decodeIfPresent(GeneratorViewerState.self, forKey: .viewer)
            
            
            self.indexedAt = try container.decode(ATProtocolDate.self, forKey: .indexedAt)
            
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            try container.encode(uri, forKey: .uri)
            
            
            try container.encode(cid, forKey: .cid)
            
            
            try container.encode(did, forKey: .did)
            
            
            try container.encode(creator, forKey: .creator)
            
            
            try container.encode(displayName, forKey: .displayName)
            
            
            if let value = description {
                try container.encode(value, forKey: .description)
            }
            
            
            if let value = descriptionFacets {
                try container.encode(value, forKey: .descriptionFacets)
            }
            
            
            if let value = avatar {
                try container.encode(value, forKey: .avatar)
            }
            
            
            if let value = likeCount {
                try container.encode(value, forKey: .likeCount)
            }
            
            
            if let value = viewer {
                try container.encode(value, forKey: .viewer)
            }
            
            
            try container.encode(indexedAt, forKey: .indexedAt)
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(uri)
            hasher.combine(cid)
            hasher.combine(did)
            hasher.combine(creator)
            hasher.combine(displayName)
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
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.uri != other.uri {
                return false
            }
            
            
            if self.cid != other.cid {
                return false
            }
            
            
            if self.did != other.did {
                return false
            }
            
            
            if self.creator != other.creator {
                return false
            }
            
            
            if self.displayName != other.displayName {
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
            
            
            if likeCount != other.likeCount {
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

        private enum CodingKeys: String, CodingKey {
            case uri
            case cid
            case did
            case creator
            case displayName
            case description
            case descriptionFacets
            case avatar
            case likeCount
            case viewer
            case indexedAt
        }
    }
        
public struct GeneratorViewerState: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "app.bsky.feed.defs#generatorViewerState"
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
            
            self.like = try container.decodeIfPresent(ATProtocolURI.self, forKey: .like)
            
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
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

        private enum CodingKeys: String, CodingKey {
            case like
        }
    }
        
public struct SkeletonFeedPost: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "app.bsky.feed.defs#skeletonFeedPost"
            public let post: ATProtocolURI
            public let reason: SkeletonFeedPostReasonUnion?

        // Standard initializer
        public init(
            post: ATProtocolURI, reason: SkeletonFeedPostReasonUnion?
        ) {
            
            self.post = post
            self.reason = reason
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.post = try container.decode(ATProtocolURI.self, forKey: .post)
            
            
            self.reason = try container.decodeIfPresent(SkeletonFeedPostReasonUnion.self, forKey: .reason)
            
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            try container.encode(post, forKey: .post)
            
            
            if let value = reason {
                try container.encode(value, forKey: .reason)
            }
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(post)
            if let value = reason {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.post != other.post {
                return false
            }
            
            
            if reason != other.reason {
                return false
            }
            
            return true
        }

        private enum CodingKeys: String, CodingKey {
            case post
            case reason
        }
    }
        
public struct SkeletonReasonRepost: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "app.bsky.feed.defs#skeletonReasonRepost"
            public let repost: ATProtocolURI

        // Standard initializer
        public init(
            repost: ATProtocolURI
        ) {
            
            self.repost = repost
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.repost = try container.decode(ATProtocolURI.self, forKey: .repost)
            
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            try container.encode(repost, forKey: .repost)
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(repost)
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.repost != other.repost {
                return false
            }
            
            return true
        }

        private enum CodingKeys: String, CodingKey {
            case repost
        }
    }
        
public struct ThreadgateView: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "app.bsky.feed.defs#threadgateView"
            public let uri: ATProtocolURI?
            public let cid: String?
            public let record: JSONValue?
            public let lists: [AppBskyGraphDefs.ListViewBasic]?

        // Standard initializer
        public init(
            uri: ATProtocolURI?, cid: String?, record: JSONValue?, lists: [AppBskyGraphDefs.ListViewBasic]?
        ) {
            
            self.uri = uri
            self.cid = cid
            self.record = record
            self.lists = lists
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.uri = try container.decodeIfPresent(ATProtocolURI.self, forKey: .uri)
            
            
            self.cid = try container.decodeIfPresent(String.self, forKey: .cid)
            
            
            self.record = try container.decodeIfPresent(JSONValue.self, forKey: .record)
            
            
            self.lists = try container.decodeIfPresent([AppBskyGraphDefs.ListViewBasic].self, forKey: .lists)
            
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            if let value = uri {
                try container.encode(value, forKey: .uri)
            }
            
            
            if let value = cid {
                try container.encode(value, forKey: .cid)
            }
            
            
            if let value = record {
                try container.encode(value, forKey: .record)
            }
            
            
            if let value = lists {
                try container.encode(value, forKey: .lists)
            }
            
        }

        public func hash(into hasher: inout Hasher) {
            if let value = uri {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = cid {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = record {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = lists {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if uri != other.uri {
                return false
            }
            
            
            if cid != other.cid {
                return false
            }
            
            
            if record != other.record {
                return false
            }
            
            
            if lists != other.lists {
                return false
            }
            
            return true
        }

        private enum CodingKeys: String, CodingKey {
            case uri
            case cid
            case record
            case lists
        }
    }


            // Union Type
            
public enum PostViewEmbedUnion: Codable, ATProtocolCodable, ATProtocolValue {
                case appBskyEmbedImagesView(AppBskyEmbedImages.View)
                case appBskyEmbedExternalView(AppBskyEmbedExternal.View)
                case appBskyEmbedRecordView(AppBskyEmbedRecord.View)
                case appBskyEmbedRecordWithMediaView(AppBskyEmbedRecordWithMedia.View)
                case unexpected(JSONValue)

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    let typeValue = try container.decode(String.self, forKey: .type)
                    print("PostViewEmbedUnion decoding: \(typeValue)")

                    switch typeValue {
                    case "app.bsky.embed.images#view":
                        print("Decoding as app.bsky.embed.images#view")
                        let value = try AppBskyEmbedImages.View(from: decoder)
                        self = .appBskyEmbedImagesView(value)
                    case "app.bsky.embed.external#view":
                        print("Decoding as app.bsky.embed.external#view")
                        let value = try AppBskyEmbedExternal.View(from: decoder)
                        self = .appBskyEmbedExternalView(value)
                    case "app.bsky.embed.record#view":
                        print("Decoding as app.bsky.embed.record#view")
                        let value = try AppBskyEmbedRecord.View(from: decoder)
                        self = .appBskyEmbedRecordView(value)
                    case "app.bsky.embed.recordWithMedia#view":
                        print("Decoding as app.bsky.embed.recordWithMedia#view")
                        let value = try AppBskyEmbedRecordWithMedia.View(from: decoder)
                        self = .appBskyEmbedRecordWithMediaView(value)
                    default:
                        print("PostViewEmbedUnion decoding encountered an unexpected type: \(typeValue)")
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
                    case .appBskyEmbedRecordView(let value):
                        print("Encoding app.bsky.embed.record#view")
                        try container.encode("app.bsky.embed.record#view", forKey: .type)
                        try value.encode(to: encoder)
                    case .appBskyEmbedRecordWithMediaView(let value):
                        print("Encoding app.bsky.embed.recordWithMedia#view")
                        try container.encode("app.bsky.embed.recordWithMedia#view", forKey: .type)
                        try value.encode(to: encoder)
                    case .unexpected(let jsonValue):
                        print("PostViewEmbedUnion encoding unexpected value")
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
                    case .appBskyEmbedRecordView(let value):
                        hasher.combine("app.bsky.embed.record#view")
                        hasher.combine(value)
                    case .appBskyEmbedRecordWithMediaView(let value):
                        hasher.combine("app.bsky.embed.recordWithMedia#view")
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
                    guard let otherValue = other as? PostViewEmbedUnion else { return false }

                    switch (self, otherValue) {
                        case (.appBskyEmbedImagesView(let selfValue), 
                            .appBskyEmbedImagesView(let otherValue)):
                            return selfValue == otherValue
                        case (.appBskyEmbedExternalView(let selfValue), 
                            .appBskyEmbedExternalView(let otherValue)):
                            return selfValue == otherValue
                        case (.appBskyEmbedRecordView(let selfValue), 
                            .appBskyEmbedRecordView(let otherValue)):
                            return selfValue == otherValue
                        case (.appBskyEmbedRecordWithMediaView(let selfValue), 
                            .appBskyEmbedRecordWithMediaView(let otherValue)):
                            return selfValue == otherValue
                        case (.unexpected(let selfValue), .unexpected(let otherValue)):
                            return selfValue.isEqual(to: otherValue)
                        default:
                            return false
                    }
                }
            }

            // Union Type
            
public enum FeedViewPostReasonUnion: Codable, ATProtocolCodable, ATProtocolValue {
                case appBskyFeedDefsReasonRepost(AppBskyFeedDefs.ReasonRepost)
                case unexpected(JSONValue)

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    let typeValue = try container.decode(String.self, forKey: .type)
                    print("FeedViewPostReasonUnion decoding: \(typeValue)")

                    switch typeValue {
                    case "app.bsky.feed.defs#reasonRepost":
                        print("Decoding as app.bsky.feed.defs#reasonRepost")
                        let value = try AppBskyFeedDefs.ReasonRepost(from: decoder)
                        self = .appBskyFeedDefsReasonRepost(value)
                    default:
                        print("FeedViewPostReasonUnion decoding encountered an unexpected type: \(typeValue)")
                        let unknownValue = try JSONValue(from: decoder)
                        self = .unexpected(unknownValue)
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)

                    switch self {
                    case .appBskyFeedDefsReasonRepost(let value):
                        print("Encoding app.bsky.feed.defs#reasonRepost")
                        try container.encode("app.bsky.feed.defs#reasonRepost", forKey: .type)
                        try value.encode(to: encoder)
                    case .unexpected(let jsonValue):
                        print("FeedViewPostReasonUnion encoding unexpected value")
                        try jsonValue.encode(to: encoder)
                    }
                }

                public func hash(into hasher: inout Hasher) {
                    switch self {
                    case .appBskyFeedDefsReasonRepost(let value):
                        hasher.combine("app.bsky.feed.defs#reasonRepost")
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
                    guard let otherValue = other as? FeedViewPostReasonUnion else { return false }

                    switch (self, otherValue) {
                        case (.appBskyFeedDefsReasonRepost(let selfValue), 
                            .appBskyFeedDefsReasonRepost(let otherValue)):
                            return selfValue == otherValue
                        case (.unexpected(let selfValue), .unexpected(let otherValue)):
                            return selfValue.isEqual(to: otherValue)
                        default:
                            return false
                    }
                }
            }

            // Union Type
            
public enum ReplyRefRootUnion: Codable, ATProtocolCodable, ATProtocolValue {
                case appBskyFeedDefsPostView(AppBskyFeedDefs.PostView)
                case appBskyFeedDefsNotFoundPost(AppBskyFeedDefs.NotFoundPost)
                case appBskyFeedDefsBlockedPost(AppBskyFeedDefs.BlockedPost)
                case unexpected(JSONValue)

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    let typeValue = try container.decode(String.self, forKey: .type)
                    print("ReplyRefRootUnion decoding: \(typeValue)")

                    switch typeValue {
                    case "app.bsky.feed.defs#postView":
                        print("Decoding as app.bsky.feed.defs#postView")
                        let value = try AppBskyFeedDefs.PostView(from: decoder)
                        self = .appBskyFeedDefsPostView(value)
                    case "app.bsky.feed.defs#notFoundPost":
                        print("Decoding as app.bsky.feed.defs#notFoundPost")
                        let value = try AppBskyFeedDefs.NotFoundPost(from: decoder)
                        self = .appBskyFeedDefsNotFoundPost(value)
                    case "app.bsky.feed.defs#blockedPost":
                        print("Decoding as app.bsky.feed.defs#blockedPost")
                        let value = try AppBskyFeedDefs.BlockedPost(from: decoder)
                        self = .appBskyFeedDefsBlockedPost(value)
                    default:
                        print("ReplyRefRootUnion decoding encountered an unexpected type: \(typeValue)")
                        let unknownValue = try JSONValue(from: decoder)
                        self = .unexpected(unknownValue)
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)

                    switch self {
                    case .appBskyFeedDefsPostView(let value):
                        print("Encoding app.bsky.feed.defs#postView")
                        try container.encode("app.bsky.feed.defs#postView", forKey: .type)
                        try value.encode(to: encoder)
                    case .appBskyFeedDefsNotFoundPost(let value):
                        print("Encoding app.bsky.feed.defs#notFoundPost")
                        try container.encode("app.bsky.feed.defs#notFoundPost", forKey: .type)
                        try value.encode(to: encoder)
                    case .appBskyFeedDefsBlockedPost(let value):
                        print("Encoding app.bsky.feed.defs#blockedPost")
                        try container.encode("app.bsky.feed.defs#blockedPost", forKey: .type)
                        try value.encode(to: encoder)
                    case .unexpected(let jsonValue):
                        print("ReplyRefRootUnion encoding unexpected value")
                        try jsonValue.encode(to: encoder)
                    }
                }

                public func hash(into hasher: inout Hasher) {
                    switch self {
                    case .appBskyFeedDefsPostView(let value):
                        hasher.combine("app.bsky.feed.defs#postView")
                        hasher.combine(value)
                    case .appBskyFeedDefsNotFoundPost(let value):
                        hasher.combine("app.bsky.feed.defs#notFoundPost")
                        hasher.combine(value)
                    case .appBskyFeedDefsBlockedPost(let value):
                        hasher.combine("app.bsky.feed.defs#blockedPost")
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
                    guard let otherValue = other as? ReplyRefRootUnion else { return false }

                    switch (self, otherValue) {
                        case (.appBskyFeedDefsPostView(let selfValue), 
                            .appBskyFeedDefsPostView(let otherValue)):
                            return selfValue == otherValue
                        case (.appBskyFeedDefsNotFoundPost(let selfValue), 
                            .appBskyFeedDefsNotFoundPost(let otherValue)):
                            return selfValue == otherValue
                        case (.appBskyFeedDefsBlockedPost(let selfValue), 
                            .appBskyFeedDefsBlockedPost(let otherValue)):
                            return selfValue == otherValue
                        case (.unexpected(let selfValue), .unexpected(let otherValue)):
                            return selfValue.isEqual(to: otherValue)
                        default:
                            return false
                    }
                }
            }

            // Union Type
            
public enum ReplyRefParentUnion: Codable, ATProtocolCodable, ATProtocolValue {
                case appBskyFeedDefsPostView(AppBskyFeedDefs.PostView)
                case appBskyFeedDefsNotFoundPost(AppBskyFeedDefs.NotFoundPost)
                case appBskyFeedDefsBlockedPost(AppBskyFeedDefs.BlockedPost)
                case unexpected(JSONValue)

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    let typeValue = try container.decode(String.self, forKey: .type)
                    print("ReplyRefParentUnion decoding: \(typeValue)")

                    switch typeValue {
                    case "app.bsky.feed.defs#postView":
                        print("Decoding as app.bsky.feed.defs#postView")
                        let value = try AppBskyFeedDefs.PostView(from: decoder)
                        self = .appBskyFeedDefsPostView(value)
                    case "app.bsky.feed.defs#notFoundPost":
                        print("Decoding as app.bsky.feed.defs#notFoundPost")
                        let value = try AppBskyFeedDefs.NotFoundPost(from: decoder)
                        self = .appBskyFeedDefsNotFoundPost(value)
                    case "app.bsky.feed.defs#blockedPost":
                        print("Decoding as app.bsky.feed.defs#blockedPost")
                        let value = try AppBskyFeedDefs.BlockedPost(from: decoder)
                        self = .appBskyFeedDefsBlockedPost(value)
                    default:
                        print("ReplyRefParentUnion decoding encountered an unexpected type: \(typeValue)")
                        let unknownValue = try JSONValue(from: decoder)
                        self = .unexpected(unknownValue)
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)

                    switch self {
                    case .appBskyFeedDefsPostView(let value):
                        print("Encoding app.bsky.feed.defs#postView")
                        try container.encode("app.bsky.feed.defs#postView", forKey: .type)
                        try value.encode(to: encoder)
                    case .appBskyFeedDefsNotFoundPost(let value):
                        print("Encoding app.bsky.feed.defs#notFoundPost")
                        try container.encode("app.bsky.feed.defs#notFoundPost", forKey: .type)
                        try value.encode(to: encoder)
                    case .appBskyFeedDefsBlockedPost(let value):
                        print("Encoding app.bsky.feed.defs#blockedPost")
                        try container.encode("app.bsky.feed.defs#blockedPost", forKey: .type)
                        try value.encode(to: encoder)
                    case .unexpected(let jsonValue):
                        print("ReplyRefParentUnion encoding unexpected value")
                        try jsonValue.encode(to: encoder)
                    }
                }

                public func hash(into hasher: inout Hasher) {
                    switch self {
                    case .appBskyFeedDefsPostView(let value):
                        hasher.combine("app.bsky.feed.defs#postView")
                        hasher.combine(value)
                    case .appBskyFeedDefsNotFoundPost(let value):
                        hasher.combine("app.bsky.feed.defs#notFoundPost")
                        hasher.combine(value)
                    case .appBskyFeedDefsBlockedPost(let value):
                        hasher.combine("app.bsky.feed.defs#blockedPost")
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
                    guard let otherValue = other as? ReplyRefParentUnion else { return false }

                    switch (self, otherValue) {
                        case (.appBskyFeedDefsPostView(let selfValue), 
                            .appBskyFeedDefsPostView(let otherValue)):
                            return selfValue == otherValue
                        case (.appBskyFeedDefsNotFoundPost(let selfValue), 
                            .appBskyFeedDefsNotFoundPost(let otherValue)):
                            return selfValue == otherValue
                        case (.appBskyFeedDefsBlockedPost(let selfValue), 
                            .appBskyFeedDefsBlockedPost(let otherValue)):
                            return selfValue == otherValue
                        case (.unexpected(let selfValue), .unexpected(let otherValue)):
                            return selfValue.isEqual(to: otherValue)
                        default:
                            return false
                    }
                }
            }

            // Union Type
            
public indirect enum ThreadViewPostParentUnion: Codable, ATProtocolCodable, ATProtocolValue {
                case appBskyFeedDefsThreadViewPost(AppBskyFeedDefs.ThreadViewPost)
                case appBskyFeedDefsNotFoundPost(AppBskyFeedDefs.NotFoundPost)
                case appBskyFeedDefsBlockedPost(AppBskyFeedDefs.BlockedPost)
                case unexpected(JSONValue)

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    let typeValue = try container.decode(String.self, forKey: .type)
                    print("ThreadViewPostParentUnion decoding: \(typeValue)")

                    switch typeValue {
                    case "app.bsky.feed.defs#threadViewPost":
                        print("Decoding as app.bsky.feed.defs#threadViewPost")
                        let value = try AppBskyFeedDefs.ThreadViewPost(from: decoder)
                        self = .appBskyFeedDefsThreadViewPost(value)
                    case "app.bsky.feed.defs#notFoundPost":
                        print("Decoding as app.bsky.feed.defs#notFoundPost")
                        let value = try AppBskyFeedDefs.NotFoundPost(from: decoder)
                        self = .appBskyFeedDefsNotFoundPost(value)
                    case "app.bsky.feed.defs#blockedPost":
                        print("Decoding as app.bsky.feed.defs#blockedPost")
                        let value = try AppBskyFeedDefs.BlockedPost(from: decoder)
                        self = .appBskyFeedDefsBlockedPost(value)
                    default:
                        print("ThreadViewPostParentUnion decoding encountered an unexpected type: \(typeValue)")
                        let unknownValue = try JSONValue(from: decoder)
                        self = .unexpected(unknownValue)
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)

                    switch self {
                    case .appBskyFeedDefsThreadViewPost(let value):
                        print("Encoding app.bsky.feed.defs#threadViewPost")
                        try container.encode("app.bsky.feed.defs#threadViewPost", forKey: .type)
                        try value.encode(to: encoder)
                    case .appBskyFeedDefsNotFoundPost(let value):
                        print("Encoding app.bsky.feed.defs#notFoundPost")
                        try container.encode("app.bsky.feed.defs#notFoundPost", forKey: .type)
                        try value.encode(to: encoder)
                    case .appBskyFeedDefsBlockedPost(let value):
                        print("Encoding app.bsky.feed.defs#blockedPost")
                        try container.encode("app.bsky.feed.defs#blockedPost", forKey: .type)
                        try value.encode(to: encoder)
                    case .unexpected(let jsonValue):
                        print("ThreadViewPostParentUnion encoding unexpected value")
                        try jsonValue.encode(to: encoder)
                    }
                }

                public func hash(into hasher: inout Hasher) {
                    switch self {
                    case .appBskyFeedDefsThreadViewPost(let value):
                        hasher.combine("app.bsky.feed.defs#threadViewPost")
                        hasher.combine(value)
                    case .appBskyFeedDefsNotFoundPost(let value):
                        hasher.combine("app.bsky.feed.defs#notFoundPost")
                        hasher.combine(value)
                    case .appBskyFeedDefsBlockedPost(let value):
                        hasher.combine("app.bsky.feed.defs#blockedPost")
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
                    guard let otherValue = other as? ThreadViewPostParentUnion else { return false }

                    switch (self, otherValue) {
                        case (.appBskyFeedDefsThreadViewPost(let selfValue), 
                            .appBskyFeedDefsThreadViewPost(let otherValue)):
                            return selfValue == otherValue
                        case (.appBskyFeedDefsNotFoundPost(let selfValue), 
                            .appBskyFeedDefsNotFoundPost(let otherValue)):
                            return selfValue == otherValue
                        case (.appBskyFeedDefsBlockedPost(let selfValue), 
                            .appBskyFeedDefsBlockedPost(let otherValue)):
                            return selfValue == otherValue
                        case (.unexpected(let selfValue), .unexpected(let otherValue)):
                            return selfValue.isEqual(to: otherValue)
                        default:
                            return false
                    }
                }
            }

            // Union Type
            
public enum ThreadViewPostRepliesUnion: Codable, ATProtocolCodable, ATProtocolValue {
                case appBskyFeedDefsThreadViewPost(AppBskyFeedDefs.ThreadViewPost)
                case appBskyFeedDefsNotFoundPost(AppBskyFeedDefs.NotFoundPost)
                case appBskyFeedDefsBlockedPost(AppBskyFeedDefs.BlockedPost)
                case unexpected(JSONValue)

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    let typeValue = try container.decode(String.self, forKey: .type)
                    print("ThreadViewPostRepliesUnion decoding: \(typeValue)")

                    switch typeValue {
                    case "app.bsky.feed.defs#threadViewPost":
                        print("Decoding as app.bsky.feed.defs#threadViewPost")
                        let value = try AppBskyFeedDefs.ThreadViewPost(from: decoder)
                        self = .appBskyFeedDefsThreadViewPost(value)
                    case "app.bsky.feed.defs#notFoundPost":
                        print("Decoding as app.bsky.feed.defs#notFoundPost")
                        let value = try AppBskyFeedDefs.NotFoundPost(from: decoder)
                        self = .appBskyFeedDefsNotFoundPost(value)
                    case "app.bsky.feed.defs#blockedPost":
                        print("Decoding as app.bsky.feed.defs#blockedPost")
                        let value = try AppBskyFeedDefs.BlockedPost(from: decoder)
                        self = .appBskyFeedDefsBlockedPost(value)
                    default:
                        print("ThreadViewPostRepliesUnion decoding encountered an unexpected type: \(typeValue)")
                        let unknownValue = try JSONValue(from: decoder)
                        self = .unexpected(unknownValue)
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)

                    switch self {
                    case .appBskyFeedDefsThreadViewPost(let value):
                        print("Encoding app.bsky.feed.defs#threadViewPost")
                        try container.encode("app.bsky.feed.defs#threadViewPost", forKey: .type)
                        try value.encode(to: encoder)
                    case .appBskyFeedDefsNotFoundPost(let value):
                        print("Encoding app.bsky.feed.defs#notFoundPost")
                        try container.encode("app.bsky.feed.defs#notFoundPost", forKey: .type)
                        try value.encode(to: encoder)
                    case .appBskyFeedDefsBlockedPost(let value):
                        print("Encoding app.bsky.feed.defs#blockedPost")
                        try container.encode("app.bsky.feed.defs#blockedPost", forKey: .type)
                        try value.encode(to: encoder)
                    case .unexpected(let jsonValue):
                        print("ThreadViewPostRepliesUnion encoding unexpected value")
                        try jsonValue.encode(to: encoder)
                    }
                }

                public func hash(into hasher: inout Hasher) {
                    switch self {
                    case .appBskyFeedDefsThreadViewPost(let value):
                        hasher.combine("app.bsky.feed.defs#threadViewPost")
                        hasher.combine(value)
                    case .appBskyFeedDefsNotFoundPost(let value):
                        hasher.combine("app.bsky.feed.defs#notFoundPost")
                        hasher.combine(value)
                    case .appBskyFeedDefsBlockedPost(let value):
                        hasher.combine("app.bsky.feed.defs#blockedPost")
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
                    guard let otherValue = other as? ThreadViewPostRepliesUnion else { return false }

                    switch (self, otherValue) {
                        case (.appBskyFeedDefsThreadViewPost(let selfValue), 
                            .appBskyFeedDefsThreadViewPost(let otherValue)):
                            return selfValue == otherValue
                        case (.appBskyFeedDefsNotFoundPost(let selfValue), 
                            .appBskyFeedDefsNotFoundPost(let otherValue)):
                            return selfValue == otherValue
                        case (.appBskyFeedDefsBlockedPost(let selfValue), 
                            .appBskyFeedDefsBlockedPost(let otherValue)):
                            return selfValue == otherValue
                        case (.unexpected(let selfValue), .unexpected(let otherValue)):
                            return selfValue.isEqual(to: otherValue)
                        default:
                            return false
                    }
                }
            }

            // Union Type
            
public enum SkeletonFeedPostReasonUnion: Codable, ATProtocolCodable, ATProtocolValue {
                case appBskyFeedDefsSkeletonReasonRepost(AppBskyFeedDefs.SkeletonReasonRepost)
                case unexpected(JSONValue)

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    let typeValue = try container.decode(String.self, forKey: .type)
                    print("SkeletonFeedPostReasonUnion decoding: \(typeValue)")

                    switch typeValue {
                    case "app.bsky.feed.defs#skeletonReasonRepost":
                        print("Decoding as app.bsky.feed.defs#skeletonReasonRepost")
                        let value = try AppBskyFeedDefs.SkeletonReasonRepost(from: decoder)
                        self = .appBskyFeedDefsSkeletonReasonRepost(value)
                    default:
                        print("SkeletonFeedPostReasonUnion decoding encountered an unexpected type: \(typeValue)")
                        let unknownValue = try JSONValue(from: decoder)
                        self = .unexpected(unknownValue)
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)

                    switch self {
                    case .appBskyFeedDefsSkeletonReasonRepost(let value):
                        print("Encoding app.bsky.feed.defs#skeletonReasonRepost")
                        try container.encode("app.bsky.feed.defs#skeletonReasonRepost", forKey: .type)
                        try value.encode(to: encoder)
                    case .unexpected(let jsonValue):
                        print("SkeletonFeedPostReasonUnion encoding unexpected value")
                        try jsonValue.encode(to: encoder)
                    }
                }

                public func hash(into hasher: inout Hasher) {
                    switch self {
                    case .appBskyFeedDefsSkeletonReasonRepost(let value):
                        hasher.combine("app.bsky.feed.defs#skeletonReasonRepost")
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
                    guard let otherValue = other as? SkeletonFeedPostReasonUnion else { return false }

                    switch (self, otherValue) {
                        case (.appBskyFeedDefsSkeletonReasonRepost(let selfValue), 
                            .appBskyFeedDefsSkeletonReasonRepost(let otherValue)):
                            return selfValue == otherValue
                        case (.unexpected(let selfValue), .unexpected(let otherValue)):
                            return selfValue.isEqual(to: otherValue)
                        default:
                            return false
                    }
                }
            }


}

                           
