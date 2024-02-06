import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.notification.registerPush


public struct AppBskyNotificationRegisterPush { 
    public static let typeIdentifier = "app.bsky.notification.registerPush"        
public struct Input: Codable {
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
    /// Register for push notifications with a service.
    public func registerPush(input: AppBskyNotificationRegisterPush.Input) async throws -> Int {
        let endpoint = "/app.bsky.notification.registerPush"
        
        let requestData = try JSONEncoder().encode(input)
        
        
        // Perform the network request
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "POST", body: requestData)

        
        // Return only the response code if no output type is expected
        return responseCode
        
    }
}
                           
