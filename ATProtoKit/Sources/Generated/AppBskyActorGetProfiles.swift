import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.actor.getProfiles


public struct AppBskyActorGetProfiles { 
    public static let typeIdentifier = "app.bsky.actor.getProfiles"        
public struct Parameters: Parametrizable {
            public let actors: [String]
            
            public init(
                actors: [String]
                ) {
                self.actors = actors
                
            }
        }    
    
public struct Output: Codable { 
        
        public let profiles: [AppBskyActorDefs.ProfileViewDetailed]
        
        
        // Standard public initializer
        public init(
            profiles: [AppBskyActorDefs.ProfileViewDetailed]
        ) {
            
            self.profiles = profiles
            
        }
    }
    



}

extension ATProtoClient.App.Bsky.Actor {
    /// Get detailed profile views of multiple actors. 
    public func getProfiles(input: AppBskyActorGetProfiles.Parameters) async throws -> (responseCode: Int, data: AppBskyActorGetProfiles.Output?) {
        let endpoint = "/app.bsky.actor.getProfiles"
        
        
        // Convert input to query items
        let queryItems = input.asQueryItems()
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "GET", queryItems: queryItems)
        

        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(AppBskyActorGetProfiles.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
