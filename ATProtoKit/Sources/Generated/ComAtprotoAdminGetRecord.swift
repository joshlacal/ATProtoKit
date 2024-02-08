import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.admin.getRecord


public struct ComAtprotoAdminGetRecord { 
    public static let typeIdentifier = "com.atproto.admin.getRecord"        
public struct Parameters: Parametrizable {
            public let uri: ATProtocolURI
            public let cid: String?
            
            public init(
                uri: ATProtocolURI, 
                cid: String? = nil
                ) {
                self.uri = uri
                self.cid = cid
                
            }
        }    
    public typealias Output = ComAtprotoAdminDefs.RecordViewDetail
            
public enum Error: String, Swift.Error, CustomStringConvertible {
                case recordNotFound = "RecordNotFound."
            public var description: String {
                return self.rawValue
            }
        }



}

extension ATProtoClient.Com.Atproto.Admin {
    /// Get details about a record. 
    public func getRecord(input: ComAtprotoAdminGetRecord.Parameters) async throws -> (responseCode: Int, data: ComAtprotoAdminGetRecord.Output?) {
        let endpoint = "/com.atproto.admin.getRecord"
        
        
        // Convert input to query items
        let queryItems = input.asQueryItems()
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "GET", queryItems: queryItems)
        

        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(ComAtprotoAdminGetRecord.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
