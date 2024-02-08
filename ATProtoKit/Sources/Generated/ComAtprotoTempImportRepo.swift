import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.temp.importRepo


public struct ComAtprotoTempImportRepo { 
    public static let typeIdentifier = "com.atproto.temp.importRepo"    
    
public struct Output: Codable { 
        
        
        // Standard public initializer
        public init() {
            
        }
    }
    



}
extension ATProtoClient.Com.Atproto.Temp {
    /// Gets the did's repo, optionally catching up from a specific revision.
    public func importRepo() async throws -> (responseCode: Int, data: ComAtprotoTempImportRepo.Output?) {
        let endpoint = "/com.atproto.temp.importRepo"
        
        let requestData: Data? = nil
        
        
        // Perform the network request
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "POST", body: requestData)

        
        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(ComAtprotoTempImportRepo.Output.self, from: responseData)
        return (responseCode, decodedData)
        
    }
}
                           
