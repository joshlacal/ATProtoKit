import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.notification.registerPush


public struct AppBskyNotificationRegisterPush { 
    public static let typeIdentifier = "app.bsky.notification.registerPush"        
public struct Input: ATProtocolCodable {
            public let serviceDid: String
            public let token: String
            public let platform: String
            public let appId: String

            // Standard public initializer
            public init(serviceDid: String, token: String, platform: String, appId: String) {
                self.serviceDid = serviceDid
                self.token = token
                self.platform = platform
                self.appId = appId
                
            }
        }



}
extension ATProtoClient.App.Bsky.Notification {
    /// Register to receive push notifications, via a specified service, for the requesting account. Requires auth.
    public func registerPush(input: AppBskyNotificationRegisterPush.Input) async throws -> Int {
        let endpoint = "/app.bsky.notification.registerPush"
        
        
        let requestData = try JSONEncoder().encode(input)
        
        
        let urlRequest = try await networkManager.createURLRequest(
            endpoint: endpoint, 
            method: "POST", 
            headers: ["Content-Type": "application/json"], 
            body: requestData,
            queryItems: nil
        )
        
        let (responseData, response) = try await networkManager.performRequest(urlRequest, retryCount: 3, duringInitialSetup: false)
        let responseCode = response.statusCode

        
        // Return only the response code if no output type is expected
        return responseCode
        
    }
}
                           
