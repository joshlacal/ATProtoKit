import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.sync.listRepos


public struct ComAtprotoSyncListRepos { 

    public static let typeIdentifier = "com.atproto.sync.listRepos"
        
public struct Repo: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "com.atproto.sync.listRepos#repo"
            public let did: String
            public let head: String
            public let rev: String

        // Standard initializer
        public init(
            did: String, head: String, rev: String
        ) {
            
            self.did = did
            self.head = head
            self.rev = rev
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            do {
                
                self.did = try container.decode(String.self, forKey: .did)
                
            } catch {
                print("Decoding error for property 'did': \(error)")
                throw error
            }
            do {
                
                self.head = try container.decode(String.self, forKey: .head)
                
            } catch {
                print("Decoding error for property 'head': \(error)")
                throw error
            }
            do {
                
                self.rev = try container.decode(String.self, forKey: .rev)
                
            } catch {
                print("Decoding error for property 'rev': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
            try container.encode(did, forKey: .did)
            
            
            try container.encode(head, forKey: .head)
            
            
            try container.encode(rev, forKey: .rev)
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(did)
            hasher.combine(head)
            hasher.combine(rev)
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.did != other.did {
                return false
            }
            
            
            if self.head != other.head {
                return false
            }
            
            
            if self.rev != other.rev {
                return false
            }
            
            return true
        }

        public static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.isEqual(to: rhs)
        }

        private enum CodingKeys: String, CodingKey {
            case typeIdentifier = "$type"
            case did
            case head
            case rev
        }
    }    
public struct Parameters: Parametrizable {
        public let limit: Int?
        public let cursor: String?
        
        public init(
            limit: Int? = nil, 
            cursor: String? = nil
            ) {
            self.limit = limit
            self.cursor = cursor
            
        }
    }    
    
public struct Output: ATProtocolCodable { 
        
        public let cursor: String?
        
        public let repos: [Repo]
        
        
        // Standard public initializer
        public init(
            cursor: String? = nil, 
        
            repos: [Repo]
        ) {
            
            self.cursor = cursor
            
            self.repos = repos
            
        }
    }
    



}

extension ATProtoClient.Com.Atproto.Sync {
    /// Enumerates all the DID, rev, and commit CID for all repos hosted by this service. Does not require auth; implemented by PDS and Relay.
    public func listRepos(input: ComAtprotoSyncListRepos.Parameters) async throws -> (responseCode: Int, data: ComAtprotoSyncListRepos.Output?) {
        let endpoint = "/com.atproto.sync.listRepos"
        
        
        let queryItems = input.asQueryItems()
        let urlRequest = try await networkManager.createURLRequest(
            endpoint: endpoint, 
            method: "GET", 
            headers: [:],
            body: nil, 
            queryItems: queryItems
        )
        
        
        let (responseData, response) = try await networkManager.performRequest(urlRequest, retryCount: 0, duringInitialSetup: false)
        let responseCode = response.statusCode

        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(ComAtprotoSyncListRepos.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
