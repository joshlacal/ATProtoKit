import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.notification.putPreferences


public struct AppBskyNotificationPutPreferences { 

    public static let typeIdentifier = "app.bsky.notification.putPreferences"        
public struct Input: ATProtocolCodable {
            public let priority: Bool

            // Standard public initializer
            public init(priority: Bool) {
                self.priority = priority
                
            }
        }



}
extension ATProtoClient.App.Bsky.Notification {
    /// Set notification-related preferences for an account. Requires auth.
    
    public func putPreferences(input: AppBskyNotificationPutPreferences.Input, duringInitialSetup: Bool = false) async throws -> Int {
        let endpoint = "/app.bsky.notification.putPreferences"
        
        
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
                           
