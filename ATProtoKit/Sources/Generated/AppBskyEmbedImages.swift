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
        if images != other.images {
            return false
        }
        return true
    }
 
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.isEqual(to: rhs)
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
            do {
                self.image = try container.decode(Blob.self, forKey: .image)
                
            } catch {
                print("Decoding error for property 'image': \(error)")
                throw error
            }
            do {
                self.alt = try container.decode(String.self, forKey: .alt)
                
            } catch {
                print("Decoding error for property 'alt': \(error)")
                throw error
            }
            do {
                self.aspectRatio = try container
                    .decodeIfPresent(AspectRatio.self, forKey: .aspectRatio)
                
            } catch {
                print("Decoding error for property 'aspectRatio': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
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
            
            if image != other.image {
                return false
            }
            
            if alt != other.alt {
                return false
            }
            
            if aspectRatio != other.aspectRatio {
                return false
            }
            
            return true
        }

        public static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.isEqual(to: rhs)
        }

        private enum CodingKeys: String, CodingKey {
            case typeIdentifier = "$type"
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
            
            if width != other.width {
                return false
            }
            
            if height != other.height {
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
            do {
                self.images = try container
                    .decode([ViewImage].self, forKey: .images)
                
            } catch {
                print("Decoding error for property 'images': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
            try container.encode(images, forKey: .images)
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(images)
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if images != other.images {
                return false
            }
            
            return true
        }

        public static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.isEqual(to: rhs)
        }

        private enum CodingKeys: String, CodingKey {
            case typeIdentifier = "$type"
            case images
        }
    }
        
    public struct ViewImage: ATProtocolCodable, ATProtocolValue {
        public static let typeIdentifier = "app.bsky.embed.images#viewImage"
        public let thumb: URI
        public let fullsize: URI
        public let alt: String
        public let aspectRatio: AspectRatio?

        // Standard initializer
        public init(
            thumb: URI, fullsize: URI, alt: String, aspectRatio: AspectRatio?
        ) {
            self.thumb = thumb
            self.fullsize = fullsize
            self.alt = alt
            self.aspectRatio = aspectRatio
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            do {
                self.thumb = try container.decode(URI.self, forKey: .thumb)
                
            } catch {
                print("Decoding error for property 'thumb': \(error)")
                throw error
            }
            do {
                self.fullsize = try container
                    .decode(URI.self, forKey: .fullsize)
                
            } catch {
                print("Decoding error for property 'fullsize': \(error)")
                throw error
            }
            do {
                self.alt = try container.decode(String.self, forKey: .alt)
                
            } catch {
                print("Decoding error for property 'alt': \(error)")
                throw error
            }
            do {
                self.aspectRatio = try container
                    .decodeIfPresent(AspectRatio.self, forKey: .aspectRatio)
                
            } catch {
                print("Decoding error for property 'aspectRatio': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
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
            
            if thumb != other.thumb {
                return false
            }
            
            if fullsize != other.fullsize {
                return false
            }
            
            if alt != other.alt {
                return false
            }
            
            if aspectRatio != other.aspectRatio {
                return false
            }
            
            return true
        }

        public static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.isEqual(to: rhs)
        }

        private enum CodingKeys: String, CodingKey {
            case typeIdentifier = "$type"
            case thumb
            case fullsize
            case alt
            case aspectRatio
        }
    }
}
