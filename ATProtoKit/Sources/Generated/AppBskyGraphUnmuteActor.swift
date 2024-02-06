import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.graph.unmuteActor


public struct AppBskyGraphUnmuteActor { 
    public static let typeIdentifier = "app.bsky.graph.unmuteActor"        
public struct Input: Codable {
            public let actor: String

            // Standard public initializer
            public init(actor: String) {
                self.actor = actor
                
            }
        }



}
extension ATProtoClient.App.Bsky.Graph {
    /// Unmute an actor by DID or handle.
    public func unmuteActor(input: AppBskyGraphUnmuteActor.Input) async throws -> Int {
        let endpoint = "/app.bsky.graph.unmuteActor"
        
        let requestData = try JSONEncoder().encode(input)
        
        
        // Perform the network request
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "POST", body: requestData)

        
        // Return only the response code if no output type is expected
        return responseCode
        
    }
}
                           
