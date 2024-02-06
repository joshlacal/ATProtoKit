import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.temp.transferAccount


public struct ComAtprotoTempTransferAccount { 
    public static let typeIdentifier = "com.atproto.temp.transferAccount"        
public struct Input: Codable {
            public let handle: String
            public let did: String
            public let plcOp: JSONValue

            // Standard public initializer
            public init(handle: String, did: String, plcOp: JSONValue) {
                self.handle = handle
                self.did = did
                self.plcOp = plcOp
                
            }
        }        
public struct Output: Codable {
            public let accessJwt: String
            public let refreshJwt: String
            public let handle: String
            public let did: String
                                    
            // Standard public initializer
            public init(accessJwt: String, refreshJwt: String, handle: String, did: String) {
                self.accessJwt = accessJwt
                self.refreshJwt = refreshJwt
                self.handle = handle
                self.did = did
                
            }

        }        
public enum Error: String, Swift.Error, CustomStringConvertible {
                case invalidHandle = "InvalidHandle."
                case invalidPassword = "InvalidPassword."
                case invalidInviteCode = "InvalidInviteCode."
                case handleNotAvailable = "HandleNotAvailable."
                case unsupportedDomain = "UnsupportedDomain."
                case unresolvableDid = "UnresolvableDid."
                case incompatibleDidDoc = "IncompatibleDidDoc."
            public var description: String {
                return self.rawValue
            }
        }



}
extension ATProtoClient.Com.Atproto.Temp {
    /// Transfer an account.
    public func transferAccount(input: ComAtprotoTempTransferAccount.Input) async throws -> (responseCode: Int, data: ComAtprotoTempTransferAccount.Output?) {
        let endpoint = "/com.atproto.temp.transferAccount"
        
        let requestData = try JSONEncoder().encode(input)
        
        
        // Perform the network request
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "POST", body: requestData)

        
        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(ComAtprotoTempTransferAccount.Output.self, from: responseData)
        return (responseCode, decodedData)
        
    }
}
                           
