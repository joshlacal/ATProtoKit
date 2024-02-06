import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.repo.applyWrites


public struct ComAtprotoRepoApplyWrites { 
    public static let typeIdentifier = "com.atproto.repo.applyWrites"
        
public struct Create: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "com.atproto.repo.applyWrites#create"
            public let collection: String
            public let rkey: String?
            public let value: JSONValue

        // Standard initializer
        public init(
            collection: String, rkey: String?, value: JSONValue
        ) {
            
            self.collection = collection
            self.rkey = rkey
            self.value = value
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.collection = try container.decode(String.self, forKey: .collection)
            
            
            self.rkey = try container.decodeIfPresent(String.self, forKey: .rkey)
            
            
            self.value = try container.decode(JSONValue.self, forKey: .value)
            
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            try container.encode(collection, forKey: .collection)
            
            
            if let value = rkey {
                try container.encode(value, forKey: .rkey)
            }
            
            
            try container.encode(value, forKey: .value)
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(collection)
            if let value = rkey {
                hasher.combine(value)
            } else {
                hasher.combine(nil as Int?)
            }
            hasher.combine(value)
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.collection != other.collection {
                return false
            }
            
            
            if rkey != other.rkey {
                return false
            }
            
            
            if self.value != other.value {
                return false
            }
            
            return true
        }

        private enum CodingKeys: String, CodingKey {
            case collection
            case rkey
            case value
        }
    }
        
public struct Update: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "com.atproto.repo.applyWrites#update"
            public let collection: String
            public let rkey: String
            public let value: JSONValue

        // Standard initializer
        public init(
            collection: String, rkey: String, value: JSONValue
        ) {
            
            self.collection = collection
            self.rkey = rkey
            self.value = value
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.collection = try container.decode(String.self, forKey: .collection)
            
            
            self.rkey = try container.decode(String.self, forKey: .rkey)
            
            
            self.value = try container.decode(JSONValue.self, forKey: .value)
            
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            try container.encode(collection, forKey: .collection)
            
            
            try container.encode(rkey, forKey: .rkey)
            
            
            try container.encode(value, forKey: .value)
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(collection)
            hasher.combine(rkey)
            hasher.combine(value)
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.collection != other.collection {
                return false
            }
            
            
            if self.rkey != other.rkey {
                return false
            }
            
            
            if self.value != other.value {
                return false
            }
            
            return true
        }

        private enum CodingKeys: String, CodingKey {
            case collection
            case rkey
            case value
        }
    }
        
public struct Delete: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "com.atproto.repo.applyWrites#delete"
            public let collection: String
            public let rkey: String

        // Standard initializer
        public init(
            collection: String, rkey: String
        ) {
            
            self.collection = collection
            self.rkey = rkey
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.collection = try container.decode(String.self, forKey: .collection)
            
            
            self.rkey = try container.decode(String.self, forKey: .rkey)
            
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            try container.encode(collection, forKey: .collection)
            
            
            try container.encode(rkey, forKey: .rkey)
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(collection)
            hasher.combine(rkey)
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.collection != other.collection {
                return false
            }
            
            
            if self.rkey != other.rkey {
                return false
            }
            
            return true
        }

        private enum CodingKeys: String, CodingKey {
            case collection
            case rkey
        }
    }        
public struct Input: Codable {
            public let repo: String
            public let validate: Bool?
            public let writes: [InputWritesUnion]
            public let swapCommit: String?

            // Standard public initializer
            public init(repo: String, validate: Bool? = nil, writes: [InputWritesUnion], swapCommit: String? = nil) {
                self.repo = repo
                self.validate = validate
                self.writes = writes
                self.swapCommit = swapCommit
                
            }
        }        
public enum Error: String, Swift.Error, CustomStringConvertible {
                case invalidSwap = "InvalidSwap."
            public var description: String {
                return self.rawValue
            }
        }


            // Union Type
            
public enum InputWritesUnion: Codable, ATProtocolCodable, ATProtocolValue {
                case comAtprotoRepoApplyWritesCreate(ComAtprotoRepoApplyWrites.Create)
                case comAtprotoRepoApplyWritesUpdate(ComAtprotoRepoApplyWrites.Update)
                case comAtprotoRepoApplyWritesDelete(ComAtprotoRepoApplyWrites.Delete)
                case unexpected(JSONValue)

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    let typeValue = try container.decode(String.self, forKey: .type)
                    print("InputWritesUnion decoding: \(typeValue)")

                    switch typeValue {
                    case "com.atproto.repo.applyWrites#create":
                        print("Decoding as com.atproto.repo.applyWrites#create")
                        let value = try ComAtprotoRepoApplyWrites.Create(from: decoder)
                        self = .comAtprotoRepoApplyWritesCreate(value)
                    case "com.atproto.repo.applyWrites#update":
                        print("Decoding as com.atproto.repo.applyWrites#update")
                        let value = try ComAtprotoRepoApplyWrites.Update(from: decoder)
                        self = .comAtprotoRepoApplyWritesUpdate(value)
                    case "com.atproto.repo.applyWrites#delete":
                        print("Decoding as com.atproto.repo.applyWrites#delete")
                        let value = try ComAtprotoRepoApplyWrites.Delete(from: decoder)
                        self = .comAtprotoRepoApplyWritesDelete(value)
                    default:
                        print("InputWritesUnion decoding encountered an unexpected type: \(typeValue)")
                        let unknownValue = try JSONValue(from: decoder)
                        self = .unexpected(unknownValue)
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)

                    switch self {
                    case .comAtprotoRepoApplyWritesCreate(let value):
                        print("Encoding com.atproto.repo.applyWrites#create")
                        try container.encode("com.atproto.repo.applyWrites#create", forKey: .type)
                        try value.encode(to: encoder)
                    case .comAtprotoRepoApplyWritesUpdate(let value):
                        print("Encoding com.atproto.repo.applyWrites#update")
                        try container.encode("com.atproto.repo.applyWrites#update", forKey: .type)
                        try value.encode(to: encoder)
                    case .comAtprotoRepoApplyWritesDelete(let value):
                        print("Encoding com.atproto.repo.applyWrites#delete")
                        try container.encode("com.atproto.repo.applyWrites#delete", forKey: .type)
                        try value.encode(to: encoder)
                    case .unexpected(let jsonValue):
                        print("InputWritesUnion encoding unexpected value")
                        try jsonValue.encode(to: encoder)
                    }
                }

                public func hash(into hasher: inout Hasher) {
                    switch self {
                    case .comAtprotoRepoApplyWritesCreate(let value):
                        hasher.combine("com.atproto.repo.applyWrites#create")
                        hasher.combine(value)
                    case .comAtprotoRepoApplyWritesUpdate(let value):
                        hasher.combine("com.atproto.repo.applyWrites#update")
                        hasher.combine(value)
                    case .comAtprotoRepoApplyWritesDelete(let value):
                        hasher.combine("com.atproto.repo.applyWrites#delete")
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
                    guard let otherValue = other as? InputWritesUnion else { return false }

                    switch (self, otherValue) {
                        case (.comAtprotoRepoApplyWritesCreate(let selfValue), 
                            .comAtprotoRepoApplyWritesCreate(let otherValue)):
                            return selfValue == otherValue
                        case (.comAtprotoRepoApplyWritesUpdate(let selfValue), 
                            .comAtprotoRepoApplyWritesUpdate(let otherValue)):
                            return selfValue == otherValue
                        case (.comAtprotoRepoApplyWritesDelete(let selfValue), 
                            .comAtprotoRepoApplyWritesDelete(let otherValue)):
                            return selfValue == otherValue
                        case (.unexpected(let selfValue), .unexpected(let otherValue)):
                            return selfValue.isEqual(to: otherValue)
                        default:
                            return false
                    }
                }
            }


}
extension ATProtoClient.Com.Atproto.Repo {
    /// Apply a batch transaction of creates, updates, and deletes.
    public func applyWrites(input: ComAtprotoRepoApplyWrites.Input) async throws -> Int {
        let endpoint = "/com.atproto.repo.applyWrites"
        
        let requestData = try JSONEncoder().encode(input)
        
        
        // Perform the network request
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "POST", body: requestData)

        
        // Return only the response code if no output type is expected
        return responseCode
        
    }
}
                           
