import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.repo.uploadBlob


public struct ComAtprotoRepoUploadBlob { 
    public static let typeIdentifier = "com.atproto.repo.uploadBlob"        
public struct Output: Codable {
            public let blob: Blob
                                    
            // Standard public initializer
            public init(blob: Blob) {
                self.blob = blob
                
            }

        }



}
extension ATProtoClient.Com.Atproto.Repo {
    /// Upload a new blob to be added to repo in a later request.
    public func uploadBlob() async throws -> (responseCode: Int, data: ComAtprotoRepoUploadBlob.Output?) {
        let endpoint = "/com.atproto.repo.uploadBlob"
        
        let requestData: Data? = nil
        
        
        // Perform the network request
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "POST", body: requestData)

        
        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(ComAtprotoRepoUploadBlob.Output.self, from: responseData)
        return (responseCode, decodedData)
        
    }
}
                           
