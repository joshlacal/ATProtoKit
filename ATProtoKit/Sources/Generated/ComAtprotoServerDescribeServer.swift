import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.server.describeServer


public struct ComAtprotoServerDescribeServer { 
    public static let typeIdentifier = "com.atproto.server.describeServer"
        
public struct Links: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "com.atproto.server.describeServer#links"
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
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
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

        public static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.isEqual(to: rhs)
        }

        private enum CodingKeys: String, CodingKey {
            case typeIdentifier = "$type"
            case privacyPolicy
            case termsOfService
        }
    }    
    
public struct Output: Codable { 
        
        public let inviteCodeRequired: Bool?
        
        public let availableUserDomains: [String]
        
        public let links: Links?
        
        
        // Standard public initializer
        public init(
            inviteCodeRequired: Bool? = nil, 
        
            availableUserDomains: [String], 
        
            links: Links? = nil
        ) {
            
            self.inviteCodeRequired = inviteCodeRequired
            
            self.availableUserDomains = availableUserDomains
            
            self.links = links
            
        }
    }
    



}

extension ATProtoClient.Com.Atproto.Server {
    /// Get a document describing the service's accounts configuration. 
    public func describeServer() async throws -> (responseCode: Int, data: ComAtprotoServerDescribeServer.Output?) {
        let endpoint = "/com.atproto.server.describeServer"
        
        
        // Perform a GET request without a body or query items
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "GET", body: nil)
        

        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(ComAtprotoServerDescribeServer.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
