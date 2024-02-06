import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.graph.unmuteActorList


public struct AppBskyGraphUnmuteActorList { 
    public static let typeIdentifier = "app.bsky.graph.unmuteActorList"        
public struct Input: Codable {
            public let list: ATProtocolURI

            // Standard public initializer
            public init(list: ATProtocolURI) {
                self.list = list
                
            }
        }



}
extension ATProtoClient.App.Bsky.Graph {
    /// Unmute a list of actors.
    public func unmuteActorList(input: AppBskyGraphUnmuteActorList.Input) async throws -> Int {
        let endpoint = "/app.bsky.graph.unmuteActorList"
        
        let requestData = try JSONEncoder().encode(input)
        
        
        // Perform the network request
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "POST", body: requestData)

        
        // Return only the response code if no output type is expected
        return responseCode
        
    }
}
                           
