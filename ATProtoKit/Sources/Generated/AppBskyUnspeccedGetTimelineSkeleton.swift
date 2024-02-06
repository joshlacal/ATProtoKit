import Foundation
import ZippyJSON
                            
// lexicon: 1, id: app.bsky.unspecced.getTimelineSkeleton


public struct AppBskyUnspeccedGetTimelineSkeleton { 
    public static let typeIdentifier = "app.bsky.unspecced.getTimelineSkeleton"        
public struct Parameters: Parametrizable {
            public let limit: Int?
            public let cursor: String?
            
            public init(
                limit: Int? = nil, 
                cursor: String? = nil
                ) {
                self.limit = limit
                self.cursor = cursor
                
            }
        }        
public struct Output: Codable {
            public let cursor: String?
            public let feed: [AppBskyFeedDefs.SkeletonFeedPost]
                                    
            // Standard public initializer
            public init(cursor: String? = nil, feed: [AppBskyFeedDefs.SkeletonFeedPost]) {
                self.cursor = cursor
                self.feed = feed
                
            }

        }        
public enum Error: String, Swift.Error, CustomStringConvertible {
                case unknownFeed = "UnknownFeed."
            public var description: String {
                return self.rawValue
            }
        }



}

extension ATProtoClient.App.Bsky.Unspecced {
    /// DEPRECATED: a skeleton of a timeline. Unspecced and will be unavailable soon. 
    public func getTimelineSkeleton(input: AppBskyUnspeccedGetTimelineSkeleton.Parameters) async throws -> (responseCode: Int, data: AppBskyUnspeccedGetTimelineSkeleton.Output?) {
        let endpoint = "/app.bsky.unspecced.getTimelineSkeleton"
        
        
        // Convert input to query items
        let queryItems = input.asQueryItems()
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "GET", queryItems: queryItems)
        

        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(AppBskyUnspeccedGetTimelineSkeleton.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
