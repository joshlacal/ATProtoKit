import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.embed.images


public struct AppBskyEmbedImages: ATProtocolCodable, ATProtocolValue { 
    public static let typeIdentifier = "app.bsky.embed.images"
        public let images: [Image]

        public init(images: [Image]) {
            self.images = images
            
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.images = try container.decode([Image].self, forKey: .images)
            
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            try container.encode(images, forKey: .images)
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(images)
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            if self.images != other.images {
                return false
            }
            return true
        }


        private enum CodingKeys: String, CodingKey {
            case images
        }
        
public struct Image: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "app.bsky.embed.images#image"
            public let image: Blob
            public let alt: String
            public let aspectRatio: AspectRatio?

        // Standard initializer
        public init(
            image: Blob, alt: String, aspectRatio: AspectRatio?
        ) {
            
            self.image = image
            self.alt = alt
            self.aspectRatio = aspectRatio
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.image = try container.decode(Blob.self, forKey: .image)
            
            
            self.alt = try container.decode(String.self, forKey: .alt)
            
            
            self.aspectRatio = try container.decodeIfPresent(AspectRatio.self, forKey: .aspectRatio)
            
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            try container.encode(image, forKey: .image)
            
            
            try container.encode(alt, forKey: .alt)
            
            
            if let value = aspectRatio {
                try container.encode(value, forKey: .aspectRatio)
            }
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(image)
            hasher.combine(alt)
            if let value = aspectRatio {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.image != other.image {
                return false
            }
            
            
            if self.alt != other.alt {
                return false
            }
            
            
            if aspectRatio != other.aspectRatio {
                return false
            }
            
            return true
        }

        private enum CodingKeys: String, CodingKey {
            case image
            case alt
            case aspectRatio
        }
    }
        
public struct AspectRatio: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "app.bsky.embed.images#aspectRatio"
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
            
            self.width = try container.decode(Int.self, forKey: .width)
            
            
            self.height = try container.decode(Int.self, forKey: .height)
            
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
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

        private enum CodingKeys: String, CodingKey {
            case width
            case height
        }
    }
        
public struct View: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "app.bsky.embed.images#view"
            public let images: [ViewImage]

        // Standard initializer
        public init(
            images: [ViewImage]
        ) {
            
            self.images = images
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.images = try container.decode([ViewImage].self, forKey: .images)
            
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            try container.encode(images, forKey: .images)
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(images)
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.images != other.images {
                return false
            }
            
            return true
        }

        private enum CodingKeys: String, CodingKey {
            case images
        }
    }
        
public struct ViewImage: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "app.bsky.embed.images#viewImage"
            public let thumb: String
            public let fullsize: String
            public let alt: String
            public let aspectRatio: AspectRatio?

        // Standard initializer
        public init(
            thumb: String, fullsize: String, alt: String, aspectRatio: AspectRatio?
        ) {
            
            self.thumb = thumb
            self.fullsize = fullsize
            self.alt = alt
            self.aspectRatio = aspectRatio
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.thumb = try container.decode(String.self, forKey: .thumb)
            
            
            self.fullsize = try container.decode(String.self, forKey: .fullsize)
            
            
            self.alt = try container.decode(String.self, forKey: .alt)
            
            
            self.aspectRatio = try container.decodeIfPresent(AspectRatio.self, forKey: .aspectRatio)
            
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            try container.encode(thumb, forKey: .thumb)
            
            
            try container.encode(fullsize, forKey: .fullsize)
            
            
            try container.encode(alt, forKey: .alt)
            
            
            if let value = aspectRatio {
                try container.encode(value, forKey: .aspectRatio)
            }
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(thumb)
            hasher.combine(fullsize)
            hasher.combine(alt)
            if let value = aspectRatio {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.thumb != other.thumb {
                return false
            }
            
            
            if self.fullsize != other.fullsize {
                return false
            }
            
            
            if self.alt != other.alt {
                return false
            }
            
            
            if aspectRatio != other.aspectRatio {
                return false
            }
            
            return true
        }

        private enum CodingKeys: String, CodingKey {
            case thumb
            case fullsize
            case alt
            case aspectRatio
        }
    }



}

                           
