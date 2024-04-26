import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.graph.muteActorList


public struct AppBskyGraphMuteActorList { 
    public static let typeIdentifier = "app.bsky.graph.muteActorList"        
public struct Input: ATProtocolCodable {
            public let list: ATProtocolURI

            // Standard public initializer
            public init(list: ATProtocolURI) {
                self.list = list
                
            }
        }



}
extension ATProtoClient.App.Bsky.Graph {
    /// Creates a mute relationship for the specified list of accounts. Mutes are private in Bluesky. Requires auth.
    public func muteActorList(input: AppBskyGraphMuteActorList.Input) async throws -> Int {
        let endpoint = "/app.bsky.graph.muteActorList"
        
        
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
                           
