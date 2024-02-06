import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.notification.getUnreadCount


public struct AppBskyNotificationGetUnreadCount { 
    public static let typeIdentifier = "app.bsky.notification.getUnreadCount"        
public struct Parameters: Parametrizable {
            public let seenAt: ATProtocolDate?
            
            public init(
                seenAt: ATProtocolDate? = nil
                ) {
                self.seenAt = seenAt
                
            }
        }        
public struct Output: Codable {
            public let count: Int
                                    
            // Standard public initializer
            public init(count: Int) {
                self.count = count
                
            }

        }



}

extension ATProtoClient.App.Bsky.Notification {
    /// Get the count of unread notifications. 
    public func getUnreadCount(input: AppBskyNotificationGetUnreadCount.Parameters) async throws -> (responseCode: Int, data: AppBskyNotificationGetUnreadCount.Output?) {
        let endpoint = "/app.bsky.notification.getUnreadCount"
        
        
        // Convert input to query items
        let queryItems = input.asQueryItems()
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "GET", queryItems: queryItems)
        

        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(AppBskyNotificationGetUnreadCount.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
