import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.repo.uploadBlob


public struct ComAtprotoRepoUploadBlob { 
    public static let typeIdentifier = "com.atproto.repo.uploadBlob"    
    
public struct Output: ATProtocolCodable { 
        
        public let blob: Blob
        
        
        // Standard public initializer
        public init(
            blob: Blob
        ) {
            
            self.blob = blob
            
        }
    }
    



}
extension ATProtoClient.Com.Atproto.Repo {
    /// Upload a new blob, to be referenced from a repository record. The blob will be deleted if it is not referenced within a time window (eg, minutes). Blob restrictions (mimetype, size, etc) are enforced when the reference is created. Requires auth, implemented by PDS.
    public func uploadBlob() async throws -> (responseCode: Int, data: ComAtprotoRepoUploadBlob.Output?) {
        let endpoint = "/com.atproto.repo.uploadBlob"
        
        
        let requestData: Data? = nil
        
        
        let urlRequest = try await networkManager.createURLRequest(
            endpoint: endpoint, 
            method: "POST", 
            headers: ["Content-Type": "application/json"], 
            body: requestData,
            queryItems: nil
        )
        
        let (responseData, response) = try await networkManager.performRequest(urlRequest, retryCount: 3, duringInitialSetup: false)
        let responseCode = response.statusCode

        
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(ComAtprotoRepoUploadBlob.Output.self, from: responseData)
        return (responseCode, decodedData)
        
    }
}
                           
