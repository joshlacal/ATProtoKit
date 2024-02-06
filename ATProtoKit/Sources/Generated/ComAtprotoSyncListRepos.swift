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
            
            self.did = try container.decode(String.self, forKey: .did)
            
            
            self.head = try container.decode(String.self, forKey: .head)
            
            
            self.rev = try container.decode(String.self, forKey: .rev)
            
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            
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

        private enum CodingKeys: String, CodingKey {
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
public struct Output: Codable {
            public let cursor: String?
            public let repos: [Repo]
                                    
            // Standard public initializer
            public init(cursor: String? = nil, repos: [Repo]) {
                self.cursor = cursor
                self.repos = repos
                
            }

        }



}

extension ATProtoClient.Com.Atproto.Sync {
    /// List DIDs and root CIDs of hosted repos. 
    public func listRepos(input: ComAtprotoSyncListRepos.Parameters) async throws -> (responseCode: Int, data: ComAtprotoSyncListRepos.Output?) {
        let endpoint = "/com.atproto.sync.listRepos"
        
        
        // Convert input to query items
        let queryItems = input.asQueryItems()
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "GET", queryItems: queryItems)
        

        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(ComAtprotoSyncListRepos.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
