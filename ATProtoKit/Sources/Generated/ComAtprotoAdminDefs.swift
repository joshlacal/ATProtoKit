import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.admin.defs


public struct ComAtprotoAdminDefs { 
    public static let typeIdentifier = "com.atproto.admin.defs"
        
public struct StatusAttr: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "com.atproto.admin.defs#statusAttr"
            public let applied: Bool
            public let ref: String?

        // Standard initializer
        public init(
            applied: Bool, ref: String?
        ) {
            
            self.applied = applied
            self.ref = ref
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            do {
                
                self.applied = try container.decode(Bool.self, forKey: .applied)
                
            } catch {
                print("Decoding error for property 'applied': \(error)")
                throw error
            }
            do {
                
                self.ref = try container.decodeIfPresent(String.self, forKey: .ref)
                
            } catch {
                print("Decoding error for property 'ref': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
            try container.encode(applied, forKey: .applied)
            
            
            if let value = ref {
                try container.encode(value, forKey: .ref)
            }
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(applied)
            if let value = ref {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.applied != other.applied {
                return false
            }
            
            
            if ref != other.ref {
                return false
            }
            
            return true
        }

        public static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.isEqual(to: rhs)
        }

        private enum CodingKeys: String, CodingKey {
            case typeIdentifier = "$type"
            case applied
            case ref
        }
    }
        
public struct ModEventView: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "com.atproto.admin.defs#modEventView"
            public let id: Int
            public let event: ModEventViewEventUnion
            public let subject: ModEventViewSubjectUnion
            public let subjectBlobCids: [String]
            public let createdBy: String
            public let createdAt: ATProtocolDate
            public let creatorHandle: String?
            public let subjectHandle: String?

        // Standard initializer
        public init(
            id: Int, event: ModEventViewEventUnion, subject: ModEventViewSubjectUnion, subjectBlobCids: [String], createdBy: String, createdAt: ATProtocolDate, creatorHandle: String?, subjectHandle: String?
        ) {
            
            self.id = id
            self.event = event
            self.subject = subject
            self.subjectBlobCids = subjectBlobCids
            self.createdBy = createdBy
            self.createdAt = createdAt
            self.creatorHandle = creatorHandle
            self.subjectHandle = subjectHandle
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            do {
                
                self.id = try container.decode(Int.self, forKey: .id)
                
            } catch {
                print("Decoding error for property 'id': \(error)")
                throw error
            }
            do {
                
                self.event = try container.decode(ModEventViewEventUnion.self, forKey: .event)
                
            } catch {
                print("Decoding error for property 'event': \(error)")
                throw error
            }
            do {
                
                self.subject = try container.decode(ModEventViewSubjectUnion.self, forKey: .subject)
                
            } catch {
                print("Decoding error for property 'subject': \(error)")
                throw error
            }
            do {
                
                self.subjectBlobCids = try container.decode([String].self, forKey: .subjectBlobCids)
                
            } catch {
                print("Decoding error for property 'subjectBlobCids': \(error)")
                throw error
            }
            do {
                
                self.createdBy = try container.decode(String.self, forKey: .createdBy)
                
            } catch {
                print("Decoding error for property 'createdBy': \(error)")
                throw error
            }
            do {
                
                self.createdAt = try container.decode(ATProtocolDate.self, forKey: .createdAt)
                
            } catch {
                print("Decoding error for property 'createdAt': \(error)")
                throw error
            }
            do {
                
                self.creatorHandle = try container.decodeIfPresent(String.self, forKey: .creatorHandle)
                
            } catch {
                print("Decoding error for property 'creatorHandle': \(error)")
                throw error
            }
            do {
                
                self.subjectHandle = try container.decodeIfPresent(String.self, forKey: .subjectHandle)
                
            } catch {
                print("Decoding error for property 'subjectHandle': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
            try container.encode(id, forKey: .id)
            
            
            try container.encode(event, forKey: .event)
            
            
            try container.encode(subject, forKey: .subject)
            
            
            try container.encode(subjectBlobCids, forKey: .subjectBlobCids)
            
            
            try container.encode(createdBy, forKey: .createdBy)
            
            
            try container.encode(createdAt, forKey: .createdAt)
            
            
            if let value = creatorHandle {
                try container.encode(value, forKey: .creatorHandle)
            }
            
            
            if let value = subjectHandle {
                try container.encode(value, forKey: .subjectHandle)
            }
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(id)
            hasher.combine(event)
            hasher.combine(subject)
            hasher.combine(subjectBlobCids)
            hasher.combine(createdBy)
            hasher.combine(createdAt)
            if let value = creatorHandle {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = subjectHandle {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.id != other.id {
                return false
            }
            
            
            if self.event != other.event {
                return false
            }
            
            
            if self.subject != other.subject {
                return false
            }
            
            
            if self.subjectBlobCids != other.subjectBlobCids {
                return false
            }
            
            
            if self.createdBy != other.createdBy {
                return false
            }
            
            
            if self.createdAt != other.createdAt {
                return false
            }
            
            
            if creatorHandle != other.creatorHandle {
                return false
            }
            
            
            if subjectHandle != other.subjectHandle {
                return false
            }
            
            return true
        }

        public static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.isEqual(to: rhs)
        }

        private enum CodingKeys: String, CodingKey {
            case typeIdentifier = "$type"
            case id
            case event
            case subject
            case subjectBlobCids
            case createdBy
            case createdAt
            case creatorHandle
            case subjectHandle
        }
    }
        
public struct ModEventViewDetail: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "com.atproto.admin.defs#modEventViewDetail"
            public let id: Int
            public let event: ModEventViewDetailEventUnion
            public let subject: ModEventViewDetailSubjectUnion
            public let subjectBlobs: [BlobView]
            public let createdBy: String
            public let createdAt: ATProtocolDate

        // Standard initializer
        public init(
            id: Int, event: ModEventViewDetailEventUnion, subject: ModEventViewDetailSubjectUnion, subjectBlobs: [BlobView], createdBy: String, createdAt: ATProtocolDate
        ) {
            
            self.id = id
            self.event = event
            self.subject = subject
            self.subjectBlobs = subjectBlobs
            self.createdBy = createdBy
            self.createdAt = createdAt
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            do {
                
                self.id = try container.decode(Int.self, forKey: .id)
                
            } catch {
                print("Decoding error for property 'id': \(error)")
                throw error
            }
            do {
                
                self.event = try container.decode(ModEventViewDetailEventUnion.self, forKey: .event)
                
            } catch {
                print("Decoding error for property 'event': \(error)")
                throw error
            }
            do {
                
                self.subject = try container.decode(ModEventViewDetailSubjectUnion.self, forKey: .subject)
                
            } catch {
                print("Decoding error for property 'subject': \(error)")
                throw error
            }
            do {
                
                self.subjectBlobs = try container.decode([BlobView].self, forKey: .subjectBlobs)
                
            } catch {
                print("Decoding error for property 'subjectBlobs': \(error)")
                throw error
            }
            do {
                
                self.createdBy = try container.decode(String.self, forKey: .createdBy)
                
            } catch {
                print("Decoding error for property 'createdBy': \(error)")
                throw error
            }
            do {
                
                self.createdAt = try container.decode(ATProtocolDate.self, forKey: .createdAt)
                
            } catch {
                print("Decoding error for property 'createdAt': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
            try container.encode(id, forKey: .id)
            
            
            try container.encode(event, forKey: .event)
            
            
            try container.encode(subject, forKey: .subject)
            
            
            try container.encode(subjectBlobs, forKey: .subjectBlobs)
            
            
            try container.encode(createdBy, forKey: .createdBy)
            
            
            try container.encode(createdAt, forKey: .createdAt)
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(id)
            hasher.combine(event)
            hasher.combine(subject)
            hasher.combine(subjectBlobs)
            hasher.combine(createdBy)
            hasher.combine(createdAt)
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.id != other.id {
                return false
            }
            
            
            if self.event != other.event {
                return false
            }
            
            
            if self.subject != other.subject {
                return false
            }
            
            
            if self.subjectBlobs != other.subjectBlobs {
                return false
            }
            
            
            if self.createdBy != other.createdBy {
                return false
            }
            
            
            if self.createdAt != other.createdAt {
                return false
            }
            
            return true
        }

        public static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.isEqual(to: rhs)
        }

        private enum CodingKeys: String, CodingKey {
            case typeIdentifier = "$type"
            case id
            case event
            case subject
            case subjectBlobs
            case createdBy
            case createdAt
        }
    }
        
public struct ReportView: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "com.atproto.admin.defs#reportView"
            public let id: Int
            public let reasonType: ComAtprotoModerationDefs.ReasonType
            public let comment: String?
            public let subjectRepoHandle: String?
            public let subject: ReportViewSubjectUnion
            public let reportedBy: String
            public let createdAt: ATProtocolDate
            public let resolvedByActionIds: [Int]

        // Standard initializer
        public init(
            id: Int, reasonType: ComAtprotoModerationDefs.ReasonType, comment: String?, subjectRepoHandle: String?, subject: ReportViewSubjectUnion, reportedBy: String, createdAt: ATProtocolDate, resolvedByActionIds: [Int]
        ) {
            
            self.id = id
            self.reasonType = reasonType
            self.comment = comment
            self.subjectRepoHandle = subjectRepoHandle
            self.subject = subject
            self.reportedBy = reportedBy
            self.createdAt = createdAt
            self.resolvedByActionIds = resolvedByActionIds
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            do {
                
                self.id = try container.decode(Int.self, forKey: .id)
                
            } catch {
                print("Decoding error for property 'id': \(error)")
                throw error
            }
            do {
                
                self.reasonType = try container.decode(ComAtprotoModerationDefs.ReasonType.self, forKey: .reasonType)
                
            } catch {
                print("Decoding error for property 'reasonType': \(error)")
                throw error
            }
            do {
                
                self.comment = try container.decodeIfPresent(String.self, forKey: .comment)
                
            } catch {
                print("Decoding error for property 'comment': \(error)")
                throw error
            }
            do {
                
                self.subjectRepoHandle = try container.decodeIfPresent(String.self, forKey: .subjectRepoHandle)
                
            } catch {
                print("Decoding error for property 'subjectRepoHandle': \(error)")
                throw error
            }
            do {
                
                self.subject = try container.decode(ReportViewSubjectUnion.self, forKey: .subject)
                
            } catch {
                print("Decoding error for property 'subject': \(error)")
                throw error
            }
            do {
                
                self.reportedBy = try container.decode(String.self, forKey: .reportedBy)
                
            } catch {
                print("Decoding error for property 'reportedBy': \(error)")
                throw error
            }
            do {
                
                self.createdAt = try container.decode(ATProtocolDate.self, forKey: .createdAt)
                
            } catch {
                print("Decoding error for property 'createdAt': \(error)")
                throw error
            }
            do {
                
                self.resolvedByActionIds = try container.decode([Int].self, forKey: .resolvedByActionIds)
                
            } catch {
                print("Decoding error for property 'resolvedByActionIds': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
            try container.encode(id, forKey: .id)
            
            
            try container.encode(reasonType, forKey: .reasonType)
            
            
            if let value = comment {
                try container.encode(value, forKey: .comment)
            }
            
            
            if let value = subjectRepoHandle {
                try container.encode(value, forKey: .subjectRepoHandle)
            }
            
            
            try container.encode(subject, forKey: .subject)
            
            
            try container.encode(reportedBy, forKey: .reportedBy)
            
            
            try container.encode(createdAt, forKey: .createdAt)
            
            
            try container.encode(resolvedByActionIds, forKey: .resolvedByActionIds)
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(id)
            hasher.combine(reasonType)
            if let value = comment {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = subjectRepoHandle {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            hasher.combine(subject)
            hasher.combine(reportedBy)
            hasher.combine(createdAt)
            hasher.combine(resolvedByActionIds)
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.id != other.id {
                return false
            }
            
            
            if self.reasonType != other.reasonType {
                return false
            }
            
            
            if comment != other.comment {
                return false
            }
            
            
            if subjectRepoHandle != other.subjectRepoHandle {
                return false
            }
            
            
            if self.subject != other.subject {
                return false
            }
            
            
            if self.reportedBy != other.reportedBy {
                return false
            }
            
            
            if self.createdAt != other.createdAt {
                return false
            }
            
            
            if self.resolvedByActionIds != other.resolvedByActionIds {
                return false
            }
            
            return true
        }

        public static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.isEqual(to: rhs)
        }

        private enum CodingKeys: String, CodingKey {
            case typeIdentifier = "$type"
            case id
            case reasonType
            case comment
            case subjectRepoHandle
            case subject
            case reportedBy
            case createdAt
            case resolvedByActionIds
        }
    }
        
public struct SubjectStatusView: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "com.atproto.admin.defs#subjectStatusView"
            public let id: Int
            public let subject: SubjectStatusViewSubjectUnion
            public let subjectBlobCids: [String]?
            public let subjectRepoHandle: String?
            public let updatedAt: ATProtocolDate
            public let createdAt: ATProtocolDate
            public let reviewState: SubjectReviewState
            public let comment: String?
            public let muteUntil: ATProtocolDate?
            public let lastReviewedBy: String?
            public let lastReviewedAt: ATProtocolDate?
            public let lastReportedAt: ATProtocolDate?
            public let lastAppealedAt: ATProtocolDate?
            public let takendown: Bool?
            public let appealed: Bool?
            public let suspendUntil: ATProtocolDate?

        // Standard initializer
        public init(
            id: Int, subject: SubjectStatusViewSubjectUnion, subjectBlobCids: [String]?, subjectRepoHandle: String?, updatedAt: ATProtocolDate, createdAt: ATProtocolDate, reviewState: SubjectReviewState, comment: String?, muteUntil: ATProtocolDate?, lastReviewedBy: String?, lastReviewedAt: ATProtocolDate?, lastReportedAt: ATProtocolDate?, lastAppealedAt: ATProtocolDate?, takendown: Bool?, appealed: Bool?, suspendUntil: ATProtocolDate?
        ) {
            
            self.id = id
            self.subject = subject
            self.subjectBlobCids = subjectBlobCids
            self.subjectRepoHandle = subjectRepoHandle
            self.updatedAt = updatedAt
            self.createdAt = createdAt
            self.reviewState = reviewState
            self.comment = comment
            self.muteUntil = muteUntil
            self.lastReviewedBy = lastReviewedBy
            self.lastReviewedAt = lastReviewedAt
            self.lastReportedAt = lastReportedAt
            self.lastAppealedAt = lastAppealedAt
            self.takendown = takendown
            self.appealed = appealed
            self.suspendUntil = suspendUntil
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            do {
                
                self.id = try container.decode(Int.self, forKey: .id)
                
            } catch {
                print("Decoding error for property 'id': \(error)")
                throw error
            }
            do {
                
                self.subject = try container.decode(SubjectStatusViewSubjectUnion.self, forKey: .subject)
                
            } catch {
                print("Decoding error for property 'subject': \(error)")
                throw error
            }
            do {
                
                self.subjectBlobCids = try container.decodeIfPresent([String].self, forKey: .subjectBlobCids)
                
            } catch {
                print("Decoding error for property 'subjectBlobCids': \(error)")
                throw error
            }
            do {
                
                self.subjectRepoHandle = try container.decodeIfPresent(String.self, forKey: .subjectRepoHandle)
                
            } catch {
                print("Decoding error for property 'subjectRepoHandle': \(error)")
                throw error
            }
            do {
                
                self.updatedAt = try container.decode(ATProtocolDate.self, forKey: .updatedAt)
                
            } catch {
                print("Decoding error for property 'updatedAt': \(error)")
                throw error
            }
            do {
                
                self.createdAt = try container.decode(ATProtocolDate.self, forKey: .createdAt)
                
            } catch {
                print("Decoding error for property 'createdAt': \(error)")
                throw error
            }
            do {
                
                self.reviewState = try container.decode(SubjectReviewState.self, forKey: .reviewState)
                
            } catch {
                print("Decoding error for property 'reviewState': \(error)")
                throw error
            }
            do {
                
                self.comment = try container.decodeIfPresent(String.self, forKey: .comment)
                
            } catch {
                print("Decoding error for property 'comment': \(error)")
                throw error
            }
            do {
                
                self.muteUntil = try container.decodeIfPresent(ATProtocolDate.self, forKey: .muteUntil)
                
            } catch {
                print("Decoding error for property 'muteUntil': \(error)")
                throw error
            }
            do {
                
                self.lastReviewedBy = try container.decodeIfPresent(String.self, forKey: .lastReviewedBy)
                
            } catch {
                print("Decoding error for property 'lastReviewedBy': \(error)")
                throw error
            }
            do {
                
                self.lastReviewedAt = try container.decodeIfPresent(ATProtocolDate.self, forKey: .lastReviewedAt)
                
            } catch {
                print("Decoding error for property 'lastReviewedAt': \(error)")
                throw error
            }
            do {
                
                self.lastReportedAt = try container.decodeIfPresent(ATProtocolDate.self, forKey: .lastReportedAt)
                
            } catch {
                print("Decoding error for property 'lastReportedAt': \(error)")
                throw error
            }
            do {
                
                self.lastAppealedAt = try container.decodeIfPresent(ATProtocolDate.self, forKey: .lastAppealedAt)
                
            } catch {
                print("Decoding error for property 'lastAppealedAt': \(error)")
                throw error
            }
            do {
                
                self.takendown = try container.decodeIfPresent(Bool.self, forKey: .takendown)
                
            } catch {
                print("Decoding error for property 'takendown': \(error)")
                throw error
            }
            do {
                
                self.appealed = try container.decodeIfPresent(Bool.self, forKey: .appealed)
                
            } catch {
                print("Decoding error for property 'appealed': \(error)")
                throw error
            }
            do {
                
                self.suspendUntil = try container.decodeIfPresent(ATProtocolDate.self, forKey: .suspendUntil)
                
            } catch {
                print("Decoding error for property 'suspendUntil': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
            try container.encode(id, forKey: .id)
            
            
            try container.encode(subject, forKey: .subject)
            
            
            if let value = subjectBlobCids {
                try container.encode(value, forKey: .subjectBlobCids)
            }
            
            
            if let value = subjectRepoHandle {
                try container.encode(value, forKey: .subjectRepoHandle)
            }
            
            
            try container.encode(updatedAt, forKey: .updatedAt)
            
            
            try container.encode(createdAt, forKey: .createdAt)
            
            
            try container.encode(reviewState, forKey: .reviewState)
            
            
            if let value = comment {
                try container.encode(value, forKey: .comment)
            }
            
            
            if let value = muteUntil {
                try container.encode(value, forKey: .muteUntil)
            }
            
            
            if let value = lastReviewedBy {
                try container.encode(value, forKey: .lastReviewedBy)
            }
            
            
            if let value = lastReviewedAt {
                try container.encode(value, forKey: .lastReviewedAt)
            }
            
            
            if let value = lastReportedAt {
                try container.encode(value, forKey: .lastReportedAt)
            }
            
            
            if let value = lastAppealedAt {
                try container.encode(value, forKey: .lastAppealedAt)
            }
            
            
            if let value = takendown {
                try container.encode(value, forKey: .takendown)
            }
            
            
            if let value = appealed {
                try container.encode(value, forKey: .appealed)
            }
            
            
            if let value = suspendUntil {
                try container.encode(value, forKey: .suspendUntil)
            }
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(id)
            hasher.combine(subject)
            if let value = subjectBlobCids {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = subjectRepoHandle {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            hasher.combine(updatedAt)
            hasher.combine(createdAt)
            hasher.combine(reviewState)
            if let value = comment {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = muteUntil {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = lastReviewedBy {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = lastReviewedAt {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = lastReportedAt {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = lastAppealedAt {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = takendown {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = appealed {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = suspendUntil {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.id != other.id {
                return false
            }
            
            
            if self.subject != other.subject {
                return false
            }
            
            
            if subjectBlobCids != other.subjectBlobCids {
                return false
            }
            
            
            if subjectRepoHandle != other.subjectRepoHandle {
                return false
            }
            
            
            if self.updatedAt != other.updatedAt {
                return false
            }
            
            
            if self.createdAt != other.createdAt {
                return false
            }
            
            
            if self.reviewState != other.reviewState {
                return false
            }
            
            
            if comment != other.comment {
                return false
            }
            
            
            if muteUntil != other.muteUntil {
                return false
            }
            
            
            if lastReviewedBy != other.lastReviewedBy {
                return false
            }
            
            
            if lastReviewedAt != other.lastReviewedAt {
                return false
            }
            
            
            if lastReportedAt != other.lastReportedAt {
                return false
            }
            
            
            if lastAppealedAt != other.lastAppealedAt {
                return false
            }
            
            
            if takendown != other.takendown {
                return false
            }
            
            
            if appealed != other.appealed {
                return false
            }
            
            
            if suspendUntil != other.suspendUntil {
                return false
            }
            
            return true
        }

        public static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.isEqual(to: rhs)
        }

        private enum CodingKeys: String, CodingKey {
            case typeIdentifier = "$type"
            case id
            case subject
            case subjectBlobCids
            case subjectRepoHandle
            case updatedAt
            case createdAt
            case reviewState
            case comment
            case muteUntil
            case lastReviewedBy
            case lastReviewedAt
            case lastReportedAt
            case lastAppealedAt
            case takendown
            case appealed
            case suspendUntil
        }
    }
        
public struct ReportViewDetail: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "com.atproto.admin.defs#reportViewDetail"
            public let id: Int
            public let reasonType: ComAtprotoModerationDefs.ReasonType
            public let comment: String?
            public let subject: ReportViewDetailSubjectUnion
            public let subjectStatus: ComAtprotoAdminDefs.SubjectStatusView?
            public let reportedBy: String
            public let createdAt: ATProtocolDate
            public let resolvedByActions: [ComAtprotoAdminDefs.ModEventView]

        // Standard initializer
        public init(
            id: Int, reasonType: ComAtprotoModerationDefs.ReasonType, comment: String?, subject: ReportViewDetailSubjectUnion, subjectStatus: ComAtprotoAdminDefs.SubjectStatusView?, reportedBy: String, createdAt: ATProtocolDate, resolvedByActions: [ComAtprotoAdminDefs.ModEventView]
        ) {
            
            self.id = id
            self.reasonType = reasonType
            self.comment = comment
            self.subject = subject
            self.subjectStatus = subjectStatus
            self.reportedBy = reportedBy
            self.createdAt = createdAt
            self.resolvedByActions = resolvedByActions
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            do {
                
                self.id = try container.decode(Int.self, forKey: .id)
                
            } catch {
                print("Decoding error for property 'id': \(error)")
                throw error
            }
            do {
                
                self.reasonType = try container.decode(ComAtprotoModerationDefs.ReasonType.self, forKey: .reasonType)
                
            } catch {
                print("Decoding error for property 'reasonType': \(error)")
                throw error
            }
            do {
                
                self.comment = try container.decodeIfPresent(String.self, forKey: .comment)
                
            } catch {
                print("Decoding error for property 'comment': \(error)")
                throw error
            }
            do {
                
                self.subject = try container.decode(ReportViewDetailSubjectUnion.self, forKey: .subject)
                
            } catch {
                print("Decoding error for property 'subject': \(error)")
                throw error
            }
            do {
                
                self.subjectStatus = try container.decodeIfPresent(ComAtprotoAdminDefs.SubjectStatusView.self, forKey: .subjectStatus)
                
            } catch {
                print("Decoding error for property 'subjectStatus': \(error)")
                throw error
            }
            do {
                
                self.reportedBy = try container.decode(String.self, forKey: .reportedBy)
                
            } catch {
                print("Decoding error for property 'reportedBy': \(error)")
                throw error
            }
            do {
                
                self.createdAt = try container.decode(ATProtocolDate.self, forKey: .createdAt)
                
            } catch {
                print("Decoding error for property 'createdAt': \(error)")
                throw error
            }
            do {
                
                self.resolvedByActions = try container.decode([ComAtprotoAdminDefs.ModEventView].self, forKey: .resolvedByActions)
                
            } catch {
                print("Decoding error for property 'resolvedByActions': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
            try container.encode(id, forKey: .id)
            
            
            try container.encode(reasonType, forKey: .reasonType)
            
            
            if let value = comment {
                try container.encode(value, forKey: .comment)
            }
            
            
            try container.encode(subject, forKey: .subject)
            
            
            if let value = subjectStatus {
                try container.encode(value, forKey: .subjectStatus)
            }
            
            
            try container.encode(reportedBy, forKey: .reportedBy)
            
            
            try container.encode(createdAt, forKey: .createdAt)
            
            
            try container.encode(resolvedByActions, forKey: .resolvedByActions)
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(id)
            hasher.combine(reasonType)
            if let value = comment {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            hasher.combine(subject)
            if let value = subjectStatus {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            hasher.combine(reportedBy)
            hasher.combine(createdAt)
            hasher.combine(resolvedByActions)
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.id != other.id {
                return false
            }
            
            
            if self.reasonType != other.reasonType {
                return false
            }
            
            
            if comment != other.comment {
                return false
            }
            
            
            if self.subject != other.subject {
                return false
            }
            
            
            if subjectStatus != other.subjectStatus {
                return false
            }
            
            
            if self.reportedBy != other.reportedBy {
                return false
            }
            
            
            if self.createdAt != other.createdAt {
                return false
            }
            
            
            if self.resolvedByActions != other.resolvedByActions {
                return false
            }
            
            return true
        }

        public static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.isEqual(to: rhs)
        }

        private enum CodingKeys: String, CodingKey {
            case typeIdentifier = "$type"
            case id
            case reasonType
            case comment
            case subject
            case subjectStatus
            case reportedBy
            case createdAt
            case resolvedByActions
        }
    }
        
public struct RepoView: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "com.atproto.admin.defs#repoView"
            public let did: String
            public let handle: String
            public let email: String?
            public let relatedRecords: [JSONValue]
            public let indexedAt: ATProtocolDate
            public let moderation: Moderation
            public let invitedBy: ComAtprotoServerDefs.InviteCode?
            public let invitesDisabled: Bool?
            public let inviteNote: String?

        // Standard initializer
        public init(
            did: String, handle: String, email: String?, relatedRecords: [JSONValue], indexedAt: ATProtocolDate, moderation: Moderation, invitedBy: ComAtprotoServerDefs.InviteCode?, invitesDisabled: Bool?, inviteNote: String?
        ) {
            
            self.did = did
            self.handle = handle
            self.email = email
            self.relatedRecords = relatedRecords
            self.indexedAt = indexedAt
            self.moderation = moderation
            self.invitedBy = invitedBy
            self.invitesDisabled = invitesDisabled
            self.inviteNote = inviteNote
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
                
                self.email = try container.decodeIfPresent(String.self, forKey: .email)
                
            } catch {
                print("Decoding error for property 'email': \(error)")
                throw error
            }
            do {
                
                self.relatedRecords = try container.decode([JSONValue].self, forKey: .relatedRecords)
                
            } catch {
                print("Decoding error for property 'relatedRecords': \(error)")
                throw error
            }
            do {
                
                self.indexedAt = try container.decode(ATProtocolDate.self, forKey: .indexedAt)
                
            } catch {
                print("Decoding error for property 'indexedAt': \(error)")
                throw error
            }
            do {
                
                self.moderation = try container.decode(Moderation.self, forKey: .moderation)
                
            } catch {
                print("Decoding error for property 'moderation': \(error)")
                throw error
            }
            do {
                
                self.invitedBy = try container.decodeIfPresent(ComAtprotoServerDefs.InviteCode.self, forKey: .invitedBy)
                
            } catch {
                print("Decoding error for property 'invitedBy': \(error)")
                throw error
            }
            do {
                
                self.invitesDisabled = try container.decodeIfPresent(Bool.self, forKey: .invitesDisabled)
                
            } catch {
                print("Decoding error for property 'invitesDisabled': \(error)")
                throw error
            }
            do {
                
                self.inviteNote = try container.decodeIfPresent(String.self, forKey: .inviteNote)
                
            } catch {
                print("Decoding error for property 'inviteNote': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
            try container.encode(did, forKey: .did)
            
            
            try container.encode(handle, forKey: .handle)
            
            
            if let value = email {
                try container.encode(value, forKey: .email)
            }
            
            
            try container.encode(relatedRecords, forKey: .relatedRecords)
            
            
            try container.encode(indexedAt, forKey: .indexedAt)
            
            
            try container.encode(moderation, forKey: .moderation)
            
            
            if let value = invitedBy {
                try container.encode(value, forKey: .invitedBy)
            }
            
            
            if let value = invitesDisabled {
                try container.encode(value, forKey: .invitesDisabled)
            }
            
            
            if let value = inviteNote {
                try container.encode(value, forKey: .inviteNote)
            }
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(did)
            hasher.combine(handle)
            if let value = email {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            hasher.combine(relatedRecords)
            hasher.combine(indexedAt)
            hasher.combine(moderation)
            if let value = invitedBy {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = invitesDisabled {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = inviteNote {
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
            
            
            if email != other.email {
                return false
            }
            
            
            if self.relatedRecords != other.relatedRecords {
                return false
            }
            
            
            if self.indexedAt != other.indexedAt {
                return false
            }
            
            
            if self.moderation != other.moderation {
                return false
            }
            
            
            if invitedBy != other.invitedBy {
                return false
            }
            
            
            if invitesDisabled != other.invitesDisabled {
                return false
            }
            
            
            if inviteNote != other.inviteNote {
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
            case handle
            case email
            case relatedRecords
            case indexedAt
            case moderation
            case invitedBy
            case invitesDisabled
            case inviteNote
        }
    }
        
public struct RepoViewDetail: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "com.atproto.admin.defs#repoViewDetail"
            public let did: String
            public let handle: String
            public let email: String?
            public let relatedRecords: [JSONValue]
            public let indexedAt: ATProtocolDate
            public let moderation: ModerationDetail
            public let labels: [ComAtprotoLabelDefs.Label]?
            public let invitedBy: ComAtprotoServerDefs.InviteCode?
            public let invites: [ComAtprotoServerDefs.InviteCode]?
            public let invitesDisabled: Bool?
            public let inviteNote: String?
            public let emailConfirmedAt: ATProtocolDate?

        // Standard initializer
        public init(
            did: String, handle: String, email: String?, relatedRecords: [JSONValue], indexedAt: ATProtocolDate, moderation: ModerationDetail, labels: [ComAtprotoLabelDefs.Label]?, invitedBy: ComAtprotoServerDefs.InviteCode?, invites: [ComAtprotoServerDefs.InviteCode]?, invitesDisabled: Bool?, inviteNote: String?, emailConfirmedAt: ATProtocolDate?
        ) {
            
            self.did = did
            self.handle = handle
            self.email = email
            self.relatedRecords = relatedRecords
            self.indexedAt = indexedAt
            self.moderation = moderation
            self.labels = labels
            self.invitedBy = invitedBy
            self.invites = invites
            self.invitesDisabled = invitesDisabled
            self.inviteNote = inviteNote
            self.emailConfirmedAt = emailConfirmedAt
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
                
                self.email = try container.decodeIfPresent(String.self, forKey: .email)
                
            } catch {
                print("Decoding error for property 'email': \(error)")
                throw error
            }
            do {
                
                self.relatedRecords = try container.decode([JSONValue].self, forKey: .relatedRecords)
                
            } catch {
                print("Decoding error for property 'relatedRecords': \(error)")
                throw error
            }
            do {
                
                self.indexedAt = try container.decode(ATProtocolDate.self, forKey: .indexedAt)
                
            } catch {
                print("Decoding error for property 'indexedAt': \(error)")
                throw error
            }
            do {
                
                self.moderation = try container.decode(ModerationDetail.self, forKey: .moderation)
                
            } catch {
                print("Decoding error for property 'moderation': \(error)")
                throw error
            }
            do {
                
                self.labels = try container.decodeIfPresent([ComAtprotoLabelDefs.Label].self, forKey: .labels)
                
            } catch {
                print("Decoding error for property 'labels': \(error)")
                throw error
            }
            do {
                
                self.invitedBy = try container.decodeIfPresent(ComAtprotoServerDefs.InviteCode.self, forKey: .invitedBy)
                
            } catch {
                print("Decoding error for property 'invitedBy': \(error)")
                throw error
            }
            do {
                
                self.invites = try container.decodeIfPresent([ComAtprotoServerDefs.InviteCode].self, forKey: .invites)
                
            } catch {
                print("Decoding error for property 'invites': \(error)")
                throw error
            }
            do {
                
                self.invitesDisabled = try container.decodeIfPresent(Bool.self, forKey: .invitesDisabled)
                
            } catch {
                print("Decoding error for property 'invitesDisabled': \(error)")
                throw error
            }
            do {
                
                self.inviteNote = try container.decodeIfPresent(String.self, forKey: .inviteNote)
                
            } catch {
                print("Decoding error for property 'inviteNote': \(error)")
                throw error
            }
            do {
                
                self.emailConfirmedAt = try container.decodeIfPresent(ATProtocolDate.self, forKey: .emailConfirmedAt)
                
            } catch {
                print("Decoding error for property 'emailConfirmedAt': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
            try container.encode(did, forKey: .did)
            
            
            try container.encode(handle, forKey: .handle)
            
            
            if let value = email {
                try container.encode(value, forKey: .email)
            }
            
            
            try container.encode(relatedRecords, forKey: .relatedRecords)
            
            
            try container.encode(indexedAt, forKey: .indexedAt)
            
            
            try container.encode(moderation, forKey: .moderation)
            
            
            if let value = labels {
                try container.encode(value, forKey: .labels)
            }
            
            
            if let value = invitedBy {
                try container.encode(value, forKey: .invitedBy)
            }
            
            
            if let value = invites {
                try container.encode(value, forKey: .invites)
            }
            
            
            if let value = invitesDisabled {
                try container.encode(value, forKey: .invitesDisabled)
            }
            
            
            if let value = inviteNote {
                try container.encode(value, forKey: .inviteNote)
            }
            
            
            if let value = emailConfirmedAt {
                try container.encode(value, forKey: .emailConfirmedAt)
            }
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(did)
            hasher.combine(handle)
            if let value = email {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            hasher.combine(relatedRecords)
            hasher.combine(indexedAt)
            hasher.combine(moderation)
            if let value = labels {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = invitedBy {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = invites {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = invitesDisabled {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = inviteNote {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = emailConfirmedAt {
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
            
            
            if email != other.email {
                return false
            }
            
            
            if self.relatedRecords != other.relatedRecords {
                return false
            }
            
            
            if self.indexedAt != other.indexedAt {
                return false
            }
            
            
            if self.moderation != other.moderation {
                return false
            }
            
            
            if labels != other.labels {
                return false
            }
            
            
            if invitedBy != other.invitedBy {
                return false
            }
            
            
            if invites != other.invites {
                return false
            }
            
            
            if invitesDisabled != other.invitesDisabled {
                return false
            }
            
            
            if inviteNote != other.inviteNote {
                return false
            }
            
            
            if emailConfirmedAt != other.emailConfirmedAt {
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
            case handle
            case email
            case relatedRecords
            case indexedAt
            case moderation
            case labels
            case invitedBy
            case invites
            case invitesDisabled
            case inviteNote
            case emailConfirmedAt
        }
    }
        
public struct AccountView: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "com.atproto.admin.defs#accountView"
            public let did: String
            public let handle: String
            public let email: String?
            public let relatedRecords: [JSONValue]?
            public let indexedAt: ATProtocolDate
            public let invitedBy: ComAtprotoServerDefs.InviteCode?
            public let invites: [ComAtprotoServerDefs.InviteCode]?
            public let invitesDisabled: Bool?
            public let emailConfirmedAt: ATProtocolDate?
            public let inviteNote: String?

        // Standard initializer
        public init(
            did: String, handle: String, email: String?, relatedRecords: [JSONValue]?, indexedAt: ATProtocolDate, invitedBy: ComAtprotoServerDefs.InviteCode?, invites: [ComAtprotoServerDefs.InviteCode]?, invitesDisabled: Bool?, emailConfirmedAt: ATProtocolDate?, inviteNote: String?
        ) {
            
            self.did = did
            self.handle = handle
            self.email = email
            self.relatedRecords = relatedRecords
            self.indexedAt = indexedAt
            self.invitedBy = invitedBy
            self.invites = invites
            self.invitesDisabled = invitesDisabled
            self.emailConfirmedAt = emailConfirmedAt
            self.inviteNote = inviteNote
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
                
                self.email = try container.decodeIfPresent(String.self, forKey: .email)
                
            } catch {
                print("Decoding error for property 'email': \(error)")
                throw error
            }
            do {
                
                self.relatedRecords = try container.decodeIfPresent([JSONValue].self, forKey: .relatedRecords)
                
            } catch {
                print("Decoding error for property 'relatedRecords': \(error)")
                throw error
            }
            do {
                
                self.indexedAt = try container.decode(ATProtocolDate.self, forKey: .indexedAt)
                
            } catch {
                print("Decoding error for property 'indexedAt': \(error)")
                throw error
            }
            do {
                
                self.invitedBy = try container.decodeIfPresent(ComAtprotoServerDefs.InviteCode.self, forKey: .invitedBy)
                
            } catch {
                print("Decoding error for property 'invitedBy': \(error)")
                throw error
            }
            do {
                
                self.invites = try container.decodeIfPresent([ComAtprotoServerDefs.InviteCode].self, forKey: .invites)
                
            } catch {
                print("Decoding error for property 'invites': \(error)")
                throw error
            }
            do {
                
                self.invitesDisabled = try container.decodeIfPresent(Bool.self, forKey: .invitesDisabled)
                
            } catch {
                print("Decoding error for property 'invitesDisabled': \(error)")
                throw error
            }
            do {
                
                self.emailConfirmedAt = try container.decodeIfPresent(ATProtocolDate.self, forKey: .emailConfirmedAt)
                
            } catch {
                print("Decoding error for property 'emailConfirmedAt': \(error)")
                throw error
            }
            do {
                
                self.inviteNote = try container.decodeIfPresent(String.self, forKey: .inviteNote)
                
            } catch {
                print("Decoding error for property 'inviteNote': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
            try container.encode(did, forKey: .did)
            
            
            try container.encode(handle, forKey: .handle)
            
            
            if let value = email {
                try container.encode(value, forKey: .email)
            }
            
            
            if let value = relatedRecords {
                try container.encode(value, forKey: .relatedRecords)
            }
            
            
            try container.encode(indexedAt, forKey: .indexedAt)
            
            
            if let value = invitedBy {
                try container.encode(value, forKey: .invitedBy)
            }
            
            
            if let value = invites {
                try container.encode(value, forKey: .invites)
            }
            
            
            if let value = invitesDisabled {
                try container.encode(value, forKey: .invitesDisabled)
            }
            
            
            if let value = emailConfirmedAt {
                try container.encode(value, forKey: .emailConfirmedAt)
            }
            
            
            if let value = inviteNote {
                try container.encode(value, forKey: .inviteNote)
            }
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(did)
            hasher.combine(handle)
            if let value = email {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = relatedRecords {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            hasher.combine(indexedAt)
            if let value = invitedBy {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = invites {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = invitesDisabled {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = emailConfirmedAt {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = inviteNote {
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
            
            
            if email != other.email {
                return false
            }
            
            
            if relatedRecords != other.relatedRecords {
                return false
            }
            
            
            if self.indexedAt != other.indexedAt {
                return false
            }
            
            
            if invitedBy != other.invitedBy {
                return false
            }
            
            
            if invites != other.invites {
                return false
            }
            
            
            if invitesDisabled != other.invitesDisabled {
                return false
            }
            
            
            if emailConfirmedAt != other.emailConfirmedAt {
                return false
            }
            
            
            if inviteNote != other.inviteNote {
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
            case handle
            case email
            case relatedRecords
            case indexedAt
            case invitedBy
            case invites
            case invitesDisabled
            case emailConfirmedAt
            case inviteNote
        }
    }
        
public struct RepoViewNotFound: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "com.atproto.admin.defs#repoViewNotFound"
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
        
public struct RepoRef: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "com.atproto.admin.defs#repoRef"
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
        
public struct RepoBlobRef: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "com.atproto.admin.defs#repoBlobRef"
            public let did: String
            public let cid: String
            public let recordUri: ATProtocolURI?

        // Standard initializer
        public init(
            did: String, cid: String, recordUri: ATProtocolURI?
        ) {
            
            self.did = did
            self.cid = cid
            self.recordUri = recordUri
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
                
                self.cid = try container.decode(String.self, forKey: .cid)
                
            } catch {
                print("Decoding error for property 'cid': \(error)")
                throw error
            }
            do {
                
                self.recordUri = try container.decodeIfPresent(ATProtocolURI.self, forKey: .recordUri)
                
            } catch {
                print("Decoding error for property 'recordUri': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
            try container.encode(did, forKey: .did)
            
            
            try container.encode(cid, forKey: .cid)
            
            
            if let value = recordUri {
                try container.encode(value, forKey: .recordUri)
            }
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(did)
            hasher.combine(cid)
            if let value = recordUri {
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
            
            
            if self.cid != other.cid {
                return false
            }
            
            
            if recordUri != other.recordUri {
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
            case cid
            case recordUri
        }
    }
        
public struct RecordView: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "com.atproto.admin.defs#recordView"
            public let uri: ATProtocolURI
            public let cid: String
            public let value: JSONValue
            public let blobCids: [String]
            public let indexedAt: ATProtocolDate
            public let moderation: Moderation
            public let repo: RepoView

        // Standard initializer
        public init(
            uri: ATProtocolURI, cid: String, value: JSONValue, blobCids: [String], indexedAt: ATProtocolDate, moderation: Moderation, repo: RepoView
        ) {
            
            self.uri = uri
            self.cid = cid
            self.value = value
            self.blobCids = blobCids
            self.indexedAt = indexedAt
            self.moderation = moderation
            self.repo = repo
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
                
                self.value = try container.decode(JSONValue.self, forKey: .value)
                
            } catch {
                print("Decoding error for property 'value': \(error)")
                throw error
            }
            do {
                
                self.blobCids = try container.decode([String].self, forKey: .blobCids)
                
            } catch {
                print("Decoding error for property 'blobCids': \(error)")
                throw error
            }
            do {
                
                self.indexedAt = try container.decode(ATProtocolDate.self, forKey: .indexedAt)
                
            } catch {
                print("Decoding error for property 'indexedAt': \(error)")
                throw error
            }
            do {
                
                self.moderation = try container.decode(Moderation.self, forKey: .moderation)
                
            } catch {
                print("Decoding error for property 'moderation': \(error)")
                throw error
            }
            do {
                
                self.repo = try container.decode(RepoView.self, forKey: .repo)
                
            } catch {
                print("Decoding error for property 'repo': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
            try container.encode(uri, forKey: .uri)
            
            
            try container.encode(cid, forKey: .cid)
            
            
            try container.encode(value, forKey: .value)
            
            
            try container.encode(blobCids, forKey: .blobCids)
            
            
            try container.encode(indexedAt, forKey: .indexedAt)
            
            
            try container.encode(moderation, forKey: .moderation)
            
            
            try container.encode(repo, forKey: .repo)
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(uri)
            hasher.combine(cid)
            hasher.combine(value)
            hasher.combine(blobCids)
            hasher.combine(indexedAt)
            hasher.combine(moderation)
            hasher.combine(repo)
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.uri != other.uri {
                return false
            }
            
            
            if self.cid != other.cid {
                return false
            }
            
            
            if self.value != other.value {
                return false
            }
            
            
            if self.blobCids != other.blobCids {
                return false
            }
            
            
            if self.indexedAt != other.indexedAt {
                return false
            }
            
            
            if self.moderation != other.moderation {
                return false
            }
            
            
            if self.repo != other.repo {
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
            case value
            case blobCids
            case indexedAt
            case moderation
            case repo
        }
    }
        
public struct RecordViewDetail: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "com.atproto.admin.defs#recordViewDetail"
            public let uri: ATProtocolURI
            public let cid: String
            public let value: JSONValue
            public let blobs: [BlobView]
            public let labels: [ComAtprotoLabelDefs.Label]?
            public let indexedAt: ATProtocolDate
            public let moderation: ModerationDetail
            public let repo: RepoView

        // Standard initializer
        public init(
            uri: ATProtocolURI, cid: String, value: JSONValue, blobs: [BlobView], labels: [ComAtprotoLabelDefs.Label]?, indexedAt: ATProtocolDate, moderation: ModerationDetail, repo: RepoView
        ) {
            
            self.uri = uri
            self.cid = cid
            self.value = value
            self.blobs = blobs
            self.labels = labels
            self.indexedAt = indexedAt
            self.moderation = moderation
            self.repo = repo
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
                
                self.value = try container.decode(JSONValue.self, forKey: .value)
                
            } catch {
                print("Decoding error for property 'value': \(error)")
                throw error
            }
            do {
                
                self.blobs = try container.decode([BlobView].self, forKey: .blobs)
                
            } catch {
                print("Decoding error for property 'blobs': \(error)")
                throw error
            }
            do {
                
                self.labels = try container.decodeIfPresent([ComAtprotoLabelDefs.Label].self, forKey: .labels)
                
            } catch {
                print("Decoding error for property 'labels': \(error)")
                throw error
            }
            do {
                
                self.indexedAt = try container.decode(ATProtocolDate.self, forKey: .indexedAt)
                
            } catch {
                print("Decoding error for property 'indexedAt': \(error)")
                throw error
            }
            do {
                
                self.moderation = try container.decode(ModerationDetail.self, forKey: .moderation)
                
            } catch {
                print("Decoding error for property 'moderation': \(error)")
                throw error
            }
            do {
                
                self.repo = try container.decode(RepoView.self, forKey: .repo)
                
            } catch {
                print("Decoding error for property 'repo': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
            try container.encode(uri, forKey: .uri)
            
            
            try container.encode(cid, forKey: .cid)
            
            
            try container.encode(value, forKey: .value)
            
            
            try container.encode(blobs, forKey: .blobs)
            
            
            if let value = labels {
                try container.encode(value, forKey: .labels)
            }
            
            
            try container.encode(indexedAt, forKey: .indexedAt)
            
            
            try container.encode(moderation, forKey: .moderation)
            
            
            try container.encode(repo, forKey: .repo)
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(uri)
            hasher.combine(cid)
            hasher.combine(value)
            hasher.combine(blobs)
            if let value = labels {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            hasher.combine(indexedAt)
            hasher.combine(moderation)
            hasher.combine(repo)
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.uri != other.uri {
                return false
            }
            
            
            if self.cid != other.cid {
                return false
            }
            
            
            if self.value != other.value {
                return false
            }
            
            
            if self.blobs != other.blobs {
                return false
            }
            
            
            if labels != other.labels {
                return false
            }
            
            
            if self.indexedAt != other.indexedAt {
                return false
            }
            
            
            if self.moderation != other.moderation {
                return false
            }
            
            
            if self.repo != other.repo {
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
            case value
            case blobs
            case labels
            case indexedAt
            case moderation
            case repo
        }
    }
        
public struct RecordViewNotFound: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "com.atproto.admin.defs#recordViewNotFound"
            public let uri: ATProtocolURI

        // Standard initializer
        public init(
            uri: ATProtocolURI
        ) {
            
            self.uri = uri
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
        
public struct Moderation: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "com.atproto.admin.defs#moderation"
            public let subjectStatus: SubjectStatusView?

        // Standard initializer
        public init(
            subjectStatus: SubjectStatusView?
        ) {
            
            self.subjectStatus = subjectStatus
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            do {
                
                self.subjectStatus = try container.decodeIfPresent(SubjectStatusView.self, forKey: .subjectStatus)
                
            } catch {
                print("Decoding error for property 'subjectStatus': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
            if let value = subjectStatus {
                try container.encode(value, forKey: .subjectStatus)
            }
            
        }

        public func hash(into hasher: inout Hasher) {
            if let value = subjectStatus {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if subjectStatus != other.subjectStatus {
                return false
            }
            
            return true
        }

        public static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.isEqual(to: rhs)
        }

        private enum CodingKeys: String, CodingKey {
            case typeIdentifier = "$type"
            case subjectStatus
        }
    }
        
public struct ModerationDetail: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "com.atproto.admin.defs#moderationDetail"
            public let subjectStatus: SubjectStatusView?

        // Standard initializer
        public init(
            subjectStatus: SubjectStatusView?
        ) {
            
            self.subjectStatus = subjectStatus
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            do {
                
                self.subjectStatus = try container.decodeIfPresent(SubjectStatusView.self, forKey: .subjectStatus)
                
            } catch {
                print("Decoding error for property 'subjectStatus': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
            if let value = subjectStatus {
                try container.encode(value, forKey: .subjectStatus)
            }
            
        }

        public func hash(into hasher: inout Hasher) {
            if let value = subjectStatus {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if subjectStatus != other.subjectStatus {
                return false
            }
            
            return true
        }

        public static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.isEqual(to: rhs)
        }

        private enum CodingKeys: String, CodingKey {
            case typeIdentifier = "$type"
            case subjectStatus
        }
    }
        
public struct BlobView: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "com.atproto.admin.defs#blobView"
            public let cid: String
            public let mimeType: String
            public let size: Int
            public let createdAt: ATProtocolDate
            public let details: BlobViewDetailsUnion?
            public let moderation: Moderation?

        // Standard initializer
        public init(
            cid: String, mimeType: String, size: Int, createdAt: ATProtocolDate, details: BlobViewDetailsUnion?, moderation: Moderation?
        ) {
            
            self.cid = cid
            self.mimeType = mimeType
            self.size = size
            self.createdAt = createdAt
            self.details = details
            self.moderation = moderation
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            do {
                
                self.cid = try container.decode(String.self, forKey: .cid)
                
            } catch {
                print("Decoding error for property 'cid': \(error)")
                throw error
            }
            do {
                
                self.mimeType = try container.decode(String.self, forKey: .mimeType)
                
            } catch {
                print("Decoding error for property 'mimeType': \(error)")
                throw error
            }
            do {
                
                self.size = try container.decode(Int.self, forKey: .size)
                
            } catch {
                print("Decoding error for property 'size': \(error)")
                throw error
            }
            do {
                
                self.createdAt = try container.decode(ATProtocolDate.self, forKey: .createdAt)
                
            } catch {
                print("Decoding error for property 'createdAt': \(error)")
                throw error
            }
            do {
                
                self.details = try container.decodeIfPresent(BlobViewDetailsUnion.self, forKey: .details)
                
            } catch {
                print("Decoding error for property 'details': \(error)")
                throw error
            }
            do {
                
                self.moderation = try container.decodeIfPresent(Moderation.self, forKey: .moderation)
                
            } catch {
                print("Decoding error for property 'moderation': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
            try container.encode(cid, forKey: .cid)
            
            
            try container.encode(mimeType, forKey: .mimeType)
            
            
            try container.encode(size, forKey: .size)
            
            
            try container.encode(createdAt, forKey: .createdAt)
            
            
            if let value = details {
                try container.encode(value, forKey: .details)
            }
            
            
            if let value = moderation {
                try container.encode(value, forKey: .moderation)
            }
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(cid)
            hasher.combine(mimeType)
            hasher.combine(size)
            hasher.combine(createdAt)
            if let value = details {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = moderation {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.cid != other.cid {
                return false
            }
            
            
            if self.mimeType != other.mimeType {
                return false
            }
            
            
            if self.size != other.size {
                return false
            }
            
            
            if self.createdAt != other.createdAt {
                return false
            }
            
            
            if details != other.details {
                return false
            }
            
            
            if moderation != other.moderation {
                return false
            }
            
            return true
        }

        public static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.isEqual(to: rhs)
        }

        private enum CodingKeys: String, CodingKey {
            case typeIdentifier = "$type"
            case cid
            case mimeType
            case size
            case createdAt
            case details
            case moderation
        }
    }
        
public struct ImageDetails: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "com.atproto.admin.defs#imageDetails"
            public let width: Int
            public let height: Int

        // Standard initializer
        public init(
            width: Int, height: Int
        ) {
            
            self.width = width
            self.height = height
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            do {
                
                self.width = try container.decode(Int.self, forKey: .width)
                
            } catch {
                print("Decoding error for property 'width': \(error)")
                throw error
            }
            do {
                
                self.height = try container.decode(Int.self, forKey: .height)
                
            } catch {
                print("Decoding error for property 'height': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
            try container.encode(width, forKey: .width)
            
            
            try container.encode(height, forKey: .height)
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(width)
            hasher.combine(height)
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.width != other.width {
                return false
            }
            
            
            if self.height != other.height {
                return false
            }
            
            return true
        }

        public static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.isEqual(to: rhs)
        }

        private enum CodingKeys: String, CodingKey {
            case typeIdentifier = "$type"
            case width
            case height
        }
    }
        
public struct VideoDetails: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "com.atproto.admin.defs#videoDetails"
            public let width: Int
            public let height: Int
            public let length: Int

        // Standard initializer
        public init(
            width: Int, height: Int, length: Int
        ) {
            
            self.width = width
            self.height = height
            self.length = length
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            do {
                
                self.width = try container.decode(Int.self, forKey: .width)
                
            } catch {
                print("Decoding error for property 'width': \(error)")
                throw error
            }
            do {
                
                self.height = try container.decode(Int.self, forKey: .height)
                
            } catch {
                print("Decoding error for property 'height': \(error)")
                throw error
            }
            do {
                
                self.length = try container.decode(Int.self, forKey: .length)
                
            } catch {
                print("Decoding error for property 'length': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
            try container.encode(width, forKey: .width)
            
            
            try container.encode(height, forKey: .height)
            
            
            try container.encode(length, forKey: .length)
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(width)
            hasher.combine(height)
            hasher.combine(length)
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.width != other.width {
                return false
            }
            
            
            if self.height != other.height {
                return false
            }
            
            
            if self.length != other.length {
                return false
            }
            
            return true
        }

        public static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.isEqual(to: rhs)
        }

        private enum CodingKeys: String, CodingKey {
            case typeIdentifier = "$type"
            case width
            case height
            case length
        }
    }
        
public struct ModEventTakedown: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "com.atproto.admin.defs#modEventTakedown"
            public let comment: String?
            public let durationInHours: Int?

        // Standard initializer
        public init(
            comment: String?, durationInHours: Int?
        ) {
            
            self.comment = comment
            self.durationInHours = durationInHours
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            do {
                
                self.comment = try container.decodeIfPresent(String.self, forKey: .comment)
                
            } catch {
                print("Decoding error for property 'comment': \(error)")
                throw error
            }
            do {
                
                self.durationInHours = try container.decodeIfPresent(Int.self, forKey: .durationInHours)
                
            } catch {
                print("Decoding error for property 'durationInHours': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
            if let value = comment {
                try container.encode(value, forKey: .comment)
            }
            
            
            if let value = durationInHours {
                try container.encode(value, forKey: .durationInHours)
            }
            
        }

        public func hash(into hasher: inout Hasher) {
            if let value = comment {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = durationInHours {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if comment != other.comment {
                return false
            }
            
            
            if durationInHours != other.durationInHours {
                return false
            }
            
            return true
        }

        public static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.isEqual(to: rhs)
        }

        private enum CodingKeys: String, CodingKey {
            case typeIdentifier = "$type"
            case comment
            case durationInHours
        }
    }
        
public struct ModEventReverseTakedown: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "com.atproto.admin.defs#modEventReverseTakedown"
            public let comment: String?

        // Standard initializer
        public init(
            comment: String?
        ) {
            
            self.comment = comment
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            do {
                
                self.comment = try container.decodeIfPresent(String.self, forKey: .comment)
                
            } catch {
                print("Decoding error for property 'comment': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
            if let value = comment {
                try container.encode(value, forKey: .comment)
            }
            
        }

        public func hash(into hasher: inout Hasher) {
            if let value = comment {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if comment != other.comment {
                return false
            }
            
            return true
        }

        public static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.isEqual(to: rhs)
        }

        private enum CodingKeys: String, CodingKey {
            case typeIdentifier = "$type"
            case comment
        }
    }
        
public struct ModEventResolveAppeal: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "com.atproto.admin.defs#modEventResolveAppeal"
            public let comment: String?

        // Standard initializer
        public init(
            comment: String?
        ) {
            
            self.comment = comment
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            do {
                
                self.comment = try container.decodeIfPresent(String.self, forKey: .comment)
                
            } catch {
                print("Decoding error for property 'comment': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
            if let value = comment {
                try container.encode(value, forKey: .comment)
            }
            
        }

        public func hash(into hasher: inout Hasher) {
            if let value = comment {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if comment != other.comment {
                return false
            }
            
            return true
        }

        public static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.isEqual(to: rhs)
        }

        private enum CodingKeys: String, CodingKey {
            case typeIdentifier = "$type"
            case comment
        }
    }
        
public struct ModEventComment: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "com.atproto.admin.defs#modEventComment"
            public let comment: String
            public let sticky: Bool?

        // Standard initializer
        public init(
            comment: String, sticky: Bool?
        ) {
            
            self.comment = comment
            self.sticky = sticky
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            do {
                
                self.comment = try container.decode(String.self, forKey: .comment)
                
            } catch {
                print("Decoding error for property 'comment': \(error)")
                throw error
            }
            do {
                
                self.sticky = try container.decodeIfPresent(Bool.self, forKey: .sticky)
                
            } catch {
                print("Decoding error for property 'sticky': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
            try container.encode(comment, forKey: .comment)
            
            
            if let value = sticky {
                try container.encode(value, forKey: .sticky)
            }
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(comment)
            if let value = sticky {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.comment != other.comment {
                return false
            }
            
            
            if sticky != other.sticky {
                return false
            }
            
            return true
        }

        public static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.isEqual(to: rhs)
        }

        private enum CodingKeys: String, CodingKey {
            case typeIdentifier = "$type"
            case comment
            case sticky
        }
    }
        
public struct ModEventReport: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "com.atproto.admin.defs#modEventReport"
            public let comment: String?
            public let reportType: ComAtprotoModerationDefs.ReasonType

        // Standard initializer
        public init(
            comment: String?, reportType: ComAtprotoModerationDefs.ReasonType
        ) {
            
            self.comment = comment
            self.reportType = reportType
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            do {
                
                self.comment = try container.decodeIfPresent(String.self, forKey: .comment)
                
            } catch {
                print("Decoding error for property 'comment': \(error)")
                throw error
            }
            do {
                
                self.reportType = try container.decode(ComAtprotoModerationDefs.ReasonType.self, forKey: .reportType)
                
            } catch {
                print("Decoding error for property 'reportType': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
            if let value = comment {
                try container.encode(value, forKey: .comment)
            }
            
            
            try container.encode(reportType, forKey: .reportType)
            
        }

        public func hash(into hasher: inout Hasher) {
            if let value = comment {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            hasher.combine(reportType)
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if comment != other.comment {
                return false
            }
            
            
            if self.reportType != other.reportType {
                return false
            }
            
            return true
        }

        public static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.isEqual(to: rhs)
        }

        private enum CodingKeys: String, CodingKey {
            case typeIdentifier = "$type"
            case comment
            case reportType
        }
    }
        
public struct ModEventLabel: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "com.atproto.admin.defs#modEventLabel"
            public let comment: String?
            public let createLabelVals: [String]
            public let negateLabelVals: [String]

        // Standard initializer
        public init(
            comment: String?, createLabelVals: [String], negateLabelVals: [String]
        ) {
            
            self.comment = comment
            self.createLabelVals = createLabelVals
            self.negateLabelVals = negateLabelVals
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            do {
                
                self.comment = try container.decodeIfPresent(String.self, forKey: .comment)
                
            } catch {
                print("Decoding error for property 'comment': \(error)")
                throw error
            }
            do {
                
                self.createLabelVals = try container.decode([String].self, forKey: .createLabelVals)
                
            } catch {
                print("Decoding error for property 'createLabelVals': \(error)")
                throw error
            }
            do {
                
                self.negateLabelVals = try container.decode([String].self, forKey: .negateLabelVals)
                
            } catch {
                print("Decoding error for property 'negateLabelVals': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
            if let value = comment {
                try container.encode(value, forKey: .comment)
            }
            
            
            try container.encode(createLabelVals, forKey: .createLabelVals)
            
            
            try container.encode(negateLabelVals, forKey: .negateLabelVals)
            
        }

        public func hash(into hasher: inout Hasher) {
            if let value = comment {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            hasher.combine(createLabelVals)
            hasher.combine(negateLabelVals)
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if comment != other.comment {
                return false
            }
            
            
            if self.createLabelVals != other.createLabelVals {
                return false
            }
            
            
            if self.negateLabelVals != other.negateLabelVals {
                return false
            }
            
            return true
        }

        public static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.isEqual(to: rhs)
        }

        private enum CodingKeys: String, CodingKey {
            case typeIdentifier = "$type"
            case comment
            case createLabelVals
            case negateLabelVals
        }
    }
        
public struct ModEventAcknowledge: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "com.atproto.admin.defs#modEventAcknowledge"
            public let comment: String?

        // Standard initializer
        public init(
            comment: String?
        ) {
            
            self.comment = comment
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            do {
                
                self.comment = try container.decodeIfPresent(String.self, forKey: .comment)
                
            } catch {
                print("Decoding error for property 'comment': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
            if let value = comment {
                try container.encode(value, forKey: .comment)
            }
            
        }

        public func hash(into hasher: inout Hasher) {
            if let value = comment {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if comment != other.comment {
                return false
            }
            
            return true
        }

        public static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.isEqual(to: rhs)
        }

        private enum CodingKeys: String, CodingKey {
            case typeIdentifier = "$type"
            case comment
        }
    }
        
public struct ModEventEscalate: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "com.atproto.admin.defs#modEventEscalate"
            public let comment: String?

        // Standard initializer
        public init(
            comment: String?
        ) {
            
            self.comment = comment
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            do {
                
                self.comment = try container.decodeIfPresent(String.self, forKey: .comment)
                
            } catch {
                print("Decoding error for property 'comment': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
            if let value = comment {
                try container.encode(value, forKey: .comment)
            }
            
        }

        public func hash(into hasher: inout Hasher) {
            if let value = comment {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if comment != other.comment {
                return false
            }
            
            return true
        }

        public static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.isEqual(to: rhs)
        }

        private enum CodingKeys: String, CodingKey {
            case typeIdentifier = "$type"
            case comment
        }
    }
        
public struct ModEventMute: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "com.atproto.admin.defs#modEventMute"
            public let comment: String?
            public let durationInHours: Int

        // Standard initializer
        public init(
            comment: String?, durationInHours: Int
        ) {
            
            self.comment = comment
            self.durationInHours = durationInHours
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            do {
                
                self.comment = try container.decodeIfPresent(String.self, forKey: .comment)
                
            } catch {
                print("Decoding error for property 'comment': \(error)")
                throw error
            }
            do {
                
                self.durationInHours = try container.decode(Int.self, forKey: .durationInHours)
                
            } catch {
                print("Decoding error for property 'durationInHours': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
            if let value = comment {
                try container.encode(value, forKey: .comment)
            }
            
            
            try container.encode(durationInHours, forKey: .durationInHours)
            
        }

        public func hash(into hasher: inout Hasher) {
            if let value = comment {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            hasher.combine(durationInHours)
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if comment != other.comment {
                return false
            }
            
            
            if self.durationInHours != other.durationInHours {
                return false
            }
            
            return true
        }

        public static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.isEqual(to: rhs)
        }

        private enum CodingKeys: String, CodingKey {
            case typeIdentifier = "$type"
            case comment
            case durationInHours
        }
    }
        
public struct ModEventUnmute: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "com.atproto.admin.defs#modEventUnmute"
            public let comment: String?

        // Standard initializer
        public init(
            comment: String?
        ) {
            
            self.comment = comment
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            do {
                
                self.comment = try container.decodeIfPresent(String.self, forKey: .comment)
                
            } catch {
                print("Decoding error for property 'comment': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
            if let value = comment {
                try container.encode(value, forKey: .comment)
            }
            
        }

        public func hash(into hasher: inout Hasher) {
            if let value = comment {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if comment != other.comment {
                return false
            }
            
            return true
        }

        public static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.isEqual(to: rhs)
        }

        private enum CodingKeys: String, CodingKey {
            case typeIdentifier = "$type"
            case comment
        }
    }
        
public struct ModEventEmail: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "com.atproto.admin.defs#modEventEmail"
            public let subjectLine: String
            public let comment: String?

        // Standard initializer
        public init(
            subjectLine: String, comment: String?
        ) {
            
            self.subjectLine = subjectLine
            self.comment = comment
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            do {
                
                self.subjectLine = try container.decode(String.self, forKey: .subjectLine)
                
            } catch {
                print("Decoding error for property 'subjectLine': \(error)")
                throw error
            }
            do {
                
                self.comment = try container.decodeIfPresent(String.self, forKey: .comment)
                
            } catch {
                print("Decoding error for property 'comment': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
            try container.encode(subjectLine, forKey: .subjectLine)
            
            
            if let value = comment {
                try container.encode(value, forKey: .comment)
            }
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(subjectLine)
            if let value = comment {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.subjectLine != other.subjectLine {
                return false
            }
            
            
            if comment != other.comment {
                return false
            }
            
            return true
        }

        public static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.isEqual(to: rhs)
        }

        private enum CodingKeys: String, CodingKey {
            case typeIdentifier = "$type"
            case subjectLine
            case comment
        }
    }


            // Union Type
            
public enum ModEventViewEventUnion: Codable, ATProtocolCodable, ATProtocolValue {
                case comAtprotoAdminDefsModEventTakedown(ComAtprotoAdminDefs.ModEventTakedown)
                case comAtprotoAdminDefsModEventReverseTakedown(ComAtprotoAdminDefs.ModEventReverseTakedown)
                case comAtprotoAdminDefsModEventComment(ComAtprotoAdminDefs.ModEventComment)
                case comAtprotoAdminDefsModEventReport(ComAtprotoAdminDefs.ModEventReport)
                case comAtprotoAdminDefsModEventLabel(ComAtprotoAdminDefs.ModEventLabel)
                case comAtprotoAdminDefsModEventAcknowledge(ComAtprotoAdminDefs.ModEventAcknowledge)
                case comAtprotoAdminDefsModEventEscalate(ComAtprotoAdminDefs.ModEventEscalate)
                case comAtprotoAdminDefsModEventMute(ComAtprotoAdminDefs.ModEventMute)
                case comAtprotoAdminDefsModEventEmail(ComAtprotoAdminDefs.ModEventEmail)
                case unexpected(JSONValue)

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    let typeValue = try container.decode(String.self, forKey: .type)
                    print("ModEventViewEventUnion decoding: \(typeValue)")

                    switch typeValue {
                    case "com.atproto.admin.defs#modEventTakedown":
                        print("Decoding as com.atproto.admin.defs#modEventTakedown")
                        let value = try ComAtprotoAdminDefs.ModEventTakedown(from: decoder)
                        self = .comAtprotoAdminDefsModEventTakedown(value)
                    case "com.atproto.admin.defs#modEventReverseTakedown":
                        print("Decoding as com.atproto.admin.defs#modEventReverseTakedown")
                        let value = try ComAtprotoAdminDefs.ModEventReverseTakedown(from: decoder)
                        self = .comAtprotoAdminDefsModEventReverseTakedown(value)
                    case "com.atproto.admin.defs#modEventComment":
                        print("Decoding as com.atproto.admin.defs#modEventComment")
                        let value = try ComAtprotoAdminDefs.ModEventComment(from: decoder)
                        self = .comAtprotoAdminDefsModEventComment(value)
                    case "com.atproto.admin.defs#modEventReport":
                        print("Decoding as com.atproto.admin.defs#modEventReport")
                        let value = try ComAtprotoAdminDefs.ModEventReport(from: decoder)
                        self = .comAtprotoAdminDefsModEventReport(value)
                    case "com.atproto.admin.defs#modEventLabel":
                        print("Decoding as com.atproto.admin.defs#modEventLabel")
                        let value = try ComAtprotoAdminDefs.ModEventLabel(from: decoder)
                        self = .comAtprotoAdminDefsModEventLabel(value)
                    case "com.atproto.admin.defs#modEventAcknowledge":
                        print("Decoding as com.atproto.admin.defs#modEventAcknowledge")
                        let value = try ComAtprotoAdminDefs.ModEventAcknowledge(from: decoder)
                        self = .comAtprotoAdminDefsModEventAcknowledge(value)
                    case "com.atproto.admin.defs#modEventEscalate":
                        print("Decoding as com.atproto.admin.defs#modEventEscalate")
                        let value = try ComAtprotoAdminDefs.ModEventEscalate(from: decoder)
                        self = .comAtprotoAdminDefsModEventEscalate(value)
                    case "com.atproto.admin.defs#modEventMute":
                        print("Decoding as com.atproto.admin.defs#modEventMute")
                        let value = try ComAtprotoAdminDefs.ModEventMute(from: decoder)
                        self = .comAtprotoAdminDefsModEventMute(value)
                    case "com.atproto.admin.defs#modEventEmail":
                        print("Decoding as com.atproto.admin.defs#modEventEmail")
                        let value = try ComAtprotoAdminDefs.ModEventEmail(from: decoder)
                        self = .comAtprotoAdminDefsModEventEmail(value)
                    default:
                        print("ModEventViewEventUnion decoding encountered an unexpected type: \(typeValue)")
                        let unknownValue = try JSONValue(from: decoder)
                        self = .unexpected(unknownValue)
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)

                    switch self {
                    case .comAtprotoAdminDefsModEventTakedown(let value):
                        print("Encoding com.atproto.admin.defs#modEventTakedown")
                        try container.encode("com.atproto.admin.defs#modEventTakedown", forKey: .type)
                        try value.encode(to: encoder)
                    case .comAtprotoAdminDefsModEventReverseTakedown(let value):
                        print("Encoding com.atproto.admin.defs#modEventReverseTakedown")
                        try container.encode("com.atproto.admin.defs#modEventReverseTakedown", forKey: .type)
                        try value.encode(to: encoder)
                    case .comAtprotoAdminDefsModEventComment(let value):
                        print("Encoding com.atproto.admin.defs#modEventComment")
                        try container.encode("com.atproto.admin.defs#modEventComment", forKey: .type)
                        try value.encode(to: encoder)
                    case .comAtprotoAdminDefsModEventReport(let value):
                        print("Encoding com.atproto.admin.defs#modEventReport")
                        try container.encode("com.atproto.admin.defs#modEventReport", forKey: .type)
                        try value.encode(to: encoder)
                    case .comAtprotoAdminDefsModEventLabel(let value):
                        print("Encoding com.atproto.admin.defs#modEventLabel")
                        try container.encode("com.atproto.admin.defs#modEventLabel", forKey: .type)
                        try value.encode(to: encoder)
                    case .comAtprotoAdminDefsModEventAcknowledge(let value):
                        print("Encoding com.atproto.admin.defs#modEventAcknowledge")
                        try container.encode("com.atproto.admin.defs#modEventAcknowledge", forKey: .type)
                        try value.encode(to: encoder)
                    case .comAtprotoAdminDefsModEventEscalate(let value):
                        print("Encoding com.atproto.admin.defs#modEventEscalate")
                        try container.encode("com.atproto.admin.defs#modEventEscalate", forKey: .type)
                        try value.encode(to: encoder)
                    case .comAtprotoAdminDefsModEventMute(let value):
                        print("Encoding com.atproto.admin.defs#modEventMute")
                        try container.encode("com.atproto.admin.defs#modEventMute", forKey: .type)
                        try value.encode(to: encoder)
                    case .comAtprotoAdminDefsModEventEmail(let value):
                        print("Encoding com.atproto.admin.defs#modEventEmail")
                        try container.encode("com.atproto.admin.defs#modEventEmail", forKey: .type)
                        try value.encode(to: encoder)
                    case .unexpected(let jsonValue):
                        print("ModEventViewEventUnion encoding unexpected value")
                        try jsonValue.encode(to: encoder)
                    }
                }

                public func hash(into hasher: inout Hasher) {
                    switch self {
                    case .comAtprotoAdminDefsModEventTakedown(let value):
                        hasher.combine("com.atproto.admin.defs#modEventTakedown")
                        hasher.combine(value)
                    case .comAtprotoAdminDefsModEventReverseTakedown(let value):
                        hasher.combine("com.atproto.admin.defs#modEventReverseTakedown")
                        hasher.combine(value)
                    case .comAtprotoAdminDefsModEventComment(let value):
                        hasher.combine("com.atproto.admin.defs#modEventComment")
                        hasher.combine(value)
                    case .comAtprotoAdminDefsModEventReport(let value):
                        hasher.combine("com.atproto.admin.defs#modEventReport")
                        hasher.combine(value)
                    case .comAtprotoAdminDefsModEventLabel(let value):
                        hasher.combine("com.atproto.admin.defs#modEventLabel")
                        hasher.combine(value)
                    case .comAtprotoAdminDefsModEventAcknowledge(let value):
                        hasher.combine("com.atproto.admin.defs#modEventAcknowledge")
                        hasher.combine(value)
                    case .comAtprotoAdminDefsModEventEscalate(let value):
                        hasher.combine("com.atproto.admin.defs#modEventEscalate")
                        hasher.combine(value)
                    case .comAtprotoAdminDefsModEventMute(let value):
                        hasher.combine("com.atproto.admin.defs#modEventMute")
                        hasher.combine(value)
                    case .comAtprotoAdminDefsModEventEmail(let value):
                        hasher.combine("com.atproto.admin.defs#modEventEmail")
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
                    guard let otherValue = other as? ModEventViewEventUnion else { return false }

                    switch (self, otherValue) {
                        case (.comAtprotoAdminDefsModEventTakedown(let selfValue), 
                            .comAtprotoAdminDefsModEventTakedown(let otherValue)):
                            return selfValue == otherValue
                        case (.comAtprotoAdminDefsModEventReverseTakedown(let selfValue), 
                            .comAtprotoAdminDefsModEventReverseTakedown(let otherValue)):
                            return selfValue == otherValue
                        case (.comAtprotoAdminDefsModEventComment(let selfValue), 
                            .comAtprotoAdminDefsModEventComment(let otherValue)):
                            return selfValue == otherValue
                        case (.comAtprotoAdminDefsModEventReport(let selfValue), 
                            .comAtprotoAdminDefsModEventReport(let otherValue)):
                            return selfValue == otherValue
                        case (.comAtprotoAdminDefsModEventLabel(let selfValue), 
                            .comAtprotoAdminDefsModEventLabel(let otherValue)):
                            return selfValue == otherValue
                        case (.comAtprotoAdminDefsModEventAcknowledge(let selfValue), 
                            .comAtprotoAdminDefsModEventAcknowledge(let otherValue)):
                            return selfValue == otherValue
                        case (.comAtprotoAdminDefsModEventEscalate(let selfValue), 
                            .comAtprotoAdminDefsModEventEscalate(let otherValue)):
                            return selfValue == otherValue
                        case (.comAtprotoAdminDefsModEventMute(let selfValue), 
                            .comAtprotoAdminDefsModEventMute(let otherValue)):
                            return selfValue == otherValue
                        case (.comAtprotoAdminDefsModEventEmail(let selfValue), 
                            .comAtprotoAdminDefsModEventEmail(let otherValue)):
                            return selfValue == otherValue
                        case (.unexpected(let selfValue), .unexpected(let otherValue)):
                            return selfValue.isEqual(to: otherValue)
                        default:
                            return false
                    }
                }
            }

            // Union Type
            
public enum ModEventViewSubjectUnion: Codable, ATProtocolCodable, ATProtocolValue {
                case comAtprotoAdminDefsRepoRef(ComAtprotoAdminDefs.RepoRef)
                case comAtprotoRepoStrongRef(ComAtprotoRepoStrongRef)
                case unexpected(JSONValue)

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    let typeValue = try container.decode(String.self, forKey: .type)
                    print("ModEventViewSubjectUnion decoding: \(typeValue)")

                    switch typeValue {
                    case "com.atproto.admin.defs#repoRef":
                        print("Decoding as com.atproto.admin.defs#repoRef")
                        let value = try ComAtprotoAdminDefs.RepoRef(from: decoder)
                        self = .comAtprotoAdminDefsRepoRef(value)
                    case "com.atproto.repo.strongRef":
                        print("Decoding as com.atproto.repo.strongRef")
                        let value = try ComAtprotoRepoStrongRef(from: decoder)
                        self = .comAtprotoRepoStrongRef(value)
                    default:
                        print("ModEventViewSubjectUnion decoding encountered an unexpected type: \(typeValue)")
                        let unknownValue = try JSONValue(from: decoder)
                        self = .unexpected(unknownValue)
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)

                    switch self {
                    case .comAtprotoAdminDefsRepoRef(let value):
                        print("Encoding com.atproto.admin.defs#repoRef")
                        try container.encode("com.atproto.admin.defs#repoRef", forKey: .type)
                        try value.encode(to: encoder)
                    case .comAtprotoRepoStrongRef(let value):
                        print("Encoding com.atproto.repo.strongRef")
                        try container.encode("com.atproto.repo.strongRef", forKey: .type)
                        try value.encode(to: encoder)
                    case .unexpected(let jsonValue):
                        print("ModEventViewSubjectUnion encoding unexpected value")
                        try jsonValue.encode(to: encoder)
                    }
                }

                public func hash(into hasher: inout Hasher) {
                    switch self {
                    case .comAtprotoAdminDefsRepoRef(let value):
                        hasher.combine("com.atproto.admin.defs#repoRef")
                        hasher.combine(value)
                    case .comAtprotoRepoStrongRef(let value):
                        hasher.combine("com.atproto.repo.strongRef")
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
                    guard let otherValue = other as? ModEventViewSubjectUnion else { return false }

                    switch (self, otherValue) {
                        case (.comAtprotoAdminDefsRepoRef(let selfValue), 
                            .comAtprotoAdminDefsRepoRef(let otherValue)):
                            return selfValue == otherValue
                        case (.comAtprotoRepoStrongRef(let selfValue), 
                            .comAtprotoRepoStrongRef(let otherValue)):
                            return selfValue == otherValue
                        case (.unexpected(let selfValue), .unexpected(let otherValue)):
                            return selfValue.isEqual(to: otherValue)
                        default:
                            return false
                    }
                }
            }

            // Union Type
            
public enum ModEventViewDetailEventUnion: Codable, ATProtocolCodable, ATProtocolValue {
                case comAtprotoAdminDefsModEventTakedown(ComAtprotoAdminDefs.ModEventTakedown)
                case comAtprotoAdminDefsModEventReverseTakedown(ComAtprotoAdminDefs.ModEventReverseTakedown)
                case comAtprotoAdminDefsModEventComment(ComAtprotoAdminDefs.ModEventComment)
                case comAtprotoAdminDefsModEventReport(ComAtprotoAdminDefs.ModEventReport)
                case comAtprotoAdminDefsModEventLabel(ComAtprotoAdminDefs.ModEventLabel)
                case comAtprotoAdminDefsModEventAcknowledge(ComAtprotoAdminDefs.ModEventAcknowledge)
                case comAtprotoAdminDefsModEventEscalate(ComAtprotoAdminDefs.ModEventEscalate)
                case comAtprotoAdminDefsModEventMute(ComAtprotoAdminDefs.ModEventMute)
                case comAtprotoAdminDefsModEventResolveAppeal(ComAtprotoAdminDefs.ModEventResolveAppeal)
                case unexpected(JSONValue)

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    let typeValue = try container.decode(String.self, forKey: .type)
                    print("ModEventViewDetailEventUnion decoding: \(typeValue)")

                    switch typeValue {
                    case "com.atproto.admin.defs#modEventTakedown":
                        print("Decoding as com.atproto.admin.defs#modEventTakedown")
                        let value = try ComAtprotoAdminDefs.ModEventTakedown(from: decoder)
                        self = .comAtprotoAdminDefsModEventTakedown(value)
                    case "com.atproto.admin.defs#modEventReverseTakedown":
                        print("Decoding as com.atproto.admin.defs#modEventReverseTakedown")
                        let value = try ComAtprotoAdminDefs.ModEventReverseTakedown(from: decoder)
                        self = .comAtprotoAdminDefsModEventReverseTakedown(value)
                    case "com.atproto.admin.defs#modEventComment":
                        print("Decoding as com.atproto.admin.defs#modEventComment")
                        let value = try ComAtprotoAdminDefs.ModEventComment(from: decoder)
                        self = .comAtprotoAdminDefsModEventComment(value)
                    case "com.atproto.admin.defs#modEventReport":
                        print("Decoding as com.atproto.admin.defs#modEventReport")
                        let value = try ComAtprotoAdminDefs.ModEventReport(from: decoder)
                        self = .comAtprotoAdminDefsModEventReport(value)
                    case "com.atproto.admin.defs#modEventLabel":
                        print("Decoding as com.atproto.admin.defs#modEventLabel")
                        let value = try ComAtprotoAdminDefs.ModEventLabel(from: decoder)
                        self = .comAtprotoAdminDefsModEventLabel(value)
                    case "com.atproto.admin.defs#modEventAcknowledge":
                        print("Decoding as com.atproto.admin.defs#modEventAcknowledge")
                        let value = try ComAtprotoAdminDefs.ModEventAcknowledge(from: decoder)
                        self = .comAtprotoAdminDefsModEventAcknowledge(value)
                    case "com.atproto.admin.defs#modEventEscalate":
                        print("Decoding as com.atproto.admin.defs#modEventEscalate")
                        let value = try ComAtprotoAdminDefs.ModEventEscalate(from: decoder)
                        self = .comAtprotoAdminDefsModEventEscalate(value)
                    case "com.atproto.admin.defs#modEventMute":
                        print("Decoding as com.atproto.admin.defs#modEventMute")
                        let value = try ComAtprotoAdminDefs.ModEventMute(from: decoder)
                        self = .comAtprotoAdminDefsModEventMute(value)
                    case "com.atproto.admin.defs#modEventResolveAppeal":
                        print("Decoding as com.atproto.admin.defs#modEventResolveAppeal")
                        let value = try ComAtprotoAdminDefs.ModEventResolveAppeal(from: decoder)
                        self = .comAtprotoAdminDefsModEventResolveAppeal(value)
                    default:
                        print("ModEventViewDetailEventUnion decoding encountered an unexpected type: \(typeValue)")
                        let unknownValue = try JSONValue(from: decoder)
                        self = .unexpected(unknownValue)
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)

                    switch self {
                    case .comAtprotoAdminDefsModEventTakedown(let value):
                        print("Encoding com.atproto.admin.defs#modEventTakedown")
                        try container.encode("com.atproto.admin.defs#modEventTakedown", forKey: .type)
                        try value.encode(to: encoder)
                    case .comAtprotoAdminDefsModEventReverseTakedown(let value):
                        print("Encoding com.atproto.admin.defs#modEventReverseTakedown")
                        try container.encode("com.atproto.admin.defs#modEventReverseTakedown", forKey: .type)
                        try value.encode(to: encoder)
                    case .comAtprotoAdminDefsModEventComment(let value):
                        print("Encoding com.atproto.admin.defs#modEventComment")
                        try container.encode("com.atproto.admin.defs#modEventComment", forKey: .type)
                        try value.encode(to: encoder)
                    case .comAtprotoAdminDefsModEventReport(let value):
                        print("Encoding com.atproto.admin.defs#modEventReport")
                        try container.encode("com.atproto.admin.defs#modEventReport", forKey: .type)
                        try value.encode(to: encoder)
                    case .comAtprotoAdminDefsModEventLabel(let value):
                        print("Encoding com.atproto.admin.defs#modEventLabel")
                        try container.encode("com.atproto.admin.defs#modEventLabel", forKey: .type)
                        try value.encode(to: encoder)
                    case .comAtprotoAdminDefsModEventAcknowledge(let value):
                        print("Encoding com.atproto.admin.defs#modEventAcknowledge")
                        try container.encode("com.atproto.admin.defs#modEventAcknowledge", forKey: .type)
                        try value.encode(to: encoder)
                    case .comAtprotoAdminDefsModEventEscalate(let value):
                        print("Encoding com.atproto.admin.defs#modEventEscalate")
                        try container.encode("com.atproto.admin.defs#modEventEscalate", forKey: .type)
                        try value.encode(to: encoder)
                    case .comAtprotoAdminDefsModEventMute(let value):
                        print("Encoding com.atproto.admin.defs#modEventMute")
                        try container.encode("com.atproto.admin.defs#modEventMute", forKey: .type)
                        try value.encode(to: encoder)
                    case .comAtprotoAdminDefsModEventResolveAppeal(let value):
                        print("Encoding com.atproto.admin.defs#modEventResolveAppeal")
                        try container.encode("com.atproto.admin.defs#modEventResolveAppeal", forKey: .type)
                        try value.encode(to: encoder)
                    case .unexpected(let jsonValue):
                        print("ModEventViewDetailEventUnion encoding unexpected value")
                        try jsonValue.encode(to: encoder)
                    }
                }

                public func hash(into hasher: inout Hasher) {
                    switch self {
                    case .comAtprotoAdminDefsModEventTakedown(let value):
                        hasher.combine("com.atproto.admin.defs#modEventTakedown")
                        hasher.combine(value)
                    case .comAtprotoAdminDefsModEventReverseTakedown(let value):
                        hasher.combine("com.atproto.admin.defs#modEventReverseTakedown")
                        hasher.combine(value)
                    case .comAtprotoAdminDefsModEventComment(let value):
                        hasher.combine("com.atproto.admin.defs#modEventComment")
                        hasher.combine(value)
                    case .comAtprotoAdminDefsModEventReport(let value):
                        hasher.combine("com.atproto.admin.defs#modEventReport")
                        hasher.combine(value)
                    case .comAtprotoAdminDefsModEventLabel(let value):
                        hasher.combine("com.atproto.admin.defs#modEventLabel")
                        hasher.combine(value)
                    case .comAtprotoAdminDefsModEventAcknowledge(let value):
                        hasher.combine("com.atproto.admin.defs#modEventAcknowledge")
                        hasher.combine(value)
                    case .comAtprotoAdminDefsModEventEscalate(let value):
                        hasher.combine("com.atproto.admin.defs#modEventEscalate")
                        hasher.combine(value)
                    case .comAtprotoAdminDefsModEventMute(let value):
                        hasher.combine("com.atproto.admin.defs#modEventMute")
                        hasher.combine(value)
                    case .comAtprotoAdminDefsModEventResolveAppeal(let value):
                        hasher.combine("com.atproto.admin.defs#modEventResolveAppeal")
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
                    guard let otherValue = other as? ModEventViewDetailEventUnion else { return false }

                    switch (self, otherValue) {
                        case (.comAtprotoAdminDefsModEventTakedown(let selfValue), 
                            .comAtprotoAdminDefsModEventTakedown(let otherValue)):
                            return selfValue == otherValue
                        case (.comAtprotoAdminDefsModEventReverseTakedown(let selfValue), 
                            .comAtprotoAdminDefsModEventReverseTakedown(let otherValue)):
                            return selfValue == otherValue
                        case (.comAtprotoAdminDefsModEventComment(let selfValue), 
                            .comAtprotoAdminDefsModEventComment(let otherValue)):
                            return selfValue == otherValue
                        case (.comAtprotoAdminDefsModEventReport(let selfValue), 
                            .comAtprotoAdminDefsModEventReport(let otherValue)):
                            return selfValue == otherValue
                        case (.comAtprotoAdminDefsModEventLabel(let selfValue), 
                            .comAtprotoAdminDefsModEventLabel(let otherValue)):
                            return selfValue == otherValue
                        case (.comAtprotoAdminDefsModEventAcknowledge(let selfValue), 
                            .comAtprotoAdminDefsModEventAcknowledge(let otherValue)):
                            return selfValue == otherValue
                        case (.comAtprotoAdminDefsModEventEscalate(let selfValue), 
                            .comAtprotoAdminDefsModEventEscalate(let otherValue)):
                            return selfValue == otherValue
                        case (.comAtprotoAdminDefsModEventMute(let selfValue), 
                            .comAtprotoAdminDefsModEventMute(let otherValue)):
                            return selfValue == otherValue
                        case (.comAtprotoAdminDefsModEventResolveAppeal(let selfValue), 
                            .comAtprotoAdminDefsModEventResolveAppeal(let otherValue)):
                            return selfValue == otherValue
                        case (.unexpected(let selfValue), .unexpected(let otherValue)):
                            return selfValue.isEqual(to: otherValue)
                        default:
                            return false
                    }
                }
            }

            // Union Type
            
public enum ModEventViewDetailSubjectUnion: Codable, ATProtocolCodable, ATProtocolValue {
                case comAtprotoAdminDefsRepoView(ComAtprotoAdminDefs.RepoView)
                case comAtprotoAdminDefsRepoViewNotFound(ComAtprotoAdminDefs.RepoViewNotFound)
                case comAtprotoAdminDefsRecordView(ComAtprotoAdminDefs.RecordView)
                case comAtprotoAdminDefsRecordViewNotFound(ComAtprotoAdminDefs.RecordViewNotFound)
                case unexpected(JSONValue)

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    let typeValue = try container.decode(String.self, forKey: .type)
                    print("ModEventViewDetailSubjectUnion decoding: \(typeValue)")

                    switch typeValue {
                    case "com.atproto.admin.defs#repoView":
                        print("Decoding as com.atproto.admin.defs#repoView")
                        let value = try ComAtprotoAdminDefs.RepoView(from: decoder)
                        self = .comAtprotoAdminDefsRepoView(value)
                    case "com.atproto.admin.defs#repoViewNotFound":
                        print("Decoding as com.atproto.admin.defs#repoViewNotFound")
                        let value = try ComAtprotoAdminDefs.RepoViewNotFound(from: decoder)
                        self = .comAtprotoAdminDefsRepoViewNotFound(value)
                    case "com.atproto.admin.defs#recordView":
                        print("Decoding as com.atproto.admin.defs#recordView")
                        let value = try ComAtprotoAdminDefs.RecordView(from: decoder)
                        self = .comAtprotoAdminDefsRecordView(value)
                    case "com.atproto.admin.defs#recordViewNotFound":
                        print("Decoding as com.atproto.admin.defs#recordViewNotFound")
                        let value = try ComAtprotoAdminDefs.RecordViewNotFound(from: decoder)
                        self = .comAtprotoAdminDefsRecordViewNotFound(value)
                    default:
                        print("ModEventViewDetailSubjectUnion decoding encountered an unexpected type: \(typeValue)")
                        let unknownValue = try JSONValue(from: decoder)
                        self = .unexpected(unknownValue)
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)

                    switch self {
                    case .comAtprotoAdminDefsRepoView(let value):
                        print("Encoding com.atproto.admin.defs#repoView")
                        try container.encode("com.atproto.admin.defs#repoView", forKey: .type)
                        try value.encode(to: encoder)
                    case .comAtprotoAdminDefsRepoViewNotFound(let value):
                        print("Encoding com.atproto.admin.defs#repoViewNotFound")
                        try container.encode("com.atproto.admin.defs#repoViewNotFound", forKey: .type)
                        try value.encode(to: encoder)
                    case .comAtprotoAdminDefsRecordView(let value):
                        print("Encoding com.atproto.admin.defs#recordView")
                        try container.encode("com.atproto.admin.defs#recordView", forKey: .type)
                        try value.encode(to: encoder)
                    case .comAtprotoAdminDefsRecordViewNotFound(let value):
                        print("Encoding com.atproto.admin.defs#recordViewNotFound")
                        try container.encode("com.atproto.admin.defs#recordViewNotFound", forKey: .type)
                        try value.encode(to: encoder)
                    case .unexpected(let jsonValue):
                        print("ModEventViewDetailSubjectUnion encoding unexpected value")
                        try jsonValue.encode(to: encoder)
                    }
                }

                public func hash(into hasher: inout Hasher) {
                    switch self {
                    case .comAtprotoAdminDefsRepoView(let value):
                        hasher.combine("com.atproto.admin.defs#repoView")
                        hasher.combine(value)
                    case .comAtprotoAdminDefsRepoViewNotFound(let value):
                        hasher.combine("com.atproto.admin.defs#repoViewNotFound")
                        hasher.combine(value)
                    case .comAtprotoAdminDefsRecordView(let value):
                        hasher.combine("com.atproto.admin.defs#recordView")
                        hasher.combine(value)
                    case .comAtprotoAdminDefsRecordViewNotFound(let value):
                        hasher.combine("com.atproto.admin.defs#recordViewNotFound")
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
                    guard let otherValue = other as? ModEventViewDetailSubjectUnion else { return false }

                    switch (self, otherValue) {
                        case (.comAtprotoAdminDefsRepoView(let selfValue), 
                            .comAtprotoAdminDefsRepoView(let otherValue)):
                            return selfValue == otherValue
                        case (.comAtprotoAdminDefsRepoViewNotFound(let selfValue), 
                            .comAtprotoAdminDefsRepoViewNotFound(let otherValue)):
                            return selfValue == otherValue
                        case (.comAtprotoAdminDefsRecordView(let selfValue), 
                            .comAtprotoAdminDefsRecordView(let otherValue)):
                            return selfValue == otherValue
                        case (.comAtprotoAdminDefsRecordViewNotFound(let selfValue), 
                            .comAtprotoAdminDefsRecordViewNotFound(let otherValue)):
                            return selfValue == otherValue
                        case (.unexpected(let selfValue), .unexpected(let otherValue)):
                            return selfValue.isEqual(to: otherValue)
                        default:
                            return false
                    }
                }
            }

            // Union Type
            
public enum ReportViewSubjectUnion: Codable, ATProtocolCodable, ATProtocolValue {
                case comAtprotoAdminDefsRepoRef(ComAtprotoAdminDefs.RepoRef)
                case comAtprotoRepoStrongRef(ComAtprotoRepoStrongRef)
                case unexpected(JSONValue)

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    let typeValue = try container.decode(String.self, forKey: .type)
                    print("ReportViewSubjectUnion decoding: \(typeValue)")

                    switch typeValue {
                    case "com.atproto.admin.defs#repoRef":
                        print("Decoding as com.atproto.admin.defs#repoRef")
                        let value = try ComAtprotoAdminDefs.RepoRef(from: decoder)
                        self = .comAtprotoAdminDefsRepoRef(value)
                    case "com.atproto.repo.strongRef":
                        print("Decoding as com.atproto.repo.strongRef")
                        let value = try ComAtprotoRepoStrongRef(from: decoder)
                        self = .comAtprotoRepoStrongRef(value)
                    default:
                        print("ReportViewSubjectUnion decoding encountered an unexpected type: \(typeValue)")
                        let unknownValue = try JSONValue(from: decoder)
                        self = .unexpected(unknownValue)
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)

                    switch self {
                    case .comAtprotoAdminDefsRepoRef(let value):
                        print("Encoding com.atproto.admin.defs#repoRef")
                        try container.encode("com.atproto.admin.defs#repoRef", forKey: .type)
                        try value.encode(to: encoder)
                    case .comAtprotoRepoStrongRef(let value):
                        print("Encoding com.atproto.repo.strongRef")
                        try container.encode("com.atproto.repo.strongRef", forKey: .type)
                        try value.encode(to: encoder)
                    case .unexpected(let jsonValue):
                        print("ReportViewSubjectUnion encoding unexpected value")
                        try jsonValue.encode(to: encoder)
                    }
                }

                public func hash(into hasher: inout Hasher) {
                    switch self {
                    case .comAtprotoAdminDefsRepoRef(let value):
                        hasher.combine("com.atproto.admin.defs#repoRef")
                        hasher.combine(value)
                    case .comAtprotoRepoStrongRef(let value):
                        hasher.combine("com.atproto.repo.strongRef")
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
                    guard let otherValue = other as? ReportViewSubjectUnion else { return false }

                    switch (self, otherValue) {
                        case (.comAtprotoAdminDefsRepoRef(let selfValue), 
                            .comAtprotoAdminDefsRepoRef(let otherValue)):
                            return selfValue == otherValue
                        case (.comAtprotoRepoStrongRef(let selfValue), 
                            .comAtprotoRepoStrongRef(let otherValue)):
                            return selfValue == otherValue
                        case (.unexpected(let selfValue), .unexpected(let otherValue)):
                            return selfValue.isEqual(to: otherValue)
                        default:
                            return false
                    }
                }
            }

            // Union Type
            
public enum SubjectStatusViewSubjectUnion: Codable, ATProtocolCodable, ATProtocolValue {
                case comAtprotoAdminDefsRepoRef(ComAtprotoAdminDefs.RepoRef)
                case comAtprotoRepoStrongRef(ComAtprotoRepoStrongRef)
                case unexpected(JSONValue)

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    let typeValue = try container.decode(String.self, forKey: .type)
                    print("SubjectStatusViewSubjectUnion decoding: \(typeValue)")

                    switch typeValue {
                    case "com.atproto.admin.defs#repoRef":
                        print("Decoding as com.atproto.admin.defs#repoRef")
                        let value = try ComAtprotoAdminDefs.RepoRef(from: decoder)
                        self = .comAtprotoAdminDefsRepoRef(value)
                    case "com.atproto.repo.strongRef":
                        print("Decoding as com.atproto.repo.strongRef")
                        let value = try ComAtprotoRepoStrongRef(from: decoder)
                        self = .comAtprotoRepoStrongRef(value)
                    default:
                        print("SubjectStatusViewSubjectUnion decoding encountered an unexpected type: \(typeValue)")
                        let unknownValue = try JSONValue(from: decoder)
                        self = .unexpected(unknownValue)
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)

                    switch self {
                    case .comAtprotoAdminDefsRepoRef(let value):
                        print("Encoding com.atproto.admin.defs#repoRef")
                        try container.encode("com.atproto.admin.defs#repoRef", forKey: .type)
                        try value.encode(to: encoder)
                    case .comAtprotoRepoStrongRef(let value):
                        print("Encoding com.atproto.repo.strongRef")
                        try container.encode("com.atproto.repo.strongRef", forKey: .type)
                        try value.encode(to: encoder)
                    case .unexpected(let jsonValue):
                        print("SubjectStatusViewSubjectUnion encoding unexpected value")
                        try jsonValue.encode(to: encoder)
                    }
                }

                public func hash(into hasher: inout Hasher) {
                    switch self {
                    case .comAtprotoAdminDefsRepoRef(let value):
                        hasher.combine("com.atproto.admin.defs#repoRef")
                        hasher.combine(value)
                    case .comAtprotoRepoStrongRef(let value):
                        hasher.combine("com.atproto.repo.strongRef")
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
                    guard let otherValue = other as? SubjectStatusViewSubjectUnion else { return false }

                    switch (self, otherValue) {
                        case (.comAtprotoAdminDefsRepoRef(let selfValue), 
                            .comAtprotoAdminDefsRepoRef(let otherValue)):
                            return selfValue == otherValue
                        case (.comAtprotoRepoStrongRef(let selfValue), 
                            .comAtprotoRepoStrongRef(let otherValue)):
                            return selfValue == otherValue
                        case (.unexpected(let selfValue), .unexpected(let otherValue)):
                            return selfValue.isEqual(to: otherValue)
                        default:
                            return false
                    }
                }
            }

            // Union Type
            
public enum ReportViewDetailSubjectUnion: Codable, ATProtocolCodable, ATProtocolValue {
                case comAtprotoAdminDefsRepoView(ComAtprotoAdminDefs.RepoView)
                case comAtprotoAdminDefsRepoViewNotFound(ComAtprotoAdminDefs.RepoViewNotFound)
                case comAtprotoAdminDefsRecordView(ComAtprotoAdminDefs.RecordView)
                case comAtprotoAdminDefsRecordViewNotFound(ComAtprotoAdminDefs.RecordViewNotFound)
                case unexpected(JSONValue)

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    let typeValue = try container.decode(String.self, forKey: .type)
                    print("ReportViewDetailSubjectUnion decoding: \(typeValue)")

                    switch typeValue {
                    case "com.atproto.admin.defs#repoView":
                        print("Decoding as com.atproto.admin.defs#repoView")
                        let value = try ComAtprotoAdminDefs.RepoView(from: decoder)
                        self = .comAtprotoAdminDefsRepoView(value)
                    case "com.atproto.admin.defs#repoViewNotFound":
                        print("Decoding as com.atproto.admin.defs#repoViewNotFound")
                        let value = try ComAtprotoAdminDefs.RepoViewNotFound(from: decoder)
                        self = .comAtprotoAdminDefsRepoViewNotFound(value)
                    case "com.atproto.admin.defs#recordView":
                        print("Decoding as com.atproto.admin.defs#recordView")
                        let value = try ComAtprotoAdminDefs.RecordView(from: decoder)
                        self = .comAtprotoAdminDefsRecordView(value)
                    case "com.atproto.admin.defs#recordViewNotFound":
                        print("Decoding as com.atproto.admin.defs#recordViewNotFound")
                        let value = try ComAtprotoAdminDefs.RecordViewNotFound(from: decoder)
                        self = .comAtprotoAdminDefsRecordViewNotFound(value)
                    default:
                        print("ReportViewDetailSubjectUnion decoding encountered an unexpected type: \(typeValue)")
                        let unknownValue = try JSONValue(from: decoder)
                        self = .unexpected(unknownValue)
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)

                    switch self {
                    case .comAtprotoAdminDefsRepoView(let value):
                        print("Encoding com.atproto.admin.defs#repoView")
                        try container.encode("com.atproto.admin.defs#repoView", forKey: .type)
                        try value.encode(to: encoder)
                    case .comAtprotoAdminDefsRepoViewNotFound(let value):
                        print("Encoding com.atproto.admin.defs#repoViewNotFound")
                        try container.encode("com.atproto.admin.defs#repoViewNotFound", forKey: .type)
                        try value.encode(to: encoder)
                    case .comAtprotoAdminDefsRecordView(let value):
                        print("Encoding com.atproto.admin.defs#recordView")
                        try container.encode("com.atproto.admin.defs#recordView", forKey: .type)
                        try value.encode(to: encoder)
                    case .comAtprotoAdminDefsRecordViewNotFound(let value):
                        print("Encoding com.atproto.admin.defs#recordViewNotFound")
                        try container.encode("com.atproto.admin.defs#recordViewNotFound", forKey: .type)
                        try value.encode(to: encoder)
                    case .unexpected(let jsonValue):
                        print("ReportViewDetailSubjectUnion encoding unexpected value")
                        try jsonValue.encode(to: encoder)
                    }
                }

                public func hash(into hasher: inout Hasher) {
                    switch self {
                    case .comAtprotoAdminDefsRepoView(let value):
                        hasher.combine("com.atproto.admin.defs#repoView")
                        hasher.combine(value)
                    case .comAtprotoAdminDefsRepoViewNotFound(let value):
                        hasher.combine("com.atproto.admin.defs#repoViewNotFound")
                        hasher.combine(value)
                    case .comAtprotoAdminDefsRecordView(let value):
                        hasher.combine("com.atproto.admin.defs#recordView")
                        hasher.combine(value)
                    case .comAtprotoAdminDefsRecordViewNotFound(let value):
                        hasher.combine("com.atproto.admin.defs#recordViewNotFound")
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
                    guard let otherValue = other as? ReportViewDetailSubjectUnion else { return false }

                    switch (self, otherValue) {
                        case (.comAtprotoAdminDefsRepoView(let selfValue), 
                            .comAtprotoAdminDefsRepoView(let otherValue)):
                            return selfValue == otherValue
                        case (.comAtprotoAdminDefsRepoViewNotFound(let selfValue), 
                            .comAtprotoAdminDefsRepoViewNotFound(let otherValue)):
                            return selfValue == otherValue
                        case (.comAtprotoAdminDefsRecordView(let selfValue), 
                            .comAtprotoAdminDefsRecordView(let otherValue)):
                            return selfValue == otherValue
                        case (.comAtprotoAdminDefsRecordViewNotFound(let selfValue), 
                            .comAtprotoAdminDefsRecordViewNotFound(let otherValue)):
                            return selfValue == otherValue
                        case (.unexpected(let selfValue), .unexpected(let otherValue)):
                            return selfValue.isEqual(to: otherValue)
                        default:
                            return false
                    }
                }
            }

            // Union Type
            
public enum BlobViewDetailsUnion: Codable, ATProtocolCodable, ATProtocolValue {
                case comAtprotoAdminDefsImageDetails(ComAtprotoAdminDefs.ImageDetails)
                case comAtprotoAdminDefsVideoDetails(ComAtprotoAdminDefs.VideoDetails)
                case unexpected(JSONValue)

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    let typeValue = try container.decode(String.self, forKey: .type)
                    print("BlobViewDetailsUnion decoding: \(typeValue)")

                    switch typeValue {
                    case "com.atproto.admin.defs#imageDetails":
                        print("Decoding as com.atproto.admin.defs#imageDetails")
                        let value = try ComAtprotoAdminDefs.ImageDetails(from: decoder)
                        self = .comAtprotoAdminDefsImageDetails(value)
                    case "com.atproto.admin.defs#videoDetails":
                        print("Decoding as com.atproto.admin.defs#videoDetails")
                        let value = try ComAtprotoAdminDefs.VideoDetails(from: decoder)
                        self = .comAtprotoAdminDefsVideoDetails(value)
                    default:
                        print("BlobViewDetailsUnion decoding encountered an unexpected type: \(typeValue)")
                        let unknownValue = try JSONValue(from: decoder)
                        self = .unexpected(unknownValue)
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)

                    switch self {
                    case .comAtprotoAdminDefsImageDetails(let value):
                        print("Encoding com.atproto.admin.defs#imageDetails")
                        try container.encode("com.atproto.admin.defs#imageDetails", forKey: .type)
                        try value.encode(to: encoder)
                    case .comAtprotoAdminDefsVideoDetails(let value):
                        print("Encoding com.atproto.admin.defs#videoDetails")
                        try container.encode("com.atproto.admin.defs#videoDetails", forKey: .type)
                        try value.encode(to: encoder)
                    case .unexpected(let jsonValue):
                        print("BlobViewDetailsUnion encoding unexpected value")
                        try jsonValue.encode(to: encoder)
                    }
                }

                public func hash(into hasher: inout Hasher) {
                    switch self {
                    case .comAtprotoAdminDefsImageDetails(let value):
                        hasher.combine("com.atproto.admin.defs#imageDetails")
                        hasher.combine(value)
                    case .comAtprotoAdminDefsVideoDetails(let value):
                        hasher.combine("com.atproto.admin.defs#videoDetails")
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
                    guard let otherValue = other as? BlobViewDetailsUnion else { return false }

                    switch (self, otherValue) {
                        case (.comAtprotoAdminDefsImageDetails(let selfValue), 
                            .comAtprotoAdminDefsImageDetails(let otherValue)):
                            return selfValue == otherValue
                        case (.comAtprotoAdminDefsVideoDetails(let selfValue), 
                            .comAtprotoAdminDefsVideoDetails(let otherValue)):
                            return selfValue == otherValue
                        case (.unexpected(let selfValue), .unexpected(let otherValue)):
                            return selfValue.isEqual(to: otherValue)
                        default:
                            return false
                    }
                }
            }

        
public enum SubjectReviewState: String, Codable, ATProtocolCodable, ATProtocolValue {
            // 
            case reviewOpen = "#reviewOpen"
            // 
            case reviewEscalated = "#reviewEscalated"
            // 
            case reviewClosed = "#reviewClosed"

            public func isEqual(to other: any ATProtocolValue) -> Bool {
                guard let otherEnum = other as? SubjectReviewState else { return false }
                return self.rawValue == otherEnum.rawValue
            }
        }


}

                           
