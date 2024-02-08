import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.actor.getPreferences


public struct AppBskyActorGetPreferences { 
    public static let typeIdentifier = "app.bsky.actor.getPreferences"        
public struct Parameters: Parametrizable {
            
            public init(
                ) {
                
            }
        }    
    
public struct Output: Codable { 
        
        public let preferences: AppBskyActorDefs.Preferences
        
        
        // Standard public initializer
        public init(
            preferences: AppBskyActorDefs.Preferences
        ) {
            
            self.preferences = preferences
            
        }
    }
    



}

extension ATProtoClient.App.Bsky.Actor {
    /// Get private preferences attached to the account. 
    public func getPreferences(input: AppBskyActorGetPreferences.Parameters) async throws -> (responseCode: Int, data: AppBskyActorGetPreferences.Output?) {
        let endpoint = "/app.bsky.actor.getPreferences"
        
        
        // Convert input to query items
        let queryItems = input.asQueryItems()
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "GET", queryItems: queryItems)
        

        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(AppBskyActorGetPreferences.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
