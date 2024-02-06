import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.temp.fetchLabels


public struct ComAtprotoTempFetchLabels { 
    public static let typeIdentifier = "com.atproto.temp.fetchLabels"        
public struct Parameters: Parametrizable {
            public let since: Int?
            public let limit: Int?
            
            public init(
                since: Int? = nil, 
                limit: Int? = nil
                ) {
                self.since = since
                self.limit = limit
                
            }
        }        
public struct Output: Codable {
            public let labels: [ComAtprotoLabelDefs.Label]
                                    
            // Standard public initializer
            public init(labels: [ComAtprotoLabelDefs.Label]) {
                self.labels = labels
                
            }

        }



}

extension ATProtoClient.Com.Atproto.Temp {
    /// Fetch all labels from a labeler created after a certain date. 
    public func fetchLabels(input: ComAtprotoTempFetchLabels.Parameters) async throws -> (responseCode: Int, data: ComAtprotoTempFetchLabels.Output?) {
        let endpoint = "/com.atproto.temp.fetchLabels"
        
        
        // Convert input to query items
        let queryItems = input.asQueryItems()
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "GET", queryItems: queryItems)
        

        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(ComAtprotoTempFetchLabels.Output.self, from: responseData)
        return (responseCode, decodedData)
    }
}                           
