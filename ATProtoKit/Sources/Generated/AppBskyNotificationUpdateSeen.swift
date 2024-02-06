import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.notification.updateSeen


public struct AppBskyNotificationUpdateSeen { 
    public static let typeIdentifier = "app.bsky.notification.updateSeen"        
public struct Input: Codable {
            public let seenAt: ATProtocolDate

            // Standard public initializer
            public init(seenAt: ATProtocolDate) {
                self.seenAt = seenAt
                
            }
        }



}
extension ATProtoClient.App.Bsky.Notification {
    /// Notify server that the user has seen notifications.
    public func updateSeen(input: AppBskyNotificationUpdateSeen.Input) async throws -> Int {
        let endpoint = "/app.bsky.notification.updateSeen"
        
        let requestData = try JSONEncoder().encode(input)
        
        
        // Perform the network request
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "POST", body: requestData)

        
        // Return only the response code if no output type is expected
        return responseCode
        
    }
}
                           
