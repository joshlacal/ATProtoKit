import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.repo.listMissingBlobs


public struct ComAtprotoRepoListMissingBlobs { 

    public static let typeIdentifier = "com.atproto.repo.listMissingBlobs"
        
public struct RecordBlob: ATProtocolCodable, ATProtocolValue {
            public static let typeIdentifier = "com.atproto.repo.listMissingBlobs#recordBlob"
            public let cid: String
            public let recordUri: ATProtocolURI

        // Standard initializer
        public init(
            cid: String, recordUri: ATProtocolURI
        ) {
            
            self.cid = cid
            self.recordUri = recordUri
        }

        // Codable initializer
        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            do {
                
                self.cid = try container.decode(String.self, forKey: .cid)
                
            } catch {
                print("Decoding error for property 'cid': \(error)")
                throw error
            }
            do {
                
                self.recordUri = try container.decode(ATProtocolURI.self, forKey: .recordUri)
                
            } catch {
                print("Decoding error for property 'recordUri': \(error)")
                throw error
            }
        }

        public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(Self.typeIdentifier, forKey: .typeIdentifier)
            
            try container.encode(cid, forKey: .cid)
            
            
            try container.encode(recordUri, forKey: .recordUri)
            
        }

        public func hash(into hasher: inout Hasher) {
            hasher.combine(cid)
            hasher.combine(recordUri)
        }

        public func isEqual(to other: any ATProtocolValue) -> Bool {
            guard let other = other as? Self else { return false }
            
            if self.cid != other.cid {
                return false
            }
            
            
            if self.recordUri != other.recordUri {
                return false
            }
            
            return true
        }

        public static func == (lhs: Self, rhs: Self) -> Bool {
            return lhs.isEqual(to: rhs)
        }

        private enum CodingKeys: String, CodingKey {
            case typeIdentifier = "$type"
            case cid
            case recordUri
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
        
        public let blobs: [RecordBlob]
        
        
        // Standard public initializer
        public init(
            cursor: String? = nil, 
        
            blobs: [RecordBlob]
        ) {
            
            self.cursor = cursor
            
            self.blobs = blobs
            
        }
    }
    



}

extension ATProtoClient.Com.Atproto.Repo {
    /// Returns a list of missing blobs for the requesting account. Intended to be used in the account migration flow.
    public func listMissingBlobs(input: ComAtprotoRepoListMissingBlobs.Parameters) async throws -> (responseCode: Int, data: ComAtprotoRepoListMissingBlobs.Output?) {
        let endpoint = "/com.atproto.repo.listMissingBlobs"
        
        
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
        let decodedData = try? decoder.decode(ComAtprotoRepoListMissingBlobs.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
