import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.feed.describeFeedGenerator


public struct AppBskyFeedDescribeFeedGenerator { 
    public static let typeIdentifier = "app.bsky.feed.describeFeedGenerator"
        
public struct Feed: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "app.bsky.feed.describeFeedGenerator#feed"
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

        private enum CodingKeys: String, CodingKey {
            case uri
        }
    }
        
public struct Links: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "app.bsky.feed.describeFeedGenerator#links"
            public let privacyPolicy: String?
            public let termsOfService: String?

        // Standard initializer
        public init(
            privacyPolicy: String?, termsOfService: String?
        ) {
            
            self.privacyPolicy = privacyPolicy
            self.termsOfService = termsOfService
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            do {
                
                self.privacyPolicy = try container.decodeIfPresent(String.self, forKey: .privacyPolicy)
                
            } catch {
                print("Decoding error for property 'privacyPolicy': \(error)")
                throw error
            }
            do {
                
                self.termsOfService = try container.decodeIfPresent(String.self, forKey: .termsOfService)
                
            } catch {
                print("Decoding error for property 'termsOfService': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            if let value = privacyPolicy {
                try container.encode(value, forKey: .privacyPolicy)
            }
            
            
            if let value = termsOfService {
                try container.encode(value, forKey: .termsOfService)
            }
            
        }

        public func hash(into hasher: inout Hasher) {
            if let value = privacyPolicy {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            if let value = termsOfService {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if privacyPolicy != other.privacyPolicy {
                return false
            }
            
            
            if termsOfService != other.termsOfService {
                return false
            }
            
            return true
        }

        private enum CodingKeys: String, CodingKey {
            case privacyPolicy
            case termsOfService
        }
    }    
    
public struct Output: Codable { 
        
        public let did: String
        
        public let feeds: [Feed]
        
        public let links: Links?
        
        
        // Standard public initializer
        public init(
            did: String, 
        
            feeds: [Feed], 
        
            links: Links? = nil
        ) {
            
            self.did = did
            
            self.feeds = feeds
            
            self.links = links
            
        }
    }
    



}

extension ATProtoClient.App.Bsky.Feed {
    /// Get information about a feed generator, including policies and offered feed URIs. 
    public func describeFeedGenerator() async throws -> (responseCode: Int, data: AppBskyFeedDescribeFeedGenerator.Output?) {
        let endpoint = "/app.bsky.feed.describeFeedGenerator"
        
        
        // Perform a GET request without a body or query items
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "GET", body: nil)
        

        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(AppBskyFeedDescribeFeedGenerator.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
