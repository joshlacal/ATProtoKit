import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.embed.record


public struct AppBskyEmbedRecord: ATProtocolCodable, ATProtocolValue { 

    public static let typeIdentifier = "app.bsky.embed.record"
        public let record: ComAtprotoRepoStrongRef

        public init(record: ComAtprotoRepoStrongRef) {
            self.record = record
            
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.record = try container.decode(ComAtprotoRepoStrongRef.self, forKey: .record)
            
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            try container.encode(record, forKey: .record)
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(record)
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            if self.record != other.record {
                return false
            }
            return true
        }
 
        public static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.isEqual(to: rhs)
        }



        private enum CodingKeys: String, CodingKey {
            case record
        }
        
public struct View: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "app.bsky.embed.record#view"
            public let record: ViewRecordUnion

        // Standard initializer
        public init(
            record: ViewRecordUnion
        ) {
            
            self.record = record
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            do {
                
                self.record = try container.decode(ViewRecordUnion.self, forKey: .record)
                
            } catch {
                print("Decoding error for property 'record': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
            try container.encode(record, forKey: .record)
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(record)
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.record != other.record {
                return false
            }
            
            return true
        }

        public static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.isEqual(to: rhs)
        }

        private enum CodingKeys: String, CodingKey {
            case typeIdentifier = "$type"
            case record
        }
    }
        
public struct ViewRecord: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "app.bsky.embed.record#viewRecord"
            public let uri: ATProtocolURI
            public let cid: String
            public let author: AppBskyActorDefs.ProfileViewBasic
            public let value: ATProtocolValueContainer
            public let labels: [ComAtprotoLabelDefs.Label]?
            public let replyCount: Int?
            public let repostCount: Int?
            public let likeCount: Int?
            public let embeds: [ViewRecordEmbedsUnion]?
            public let indexedAt: ATProtocolDate

        // Standard initializer
        public init(
            uri: ATProtocolURI, cid: String, author: AppBskyActorDefs.ProfileViewBasic, value: ATProtocolValueContainer, labels: [ComAtprotoLabelDefs.Label]?, replyCount: Int?, repostCount: Int?, likeCount: Int?, embeds: [ViewRecordEmbedsUnion]?, indexedAt: ATProtocolDate
        ) {
            
            self.uri = uri
            self.cid = cid
            self.author = author
            self.value = value
            self.labels = labels
            self.replyCount = replyCount
            self.repostCount = repostCount
            self.likeCount = likeCount
            self.embeds = embeds
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
                
                self.author = try container.decode(AppBskyActorDefs.ProfileViewBasic.self, forKey: .author)
                
            } catch {
                print("Decoding error for property 'author': \(error)")
                throw error
            }
            do {
                
                self.value = try container.decode(ATProtocolValueContainer.self, forKey: .value)
                
            } catch {
                print("Decoding error for property 'value': \(error)")
                throw error
            }
            do {
                
                self.labels = try container.decodeIfPresent([ComAtprotoLabelDefs.Label].self, forKey: .labels)
                
            } catch {
                print("Decoding error for property 'labels': \(error)")
                throw error
            }
            do {
                
                self.replyCount = try container.decodeIfPresent(Int.self, forKey: .replyCount)
                
            } catch {
                print("Decoding error for property 'replyCount': \(error)")
                throw error
            }
            do {
                
                self.repostCount = try container.decodeIfPresent(Int.self, forKey: .repostCount)
                
            } catch {
                print("Decoding error for property 'repostCount': \(error)")
                throw error
            }
            do {
                
                self.likeCount = try container.decodeIfPresent(Int.self, forKey: .likeCount)
                
            } catch {
                print("Decoding error for property 'likeCount': \(error)")
                throw error
            }
            do {
                
                self.embeds = try container.decodeIfPresent([ViewRecordEmbedsUnion].self, forKey: .embeds)
                
            } catch {
                print("Decoding error for property 'embeds': \(error)")
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
            
            
            try container.encode(author, forKey: .author)
            
            
            try container.encode(value, forKey: .value)
            
            
            if let value = labels {
                try container.encode(value, forKey: .labels)
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
            
            
            if let value = embeds {
                try container.encode(value, forKey: .embeds)
            }
            
            
            try container.encode(indexedAt, forKey: .indexedAt)
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(uri)
            hasher.combine(cid)
            hasher.combine(author)
            hasher.combine(value)
            if let value = labels {
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
            if let value = embeds {
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
            
            
            if self.author != other.author {
                return false
            }
            
            
            if self.value != other.value {
                return false
            }
            
            
            if labels != other.labels {
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
            
            
            if embeds != other.embeds {
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
            case author
            case value
            case labels
            case replyCount
            case repostCount
            case likeCount
            case embeds
            case indexedAt
        }
    }
        
public struct ViewNotFound: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "app.bsky.embed.record#viewNotFound"
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
            do {
                
                self.uri = try container.decode(ATProtocolURI.self, forKey: .uri)
                
            } catch {
                print("Decoding error for property 'uri': \(error)")
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

        public static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.isEqual(to: rhs)
        }

        private enum CodingKeys: String, CodingKey {
            case typeIdentifier = "$type"
            case uri
            case notFound
        }
    }
        
public struct ViewBlocked: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "app.bsky.embed.record#viewBlocked"
            public let uri: ATProtocolURI
            public let blocked: Bool
            public let author: AppBskyFeedDefs.BlockedAuthor

        // Standard initializer
        public init(
            uri: ATProtocolURI, blocked: Bool, author: AppBskyFeedDefs.BlockedAuthor
        ) {
            
            self.uri = uri
            self.blocked = blocked
            self.author = author
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
                
                self.blocked = try container.decode(Bool.self, forKey: .blocked)
                
            } catch {
                print("Decoding error for property 'blocked': \(error)")
                throw error
            }
            do {
                
                self.author = try container.decode(AppBskyFeedDefs.BlockedAuthor.self, forKey: .author)
                
            } catch {
                print("Decoding error for property 'author': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
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

        public static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.isEqual(to: rhs)
        }

        private enum CodingKeys: String, CodingKey {
            case typeIdentifier = "$type"
            case uri
            case blocked
            case author
        }
    }





public enum ViewRecordUnion: Codable, ATProtocolCodable, ATProtocolValue {
    case appBskyEmbedRecordViewRecord(AppBskyEmbedRecord.ViewRecord)
    case appBskyEmbedRecordViewNotFound(AppBskyEmbedRecord.ViewNotFound)
    case appBskyEmbedRecordViewBlocked(AppBskyEmbedRecord.ViewBlocked)
    case appBskyFeedDefsGeneratorView(AppBskyFeedDefs.GeneratorView)
    case appBskyGraphDefsListView(AppBskyGraphDefs.ListView)
    case appBskyLabelerDefsLabelerView(AppBskyLabelerDefs.LabelerView)
    case unexpected(ATProtocolValueContainer)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let typeValue = try container.decode(String.self, forKey: .type)
        print("ViewRecordUnion decoding: \(typeValue)")

        switch typeValue {
        case "app.bsky.embed.record#viewRecord":
            print("Decoding as app.bsky.embed.record#viewRecord")
            let value = try AppBskyEmbedRecord.ViewRecord(from: decoder)
            self = .appBskyEmbedRecordViewRecord(value)
        case "app.bsky.embed.record#viewNotFound":
            print("Decoding as app.bsky.embed.record#viewNotFound")
            let value = try AppBskyEmbedRecord.ViewNotFound(from: decoder)
            self = .appBskyEmbedRecordViewNotFound(value)
        case "app.bsky.embed.record#viewBlocked":
            print("Decoding as app.bsky.embed.record#viewBlocked")
            let value = try AppBskyEmbedRecord.ViewBlocked(from: decoder)
            self = .appBskyEmbedRecordViewBlocked(value)
        case "app.bsky.feed.defs#generatorView":
            print("Decoding as app.bsky.feed.defs#generatorView")
            let value = try AppBskyFeedDefs.GeneratorView(from: decoder)
            self = .appBskyFeedDefsGeneratorView(value)
        case "app.bsky.graph.defs#listView":
            print("Decoding as app.bsky.graph.defs#listView")
            let value = try AppBskyGraphDefs.ListView(from: decoder)
            self = .appBskyGraphDefsListView(value)
        case "app.bsky.labeler.defs#labelerView":
            print("Decoding as app.bsky.labeler.defs#labelerView")
            let value = try AppBskyLabelerDefs.LabelerView(from: decoder)
            self = .appBskyLabelerDefsLabelerView(value)
        default:
            print("ViewRecordUnion decoding encountered an unexpected type: \(typeValue)")
            let unknownValue = try ATProtocolValueContainer(from: decoder)
            self = .unexpected(unknownValue)
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        switch self {
        case .appBskyEmbedRecordViewRecord(let value):
            print("Encoding app.bsky.embed.record#viewRecord")
            try container.encode("app.bsky.embed.record#viewRecord", forKey: .type)
            try value.encode(to: encoder)
        case .appBskyEmbedRecordViewNotFound(let value):
            print("Encoding app.bsky.embed.record#viewNotFound")
            try container.encode("app.bsky.embed.record#viewNotFound", forKey: .type)
            try value.encode(to: encoder)
        case .appBskyEmbedRecordViewBlocked(let value):
            print("Encoding app.bsky.embed.record#viewBlocked")
            try container.encode("app.bsky.embed.record#viewBlocked", forKey: .type)
            try value.encode(to: encoder)
        case .appBskyFeedDefsGeneratorView(let value):
            print("Encoding app.bsky.feed.defs#generatorView")
            try container.encode("app.bsky.feed.defs#generatorView", forKey: .type)
            try value.encode(to: encoder)
        case .appBskyGraphDefsListView(let value):
            print("Encoding app.bsky.graph.defs#listView")
            try container.encode("app.bsky.graph.defs#listView", forKey: .type)
            try value.encode(to: encoder)
        case .appBskyLabelerDefsLabelerView(let value):
            print("Encoding app.bsky.labeler.defs#labelerView")
            try container.encode("app.bsky.labeler.defs#labelerView", forKey: .type)
            try value.encode(to: encoder)
        case .unexpected(let ATProtocolValueContainer):
            print("ViewRecordUnion encoding unexpected value")
            try ATProtocolValueContainer.encode(to: encoder)
        }
    }

    public func hash(into hasher: inout Hasher) {
        switch self {
        case .appBskyEmbedRecordViewRecord(let value):
            hasher.combine("app.bsky.embed.record#viewRecord")
            hasher.combine(value)
        case .appBskyEmbedRecordViewNotFound(let value):
            hasher.combine("app.bsky.embed.record#viewNotFound")
            hasher.combine(value)
        case .appBskyEmbedRecordViewBlocked(let value):
            hasher.combine("app.bsky.embed.record#viewBlocked")
            hasher.combine(value)
        case .appBskyFeedDefsGeneratorView(let value):
            hasher.combine("app.bsky.feed.defs#generatorView")
            hasher.combine(value)
        case .appBskyGraphDefsListView(let value):
            hasher.combine("app.bsky.graph.defs#listView")
            hasher.combine(value)
        case .appBskyLabelerDefsLabelerView(let value):
            hasher.combine("app.bsky.labeler.defs#labelerView")
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
        guard let otherValue = other as? ViewRecordUnion else { return false }

        switch (self, otherValue) {
            case (.appBskyEmbedRecordViewRecord(let selfValue), 
                .appBskyEmbedRecordViewRecord(let otherValue)):
                return selfValue == otherValue
            case (.appBskyEmbedRecordViewNotFound(let selfValue), 
                .appBskyEmbedRecordViewNotFound(let otherValue)):
                return selfValue == otherValue
            case (.appBskyEmbedRecordViewBlocked(let selfValue), 
                .appBskyEmbedRecordViewBlocked(let otherValue)):
                return selfValue == otherValue
            case (.appBskyFeedDefsGeneratorView(let selfValue), 
                .appBskyFeedDefsGeneratorView(let otherValue)):
                return selfValue == otherValue
            case (.appBskyGraphDefsListView(let selfValue), 
                .appBskyGraphDefsListView(let otherValue)):
                return selfValue == otherValue
            case (.appBskyLabelerDefsLabelerView(let selfValue), 
                .appBskyLabelerDefsLabelerView(let otherValue)):
                return selfValue == otherValue
            case (.unexpected(let selfValue), .unexpected(let otherValue)):
                return selfValue.isEqual(to: otherValue)
            default:
                return false
        }
    }
}




public enum ViewRecordEmbedsUnion: Codable, ATProtocolCodable, ATProtocolValue {
    case appBskyEmbedImagesView(AppBskyEmbedImages.View)
    case appBskyEmbedExternalView(AppBskyEmbedExternal.View)
    case appBskyEmbedRecordView(AppBskyEmbedRecord.View)
    case appBskyEmbedRecordWithMediaView(AppBskyEmbedRecordWithMedia.View)
    case unexpected(ATProtocolValueContainer)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let typeValue = try container.decode(String.self, forKey: .type)
        print("ViewRecordEmbedsUnion decoding: \(typeValue)")

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
            print("ViewRecordEmbedsUnion decoding encountered an unexpected type: \(typeValue)")
            let unknownValue = try ATProtocolValueContainer(from: decoder)
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
        case .unexpected(let ATProtocolValueContainer):
            print("ViewRecordEmbedsUnion encoding unexpected value")
            try ATProtocolValueContainer.encode(to: encoder)
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
        case .unexpected(let ATProtocolValueContainer):
            hasher.combine("unexpected")
            hasher.combine(ATProtocolValueContainer)
        }
    }

    private enum CodingKeys: String, CodingKey {
        case type = "$type"
    }
    
    public func isEqual(to other: any ATProtocolValue) -> Bool {
        guard let otherValue = other as? ViewRecordEmbedsUnion else { return false }

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


}

                           
