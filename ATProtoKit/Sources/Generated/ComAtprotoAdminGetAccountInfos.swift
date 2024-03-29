import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.admin.getAccountInfos


public struct ComAtprotoAdminGetAccountInfos { 
    public static let typeIdentifier = "com.atproto.admin.getAccountInfos"        
public struct Parameters: Parametrizable {
            public let dids: [String]
            
            public init(
                dids: [String]
                ) {
                self.dids = dids
                
            }
        }    
    
public struct Output: Codable { 
        
        public let infos: [ComAtprotoAdminDefs.AccountView]
        
        
        // Standard public initializer
        public init(
            infos: [ComAtprotoAdminDefs.AccountView]
        ) {
            
            self.infos = infos
            
        }
    }
    



}

extension ATProtoClient.Com.Atproto.Admin {
    /// Get details about some accounts. 
    public func getAccountInfos(input: ComAtprotoAdminGetAccountInfos.Parameters) async throws -> (responseCode: Int, data: ComAtprotoAdminGetAccountInfos.Output?) {
        let endpoint = "/com.atproto.admin.getAccountInfos"
        
        
        // Convert input to query items
        let queryItems = input.asQueryItems()
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "GET", queryItems: queryItems)
        

        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(ComAtprotoAdminGetAccountInfos.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
