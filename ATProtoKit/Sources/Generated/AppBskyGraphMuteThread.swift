import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.graph.muteThread


public struct AppBskyGraphMuteThread { 

    public static let typeIdentifier = "app.bsky.graph.muteThread"        
public struct Input: ATProtocolCodable {
            public let root: ATProtocolURI

            // Standard public initializer
            public init(root: ATProtocolURI) {
                self.root = root
                
            }
        }



}
extension ATProtoClient.App.Bsky.Graph {
    /// Mutes a thread preventing notifications from the thread and any of its children. Mutes are private in Bluesky. Requires auth.
    
    public func muteThread(input: AppBskyGraphMuteThread.Input, duringInitialSetup: Bool = false) async throws -> Int {
        let endpoint = "/app.bsky.graph.muteThread"
        
        
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
                           
