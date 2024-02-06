import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.notification.listNotifications


public struct AppBskyNotificationListNotifications { 
    public static let typeIdentifier = "app.bsky.notification.listNotifications"
        
public struct Notification: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "app.bsky.notification.listNotifications#notification"
            public let uri: ATProtocolURI
            public let cid: String
            public let author: AppBskyActorDefs.ProfileView
            public let reason: String
            public let reasonSubject: ATProtocolURI?
            public let record: JSONValue
            public let isRead: Bool
            public let indexedAt: ATProtocolDate
            public let labels: [ComAtprotoLabelDefs.Label]?

        // Standard initializer
        public init(
            uri: ATProtocolURI, cid: String, author: AppBskyActorDefs.ProfileView, reason: String, reasonSubject: ATProtocolURI?, record: JSONValue, isRead: Bool, indexedAt: ATProtocolDate, labels: [ComAtprotoLabelDefs.Label]?
        ) {
            
            self.uri = uri
            self.cid = cid
            self.author = author
            self.reason = reason
            self.reasonSubject = reasonSubject
            self.record = record
            self.isRead = isRead
            self.indexedAt = indexedAt
            self.labels = labels
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.uri = try container.decode(ATProtocolURI.self, forKey: .uri)
            
            
            self.cid = try container.decode(String.self, forKey: .cid)
            
            
            self.author = try container.decode(AppBskyActorDefs.ProfileView.self, forKey: .author)
            
            
            self.reason = try container.decode(String.self, forKey: .reason)
            
            
            self.reasonSubject = try container.decodeIfPresent(ATProtocolURI.self, forKey: .reasonSubject)
            
            
            self.record = try container.decode(JSONValue.self, forKey: .record)
            
            
            self.isRead = try container.decode(Bool.self, forKey: .isRead)
            
            
            self.indexedAt = try container.decode(ATProtocolDate.self, forKey: .indexedAt)
            
            
            self.labels = try container.decodeIfPresent([ComAtprotoLabelDefs.Label].self, forKey: .labels)
            
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            try container.encode(uri, forKey: .uri)
            
            
            try container.encode(cid, forKey: .cid)
            
            
            try container.encode(author, forKey: .author)
            
            
            try container.encode(reason, forKey: .reason)
            
            
            if let value = reasonSubject {
                try container.encode(value, forKey: .reasonSubject)
            }
            
            
            try container.encode(record, forKey: .record)
            
            
            try container.encode(isRead, forKey: .isRead)
            
            
            try container.encode(indexedAt, forKey: .indexedAt)
            
            
            if let value = labels {
                try container.encode(value, forKey: .labels)
            }
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(uri)
            hasher.combine(cid)
            hasher.combine(author)
            hasher.combine(reason)
            if let value = reasonSubject {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            hasher.combine(record)
            hasher.combine(isRead)
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
            
            
            if self.author != other.author {
                return false
            }
            
            
            if self.reason != other.reason {
                return false
            }
            
            
            if reasonSubject != other.reasonSubject {
                return false
            }
            
            
            if self.record != other.record {
                return false
            }
            
            
            if self.isRead != other.isRead {
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

        private enum CodingKeys: String, CodingKey {
            case uri
            case cid
            case author
            case reason
            case reasonSubject
            case record
            case isRead
            case indexedAt
            case labels
        }
    }        
public struct Parameters: Parametrizable {
            public let limit: Int?
            public let cursor: String?
            public let seenAt: ATProtocolDate?
            
            public init(
                limit: Int? = nil, 
                cursor: String? = nil, 
                seenAt: ATProtocolDate? = nil
                ) {
                self.limit = limit
                self.cursor = cursor
                self.seenAt = seenAt
                
            }
        }        
public struct Output: Codable {
            public let cursor: String?
            public let notifications: [Notification]
            public let seenAt: ATProtocolDate?
                                    
            // Standard public initializer
            public init(cursor: String? = nil, notifications: [Notification], seenAt: ATProtocolDate? = nil) {
                self.cursor = cursor
                self.notifications = notifications
                self.seenAt = seenAt
                
            }

        }



}

extension ATProtoClient.App.Bsky.Notification {
    /// Get a list of notifications. 
    public func listNotifications(input: AppBskyNotificationListNotifications.Parameters) async throws -> (responseCode: Int, data: AppBskyNotificationListNotifications.Output?) {
        let endpoint = "/app.bsky.notification.listNotifications"
        
        
        // Convert input to query items
        let queryItems = input.asQueryItems()
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "GET", queryItems: queryItems)
        

        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(AppBskyNotificationListNotifications.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
