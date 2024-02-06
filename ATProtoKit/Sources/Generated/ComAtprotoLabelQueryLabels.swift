import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.label.queryLabels


public struct ComAtprotoLabelQueryLabels { 
    public static let typeIdentifier = "com.atproto.label.queryLabels"        
public struct Parameters: Parametrizable {
            public let uriPatterns: [String]
            public let sources: [String]?
            public let limit: Int?
            public let cursor: String?
            
            public init(
                uriPatterns: [String], 
                sources: [String]? = nil, 
                limit: Int? = nil, 
                cursor: String? = nil
                ) {
                self.uriPatterns = uriPatterns
                self.sources = sources
                self.limit = limit
                self.cursor = cursor
                
            }
        }        
public struct Output: Codable {
            public let cursor: String?
            public let labels: [ComAtprotoLabelDefs.Label]
                                    
            // Standard public initializer
            public init(cursor: String? = nil, labels: [ComAtprotoLabelDefs.Label]) {
                self.cursor = cursor
                self.labels = labels
                
            }

        }



}

extension ATProtoClient.Com.Atproto.Label {
    /// Find labels relevant to the provided URI patterns. 
    public func queryLabels(input: ComAtprotoLabelQueryLabels.Parameters) async throws -> (responseCode: Int, data: ComAtprotoLabelQueryLabels.Output?) {
        let endpoint = "/com.atproto.label.queryLabels"
        
        
        // Convert input to query items
        let queryItems = input.asQueryItems()
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "GET", queryItems: queryItems)
        

        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(ComAtprotoLabelQueryLabels.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
