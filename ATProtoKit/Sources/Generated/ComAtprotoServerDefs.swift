import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.server.defs


public struct ComAtprotoServerDefs { 

    public static let typeIdentifier = "com.atproto.server.defs"
        
public struct InviteCode: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "com.atproto.server.defs#inviteCode"
            public let code: String
            public let available: Int
            public let disabled: Bool
            public let forAccount: String
            public let createdBy: String
            public let createdAt: ATProtocolDate
            public let uses: [InviteCodeUse]

        // Standard initializer
        public init(
            code: String, available: Int, disabled: Bool, forAccount: String, createdBy: String, createdAt: ATProtocolDate, uses: [InviteCodeUse]
        ) {
            
            self.code = code
            self.available = available
            self.disabled = disabled
            self.forAccount = forAccount
            self.createdBy = createdBy
            self.createdAt = createdAt
            self.uses = uses
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            do {
                
                self.code = try container.decode(String.self, forKey: .code)
                
            } catch {
                print("Decoding error for property 'code': \(error)")
                throw error
            }
            do {
                
                self.available = try container.decode(Int.self, forKey: .available)
                
            } catch {
                print("Decoding error for property 'available': \(error)")
                throw error
            }
            do {
                
                self.disabled = try container.decode(Bool.self, forKey: .disabled)
                
            } catch {
                print("Decoding error for property 'disabled': \(error)")
                throw error
            }
            do {
                
                self.forAccount = try container.decode(String.self, forKey: .forAccount)
                
            } catch {
                print("Decoding error for property 'forAccount': \(error)")
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
                
                self.uses = try container.decode([InviteCodeUse].self, forKey: .uses)
                
            } catch {
                print("Decoding error for property 'uses': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
            try container.encode(code, forKey: .code)
            
            
            try container.encode(available, forKey: .available)
            
            
            try container.encode(disabled, forKey: .disabled)
            
            
            try container.encode(forAccount, forKey: .forAccount)
            
            
            try container.encode(createdBy, forKey: .createdBy)
            
            
            try container.encode(createdAt, forKey: .createdAt)
            
            
            try container.encode(uses, forKey: .uses)
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(code)
            hasher.combine(available)
            hasher.combine(disabled)
            hasher.combine(forAccount)
            hasher.combine(createdBy)
            hasher.combine(createdAt)
            hasher.combine(uses)
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.code != other.code {
                return false
            }
            
            
            if self.available != other.available {
                return false
            }
            
            
            if self.disabled != other.disabled {
                return false
            }
            
            
            if self.forAccount != other.forAccount {
                return false
            }
            
            
            if self.createdBy != other.createdBy {
                return false
            }
            
            
            if self.createdAt != other.createdAt {
                return false
            }
            
            
            if self.uses != other.uses {
                return false
            }
            
            return true
        }

        public static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.isEqual(to: rhs)
        }

        private enum CodingKeys: String, CodingKey {
            case typeIdentifier = "$type"
            case code
            case available
            case disabled
            case forAccount
            case createdBy
            case createdAt
            case uses
        }
    }
        
public struct InviteCodeUse: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "com.atproto.server.defs#inviteCodeUse"
            public let usedBy: String
            public let usedAt: ATProtocolDate

        // Standard initializer
        public init(
            usedBy: String, usedAt: ATProtocolDate
        ) {
            
            self.usedBy = usedBy
            self.usedAt = usedAt
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            do {
                
                self.usedBy = try container.decode(String.self, forKey: .usedBy)
                
            } catch {
                print("Decoding error for property 'usedBy': \(error)")
                throw error
            }
            do {
                
                self.usedAt = try container.decode(ATProtocolDate.self, forKey: .usedAt)
                
            } catch {
                print("Decoding error for property 'usedAt': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
            try container.encode(usedBy, forKey: .usedBy)
            
            
            try container.encode(usedAt, forKey: .usedAt)
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(usedBy)
            hasher.combine(usedAt)
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.usedBy != other.usedBy {
                return false
            }
            
            
            if self.usedAt != other.usedAt {
                return false
            }
            
            return true
        }

        public static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.isEqual(to: rhs)
        }

        private enum CodingKeys: String, CodingKey {
            case typeIdentifier = "$type"
            case usedBy
            case usedAt
        }
    }



}

                           
