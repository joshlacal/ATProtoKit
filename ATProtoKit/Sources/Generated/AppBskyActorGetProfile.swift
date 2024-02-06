import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.actor.getProfile


public struct AppBskyActorGetProfile { 
    public static let typeIdentifier = "app.bsky.actor.getProfile"        
public struct Parameters: Parametrizable {
            public let actor: String
            
            public init(
                actor: String
                ) {
                self.actor = actor
                
            }
        }        
public struct Output: Codable {
            public let data: AppBskyActorDefs.ProfileViewDetailed
                                    
            // Standard public initializer
            public init(data: AppBskyActorDefs.ProfileViewDetailed) {
                self.data = data
                
            }

        }



}

extension ATProtoClient.App.Bsky.Actor {
    /// Get detailed profile view of an actor. 
    public func getProfile(input: AppBskyActorGetProfile.Parameters) async throws -> (responseCode: Int, data: AppBskyActorGetProfile.Output?) {
        let endpoint = "/app.bsky.actor.getProfile"
        
        
        // Convert input to query items
        let queryItems = input.asQueryItems()
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "GET", queryItems: queryItems)
        

        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(AppBskyActorGetProfile.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
