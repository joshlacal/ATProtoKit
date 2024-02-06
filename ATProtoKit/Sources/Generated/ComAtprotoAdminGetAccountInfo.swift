import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.admin.getAccountInfo


public struct ComAtprotoAdminGetAccountInfo { 
    public static let typeIdentifier = "com.atproto.admin.getAccountInfo"        
public struct Parameters: Parametrizable {
            public let did: String
            
            public init(
                did: String
                ) {
                self.did = did
                
            }
        }        
public struct Output: Codable {
            public let data: ComAtprotoAdminDefs.AccountView
                                    
            // Standard public initializer
            public init(data: ComAtprotoAdminDefs.AccountView) {
                self.data = data
                
            }

        }



}

extension ATProtoClient.Com.Atproto.Admin {
    /// Get details about an account. 
    public func getAccountInfo(input: ComAtprotoAdminGetAccountInfo.Parameters) async throws -> (responseCode: Int, data: ComAtprotoAdminGetAccountInfo.Output?) {
        let endpoint = "/com.atproto.admin.getAccountInfo"
        
        
        // Convert input to query items
        let queryItems = input.asQueryItems()
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "GET", queryItems: queryItems)
        

        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(ComAtprotoAdminGetAccountInfo.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
