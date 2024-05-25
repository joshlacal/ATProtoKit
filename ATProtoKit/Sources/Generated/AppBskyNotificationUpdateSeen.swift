import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.notification.updateSeen


public struct AppBskyNotificationUpdateSeen { 

    public static let typeIdentifier = "app.bsky.notification.updateSeen"        
public struct Input: ATProtocolCodable {
            public let seenAt: ATProtocolDate

            // Standard public initializer
            public init(seenAt: ATProtocolDate) {
                self.seenAt = seenAt
                
            }
        }



}
extension ATProtoClient.App.Bsky.Notification {
    /// Notify server that the requesting account has seen notifications. Requires auth.
    public func updateSeen(input: AppBskyNotificationUpdateSeen.Input, duringInitialSetup: Bool = false) async throws -> Int {
        let endpoint = "/app.bsky.notification.updateSeen"
        
        
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
                           
