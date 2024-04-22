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
    
public struct Output: ATProtocolCodable { 
        
        public let count: Int
        
        
        // Standard public initializer
        public init(
            count: Int
        ) {
            
            self.count = count
            
        }
    }
    



}

extension ATProtoClient.App.Bsky.Notification {
    /// Count the number of unread notifications for the requesting account. Requires auth.
    public func getUnreadCount(input: AppBskyNotificationGetUnreadCount.Parameters) async throws -> (responseCode: Int, data: AppBskyNotificationGetUnreadCount.Output?) {
        let endpoint = "/app.bsky.notification.getUnreadCount"
        
        
        let queryItems = input.asQueryItems()
        let urlRequest = try await networkManager.createURLRequest(
            endpoint: endpoint, 
            method: "GET", 
            headers: [:], // Typically, GET requests do not have a body
            body: nil, 
            queryItems: queryItems
        )
        
        
        let (responseData, response) = try await networkManager.performRequest(urlRequest)
        let responseCode = response.statusCode

        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(AppBskyNotificationGetUnreadCount.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
