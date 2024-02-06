import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.actor.putPreferences


public struct AppBskyActorPutPreferences { 
    public static let typeIdentifier = "app.bsky.actor.putPreferences"        
public struct Input: Codable {
            public let preferences: AppBskyActorDefs.Preferences

            // Standard public initializer
            public init(preferences: AppBskyActorDefs.Preferences) {
                self.preferences = preferences
                
            }
        }



}
extension ATProtoClient.App.Bsky.Actor {
    /// Set the private preferences attached to the account.
    public func putPreferences(input: AppBskyActorPutPreferences.Input) async throws -> Int {
        let endpoint = "/app.bsky.actor.putPreferences"
        
        let requestData = try JSONEncoder().encode(input)
        
        
        // Perform the network request
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "POST", body: requestData)

        
        // Return only the response code if no output type is expected
        return responseCode
        
    }
}
                           
