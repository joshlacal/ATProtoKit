import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.temp.requestPhoneVerification


public struct ComAtprotoTempRequestPhoneVerification { 

    public static let typeIdentifier = "com.atproto.temp.requestPhoneVerification"        
public struct Input: ATProtocolCodable {
            public let phoneNumber: String

            // Standard public initializer
            public init(phoneNumber: String) {
                self.phoneNumber = phoneNumber
                
            }
        }



}
extension ATProtoClient.Com.Atproto.Temp {
    /// Request a verification code to be sent to the supplied phone number
    
    public func requestPhoneVerification(input: ComAtprotoTempRequestPhoneVerification.Input, duringInitialSetup: Bool = false) async throws -> Int {
        let endpoint = "/com.atproto.temp.requestPhoneVerification"
        
        
        let requestData = try JSONEncoder().encode(input)
        
        
        let urlRequest = try await networkManager.createURLRequest(
            endpoint: endpoint, 
            method: "POST", 
            headers: ["Content-Type": "application/json"], 
            body: requestData,
            queryItems: nil
        )
    
        
        let (responseData, response) = try await networkManager.performRequest(urlRequest, retryCount: 0, duringInitialSetup: duringInitialSetup)
        let responseCode = response.statusCode
        
        return responseCode
        
    }
}
                           
