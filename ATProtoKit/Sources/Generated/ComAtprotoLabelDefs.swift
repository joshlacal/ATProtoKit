import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.label.defs


public struct ComAtprotoLabelDefs { 
    public static let typeIdentifier = "com.atproto.label.defs"
        
public struct Label: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "com.atproto.label.defs#label"
            public let src: String
            public let uri: URI
            public let cid: String?
            public let val: String
            public let neg: Bool?
            public let cts: ATProtocolDate

        // Standard initializer
        public init(
            src: String, uri: URI, cid: String?, val: String, neg: Bool?, cts: ATProtocolDate
        ) {
            
            self.src = src
            self.uri = uri
            self.cid = cid
            self.val = val
            self.neg = neg
            self.cts = cts
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            do {
                
                self.src = try container.decode(String.self, forKey: .src)
                
            } catch {
                print("Decoding error for property 'src': \(error)")
                throw error
            }
            do {
                
                self.uri = try container.decode(URI.self, forKey: .uri)
                
            } catch {
                print("Decoding error for property 'uri': \(error)")
                throw error
            }
            do {
                
                self.cid = try container.decodeIfPresent(String.self, forKey: .cid)
                
            } catch {
                print("Decoding error for property 'cid': \(error)")
                throw error
            }
            do {
                
                self.val = try container.decode(String.self, forKey: .val)
                
            } catch {
                print("Decoding error for property 'val': \(error)")
                throw error
            }
            do {
                
                self.neg = try container.decodeIfPresent(Bool.self, forKey: .neg)
                
            } catch {
                print("Decoding error for property 'neg': \(error)")
                throw error
            }
            do {
                
                self.cts = try container.decode(ATProtocolDate.self, forKey: .cts)
                
            } catch {
                print("Decoding error for property 'cts': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            try container.encode(src, forKey: .src)
            
            
            try container.encode(uri, forKey: .uri)
            
            
            if let value = cid {
                try container.encode(value, forKey: .cid)
            }
            
            
            try container.encode(val, forKey: .val)
            
            
            if let value = neg {
                try container.encode(value, forKey: .neg)
            }
            
            
            try container.encode(cts, forKey: .cts)
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(src)
            hasher.combine(uri)
            if let value = cid {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            hasher.combine(val)
            if let value = neg {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            hasher.combine(cts)
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.src != other.src {
                return false
            }
            
            
            if self.uri != other.uri {
                return false
            }
            
            
            if cid != other.cid {
                return false
            }
            
            
            if self.val != other.val {
                return false
            }
            
            
            if neg != other.neg {
                return false
            }
            
            
            if self.cts != other.cts {
                return false
            }
            
            return true
        }

        private enum CodingKeys: String, CodingKey {
            case src
            case uri
            case cid
            case val
            case neg
            case cts
        }
    }
        
public struct SelfLabels: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "com.atproto.label.defs#selfLabels"
            public let values: [SelfLabel]

        // Standard initializer
        public init(
            values: [SelfLabel]
        ) {
            
            self.values = values
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            do {
                
                self.values = try container.decode([SelfLabel].self, forKey: .values)
                
            } catch {
                print("Decoding error for property 'values': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            try container.encode(values, forKey: .values)
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(values)
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.values != other.values {
                return false
            }
            
            return true
        }

        private enum CodingKeys: String, CodingKey {
            case values
        }
    }
        
public struct SelfLabel: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "com.atproto.label.defs#selfLabel"
            public let val: String

        // Standard initializer
        public init(
            val: String
        ) {
            
            self.val = val
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            do {
                
                self.val = try container.decode(String.self, forKey: .val)
                
            } catch {
                print("Decoding error for property 'val': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            try container.encode(val, forKey: .val)
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(val)
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.val != other.val {
                return false
            }
            
            return true
        }

        private enum CodingKeys: String, CodingKey {
            case val
        }
    }



}

                           
