import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.graph.muteActor


public struct AppBskyGraphMuteActor { 
    public static let typeIdentifier = "app.bsky.graph.muteActor"        
public struct Input: ATProtocolCodable {
            public let actor: String

            // Standard public initializer
            public init(actor: String) {
                self.actor = actor
                
            }
        }



}
extension ATProtoClient.App.Bsky.Graph {
    /// Creates a mute relationship for the specified account. Mutes are private in Bluesky. Requires auth.
    public func muteActor(input: AppBskyGraphMuteActor.Input) async throws -> Int {
        let endpoint = "/app.bsky.graph.muteActor"
        
        
        let requestData = try JSONEncoder().encode(input)
        
        
        let urlRequest = try await networkManager.createURLRequest(
            endpoint: endpoint, 
            method: "POST", 
            headers: ["Content-Type": "application/json"], 
            body: requestData,
            queryItems: nil
        )
        
        let (responseData, response) = try await networkManager.performRequest(urlRequest, retryCount: 3, duringInitialSetup: false)
        let responseCode = response.statusCode

        
        // Return only the response code if no output type is expected
        return responseCode
        
    }
}
                           
