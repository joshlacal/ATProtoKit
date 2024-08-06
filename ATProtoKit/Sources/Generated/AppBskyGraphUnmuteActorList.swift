import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.graph.unmuteActorList


public struct AppBskyGraphUnmuteActorList { 

    public static let typeIdentifier = "app.bsky.graph.unmuteActorList"        
public struct Input: ATProtocolCodable {
            public let list: ATProtocolURI

            // Standard public initializer
            public init(list: ATProtocolURI) {
                self.list = list
                
            }
        }



}
extension ATProtoClient.App.Bsky.Graph {
    /// Unmutes the specified list of accounts. Requires auth.
    
    public func unmuteActorList(input: AppBskyGraphUnmuteActorList.Input, duringInitialSetup: Bool = false) async throws -> Int {
        let endpoint = "/app.bsky.graph.unmuteActorList"
        
        
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
                           
