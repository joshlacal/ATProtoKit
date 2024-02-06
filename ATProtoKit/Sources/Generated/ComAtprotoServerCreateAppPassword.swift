import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.server.createAppPassword


public struct ComAtprotoServerCreateAppPassword { 
    public static let typeIdentifier = "com.atproto.server.createAppPassword"
        
public struct AppPassword: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "com.atproto.server.createAppPassword#appPassword"
            public let name: String
            public let password: String
            public let createdAt: ATProtocolDate

        // Standard initializer
        public init(
            name: String, password: String, createdAt: ATProtocolDate
        ) {
            
            self.name = name
            self.password = password
            self.createdAt = createdAt
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.name = try container.decode(String.self, forKey: .name)
            
            
            self.password = try container.decode(String.self, forKey: .password)
            
            
            self.createdAt = try container.decode(ATProtocolDate.self, forKey: .createdAt)
            
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
            try container.encode(name, forKey: .name)
            
            
            try container.encode(password, forKey: .password)
            
            
            try container.encode(createdAt, forKey: .createdAt)
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(name)
            hasher.combine(password)
            hasher.combine(createdAt)
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.name != other.name {
                return false
            }
            
            
            if self.password != other.password {
                return false
            }
            
            
            if self.createdAt != other.createdAt {
                return false
            }
            
            return true
        }

        private enum CodingKeys: String, CodingKey {
            case name
            case password
            case createdAt
        }
    }        
public struct Input: Codable {
            public let name: String

            // Standard public initializer
            public init(name: String) {
                self.name = name
                
            }
        }        
public struct Output: Codable {
            public let data: AppPassword
                                    
            // Standard public initializer
            public init(data: AppPassword) {
                self.data = data
                
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
    /// Create an App Password.
    public func createAppPassword(input: ComAtprotoServerCreateAppPassword.Input) async throws -> (responseCode: Int, data: ComAtprotoServerCreateAppPassword.Output?) {
        let endpoint = "/com.atproto.server.createAppPassword"
        
        let requestData = try JSONEncoder().encode(input)
        
        
        // Perform the network request
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "POST", body: requestData)

        
        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(ComAtprotoServerCreateAppPassword.Output.self, from: responseData)
        return (responseCode, decodedData)
        
    }
}
                           
