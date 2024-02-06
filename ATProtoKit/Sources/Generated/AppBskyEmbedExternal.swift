import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.embed.external


public struct AppBskyEmbedExternal: ATProtocolCodable, ATProtocolValue { 
    public static let typeIdentifier = "app.bsky.embed.external"
        public let external: External

        public init(external: External) {
            self.external = external
            
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.external = try container.decode(External.self, forKey: .external)
            
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            try container.encode(external, forKey: .external)
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(external)
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            if self.external != other.external {
                return false
            }
            return true
        }


        private enum CodingKeys: String, CodingKey {
            case external
        }
        
public struct External: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "app.bsky.embed.external#external"
            public let uri: URI
            public let title: String
            public let description: String
            public let thumb: Blob?

        // Standard initializer
        public init(
            uri: URI, title: String, description: String, thumb: Blob?
        ) {
            
            self.uri = uri
            self.title = title
            self.description = description
            self.thumb = thumb
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.uri = try container.decode(URI.self, forKey: .uri)
            
            
            self.title = try container.decode(String.self, forKey: .title)
            
            
            self.description = try container.decode(String.self, forKey: .description)
            
            
            self.thumb = try container.decodeIfPresent(Blob.self, forKey: .thumb)
            
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            try container.encode(uri, forKey: .uri)
            
            
            try container.encode(title, forKey: .title)
            
            
            try container.encode(description, forKey: .description)
            
            
            if let value = thumb {
                try container.encode(value, forKey: .thumb)
            }
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(uri)
            hasher.combine(title)
            hasher.combine(description)
            if let value = thumb {
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
            
            
            if self.title != other.title {
                return false
            }
            
            
            if self.description != other.description {
                return false
            }
            
            
            if thumb != other.thumb {
                return false
            }
            
            return true
        }

        private enum CodingKeys: String, CodingKey {
            case uri
            case title
            case description
            case thumb
        }
    }
        
public struct View: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "app.bsky.embed.external#view"
            public let external: ViewExternal

        // Standard initializer
        public init(
            external: ViewExternal
        ) {
            
            self.external = external
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.external = try container.decode(ViewExternal.self, forKey: .external)
            
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            try container.encode(external, forKey: .external)
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(external)
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.external != other.external {
                return false
            }
            
            return true
        }

        private enum CodingKeys: String, CodingKey {
            case external
        }
    }
        
public struct ViewExternal: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "app.bsky.embed.external#viewExternal"
            public let uri: URI
            public let title: String
            public let description: String
            public let thumb: String?

        // Standard initializer
        public init(
            uri: URI, title: String, description: String, thumb: String?
        ) {
            
            self.uri = uri
            self.title = title
            self.description = description
            self.thumb = thumb
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.uri = try container.decode(URI.self, forKey: .uri)
            
            
            self.title = try container.decode(String.self, forKey: .title)
            
            
            self.description = try container.decode(String.self, forKey: .description)
            
            
            self.thumb = try container.decodeIfPresent(String.self, forKey: .thumb)
            
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            try container.encode(uri, forKey: .uri)
            
            
            try container.encode(title, forKey: .title)
            
            
            try container.encode(description, forKey: .description)
            
            
            if let value = thumb {
                try container.encode(value, forKey: .thumb)
            }
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(uri)
            hasher.combine(title)
            hasher.combine(description)
            if let value = thumb {
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
            
            
            if self.title != other.title {
                return false
            }
            
            
            if self.description != other.description {
                return false
            }
            
            
            if thumb != other.thumb {
                return false
            }
            
            return true
        }

        private enum CodingKeys: String, CodingKey {
            case uri
            case title
            case description
            case thumb
        }
    }



}

                           
