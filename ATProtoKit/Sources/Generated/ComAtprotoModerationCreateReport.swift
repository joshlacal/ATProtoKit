import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.moderation.createReport


public struct ComAtprotoModerationCreateReport { 
    public static let typeIdentifier = "com.atproto.moderation.createReport"        
public struct Input: Codable {
            public let reasonType: ComAtprotoModerationDefs.ReasonType
            public let reason: String?
            public let subject: InputSubjectUnion

            // Standard public initializer
            public init(reasonType: ComAtprotoModerationDefs.ReasonType, reason: String? = nil, subject: InputSubjectUnion) {
                self.reasonType = reasonType
                self.reason = reason
                self.subject = subject
                
            }
        }        
public struct Output: Codable {
            public let id: Int
            public let reasonType: ComAtprotoModerationDefs.ReasonType
            public let reason: String?
            public let subject: OutputSubjectUnion
            public let reportedBy: String
            public let createdAt: ATProtocolDate
                                    
            // Standard public initializer
            public init(id: Int, reasonType: ComAtprotoModerationDefs.ReasonType, reason: String? = nil, subject: OutputSubjectUnion, reportedBy: String, createdAt: ATProtocolDate) {
                self.id = id
                self.reasonType = reasonType
                self.reason = reason
                self.subject = subject
                self.reportedBy = reportedBy
                self.createdAt = createdAt
                
            }

        }


            // Union Type
            
public enum InputSubjectUnion: Codable, ATProtocolCodable, ATProtocolValue {
                case comAtprotoAdminDefsRepoRef(ComAtprotoAdminDefs.RepoRef)
                case comAtprotoRepoStrongRef(ComAtprotoRepoStrongRef)
                case unexpected(JSONValue)

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    let typeValue = try container.decode(String.self, forKey: .type)
                    print("InputSubjectUnion decoding: \(typeValue)")

                    switch typeValue {
                    case "com.atproto.admin.defs#repoRef":
                        print("Decoding as com.atproto.admin.defs#repoRef")
                        let value = try ComAtprotoAdminDefs.RepoRef(from: decoder)
                        self = .comAtprotoAdminDefsRepoRef(value)
                    case "com.atproto.repo.strongRef":
                        print("Decoding as com.atproto.repo.strongRef")
                        let value = try ComAtprotoRepoStrongRef(from: decoder)
                        self = .comAtprotoRepoStrongRef(value)
                    default:
                        print("InputSubjectUnion decoding encountered an unexpected type: \(typeValue)")
                        let unknownValue = try JSONValue(from: decoder)
                        self = .unexpected(unknownValue)
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)

                    switch self {
                    case .comAtprotoAdminDefsRepoRef(let value):
                        print("Encoding com.atproto.admin.defs#repoRef")
                        try container.encode("com.atproto.admin.defs#repoRef", forKey: .type)
                        try value.encode(to: encoder)
                    case .comAtprotoRepoStrongRef(let value):
                        print("Encoding com.atproto.repo.strongRef")
                        try container.encode("com.atproto.repo.strongRef", forKey: .type)
                        try value.encode(to: encoder)
                    case .unexpected(let jsonValue):
                        print("InputSubjectUnion encoding unexpected value")
                        try jsonValue.encode(to: encoder)
                    }
                }

                public func hash(into hasher: inout Hasher) {
                    switch self {
                    case .comAtprotoAdminDefsRepoRef(let value):
                        hasher.combine("com.atproto.admin.defs#repoRef")
                        hasher.combine(value)
                    case .comAtprotoRepoStrongRef(let value):
                        hasher.combine("com.atproto.repo.strongRef")
                        hasher.combine(value)
                    case .unexpected(let jsonValue):
                        hasher.combine("unexpected")
                        hasher.combine(jsonValue)
                    }
                }

                private enum CodingKeys: String, CodingKey {
                    case type = "$type"
                }
                
                public func isEqual(to other: any ATProtocolValue) -> Bool {
                    guard let otherValue = other as? InputSubjectUnion else { return false }

                    switch (self, otherValue) {
                        case (.comAtprotoAdminDefsRepoRef(let selfValue), 
                            .comAtprotoAdminDefsRepoRef(let otherValue)):
                            return selfValue == otherValue
                        case (.comAtprotoRepoStrongRef(let selfValue), 
                            .comAtprotoRepoStrongRef(let otherValue)):
                            return selfValue == otherValue
                        case (.unexpected(let selfValue), .unexpected(let otherValue)):
                            return selfValue.isEqual(to: otherValue)
                        default:
                            return false
                    }
                }
            }

            // Union Type
            
public enum OutputSubjectUnion: Codable, ATProtocolCodable, ATProtocolValue {
                case comAtprotoAdminDefsRepoRef(ComAtprotoAdminDefs.RepoRef)
                case comAtprotoRepoStrongRef(ComAtprotoRepoStrongRef)
                case unexpected(JSONValue)

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    let typeValue = try container.decode(String.self, forKey: .type)
                    print("OutputSubjectUnion decoding: \(typeValue)")

                    switch typeValue {
                    case "com.atproto.admin.defs#repoRef":
                        print("Decoding as com.atproto.admin.defs#repoRef")
                        let value = try ComAtprotoAdminDefs.RepoRef(from: decoder)
                        self = .comAtprotoAdminDefsRepoRef(value)
                    case "com.atproto.repo.strongRef":
                        print("Decoding as com.atproto.repo.strongRef")
                        let value = try ComAtprotoRepoStrongRef(from: decoder)
                        self = .comAtprotoRepoStrongRef(value)
                    default:
                        print("OutputSubjectUnion decoding encountered an unexpected type: \(typeValue)")
                        let unknownValue = try JSONValue(from: decoder)
                        self = .unexpected(unknownValue)
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)

                    switch self {
                    case .comAtprotoAdminDefsRepoRef(let value):
                        print("Encoding com.atproto.admin.defs#repoRef")
                        try container.encode("com.atproto.admin.defs#repoRef", forKey: .type)
                        try value.encode(to: encoder)
                    case .comAtprotoRepoStrongRef(let value):
                        print("Encoding com.atproto.repo.strongRef")
                        try container.encode("com.atproto.repo.strongRef", forKey: .type)
                        try value.encode(to: encoder)
                    case .unexpected(let jsonValue):
                        print("OutputSubjectUnion encoding unexpected value")
                        try jsonValue.encode(to: encoder)
                    }
                }

                public func hash(into hasher: inout Hasher) {
                    switch self {
                    case .comAtprotoAdminDefsRepoRef(let value):
                        hasher.combine("com.atproto.admin.defs#repoRef")
                        hasher.combine(value)
                    case .comAtprotoRepoStrongRef(let value):
                        hasher.combine("com.atproto.repo.strongRef")
                        hasher.combine(value)
                    case .unexpected(let jsonValue):
                        hasher.combine("unexpected")
                        hasher.combine(jsonValue)
                    }
                }

                private enum CodingKeys: String, CodingKey {
                    case type = "$type"
                }
                
                public func isEqual(to other: any ATProtocolValue) -> Bool {
                    guard let otherValue = other as? OutputSubjectUnion else { return false }

                    switch (self, otherValue) {
                        case (.comAtprotoAdminDefsRepoRef(let selfValue), 
                            .comAtprotoAdminDefsRepoRef(let otherValue)):
                            return selfValue == otherValue
                        case (.comAtprotoRepoStrongRef(let selfValue), 
                            .comAtprotoRepoStrongRef(let otherValue)):
                            return selfValue == otherValue
                        case (.unexpected(let selfValue), .unexpected(let otherValue)):
                            return selfValue.isEqual(to: otherValue)
                        default:
                            return false
                    }
                }
            }


}
extension ATProtoClient.Com.Atproto.Moderation {
    /// Report a repo or a record.
    public func createReport(input: ComAtprotoModerationCreateReport.Input) async throws -> (responseCode: Int, data: ComAtprotoModerationCreateReport.Output?) {
        let endpoint = "/com.atproto.moderation.createReport"
        
        let requestData = try JSONEncoder().encode(input)
        
        
        // Perform the network request
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "POST", body: requestData)

        
        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(ComAtprotoModerationCreateReport.Output.self, from: responseData)
        return (responseCode, decodedData)
        
    }
}
                           
