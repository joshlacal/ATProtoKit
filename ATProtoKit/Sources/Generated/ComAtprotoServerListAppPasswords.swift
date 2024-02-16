import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.server.listAppPasswords


public struct ComAtprotoServerListAppPasswords { 
    public static let typeIdentifier = "com.atproto.server.listAppPasswords"
        
public struct AppPassword: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "com.atproto.server.listAppPasswords#appPassword"
            public let name: String
            public let createdAt: ATProtocolDate

        // Standard initializer
        public init(
            name: String, createdAt: ATProtocolDate
        ) {
            
            self.name = name
            self.createdAt = createdAt
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            do {
                
                self.name = try container.decode(String.self, forKey: .name)
                
            } catch {
                print("Decoding error for property 'name': \(error)")
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
            
            try container.encode(name, forKey: .name)
            
            
            try container.encode(createdAt, forKey: .createdAt)
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(name)
            hasher.combine(createdAt)
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.name != other.name {
                return false
            }
            
            
            if self.createdAt != other.createdAt {
                return false
            }
            
            return true
        }

        private enum CodingKeys: String, CodingKey {
            case name
            case createdAt
        }
    }    
    
public struct Output: Codable { 
        
        public let passwords: [AppPassword]
        
        
        // Standard public initializer
        public init(
            passwords: [AppPassword]
        ) {
            
            self.passwords = passwords
            
        }
    }
            
public enum Error: String, Swift.Error, CustomStringConvertible {
                case accountTakedown = "AccountTakedown."
            public var description: String {
                return self.rawValue
            }
        }



}

extension ATProtoClient.Com.Atproto.Server {
    /// List all App Passwords. 
    public func listAppPasswords() async throws -> (responseCode: Int, data: ComAtprotoServerListAppPasswords.Output?) {
        let endpoint = "/com.atproto.server.listAppPasswords"
        
        
        // Perform a GET request without a body or query items
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "GET", body: nil)
        

        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(ComAtprotoServerListAppPasswords.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
