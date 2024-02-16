import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.feed.getLikes


public struct AppBskyFeedGetLikes { 
    public static let typeIdentifier = "app.bsky.feed.getLikes"
        
public struct Like: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "app.bsky.feed.getLikes#like"
            public let indexedAt: ATProtocolDate
            public let createdAt: ATProtocolDate
            public let actor: AppBskyActorDefs.ProfileView

        // Standard initializer
        public init(
            indexedAt: ATProtocolDate, createdAt: ATProtocolDate, actor: AppBskyActorDefs.ProfileView
        ) {
            
            self.indexedAt = indexedAt
            self.createdAt = createdAt
            self.actor = actor
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            do {
                
                self.indexedAt = try container.decode(ATProtocolDate.self, forKey: .indexedAt)
                
            } catch {
                print("Decoding error for property 'indexedAt': \(error)")
                throw error
            }
            do {
                
                self.createdAt = try container.decode(ATProtocolDate.self, forKey: .createdAt)
                
            } catch {
                print("Decoding error for property 'createdAt': \(error)")
                throw error
            }
            do {
                
                self.actor = try container.decode(AppBskyActorDefs.ProfileView.self, forKey: .actor)
                
            } catch {
                print("Decoding error for property 'actor': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            try container.encode(indexedAt, forKey: .indexedAt)
            
            
            try container.encode(createdAt, forKey: .createdAt)
            
            
            try container.encode(actor, forKey: .actor)
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(indexedAt)
            hasher.combine(createdAt)
            hasher.combine(actor)
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.indexedAt != other.indexedAt {
                return false
            }
            
            
            if self.createdAt != other.createdAt {
                return false
            }
            
            
            if self.actor != other.actor {
                return false
            }
            
            return true
        }

        private enum CodingKeys: String, CodingKey {
            case indexedAt
            case createdAt
            case actor
        }
    }        
public struct Parameters: Parametrizable {
            public let uri: ATProtocolURI
            public let cid: String?
            public let limit: Int?
            public let cursor: String?
            
            public init(
                uri: ATProtocolURI, 
                cid: String? = nil, 
                limit: Int? = nil, 
                cursor: String? = nil
                ) {
                self.uri = uri
                self.cid = cid
                self.limit = limit
                self.cursor = cursor
                
            }
        }    
    
public struct Output: Codable { 
        
        public let uri: ATProtocolURI
        
        public let cid: String?
        
        public let cursor: String?
        
        public let likes: [Like]
        
        
        // Standard public initializer
        public init(
            uri: ATProtocolURI, 
        
            cid: String? = nil, 
        
            cursor: String? = nil, 
        
            likes: [Like]
        ) {
            
            self.uri = uri
            
            self.cid = cid
            
            self.cursor = cursor
            
            self.likes = likes
            
        }
    }
    



}

extension ATProtoClient.App.Bsky.Feed {
    /// Get the list of likes. 
    public func getLikes(input: AppBskyFeedGetLikes.Parameters) async throws -> (responseCode: Int, data: AppBskyFeedGetLikes.Output?) {
        let endpoint = "/app.bsky.feed.getLikes"
        
        
        // Convert input to query items
        let queryItems = input.asQueryItems()
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "GET", queryItems: queryItems)
        

        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(AppBskyFeedGetLikes.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
