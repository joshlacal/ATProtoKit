import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.admin.updateSubjectStatus


public struct ComAtprotoAdminUpdateSubjectStatus { 
    public static let typeIdentifier = "com.atproto.admin.updateSubjectStatus"        
public struct Input: Codable {
            public let subject: InputSubjectUnion
            public let takedown: ComAtprotoAdminDefs.StatusAttr?

            // Standard public initializer
            public init(subject: InputSubjectUnion, takedown: ComAtprotoAdminDefs.StatusAttr? = nil) {
                self.subject = subject
                self.takedown = takedown
                
            }
        }        
public struct Output: Codable {
            public let subject: OutputSubjectUnion
            public let takedown: ComAtprotoAdminDefs.StatusAttr?
                                    
            // Standard public initializer
            public init(subject: OutputSubjectUnion, takedown: ComAtprotoAdminDefs.StatusAttr? = nil) {
                self.subject = subject
                self.takedown = takedown
                
            }

        }


            // Union Type
            
public enum InputSubjectUnion: Codable, ATProtocolCodable, ATProtocolValue {
                case comAtprotoAdminDefsRepoRef(ComAtprotoAdminDefs.RepoRef)
                case comAtprotoRepoStrongRef(ComAtprotoRepoStrongRef)
                case comAtprotoAdminDefsRepoBlobRef(ComAtprotoAdminDefs.RepoBlobRef)
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
                    case "com.atproto.admin.defs#repoBlobRef":
                        print("Decoding as com.atproto.admin.defs#repoBlobRef")
                        let value = try ComAtprotoAdminDefs.RepoBlobRef(from: decoder)
                        self = .comAtprotoAdminDefsRepoBlobRef(value)
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
                    case .comAtprotoAdminDefsRepoBlobRef(let value):
                        print("Encoding com.atproto.admin.defs#repoBlobRef")
                        try container.encode("com.atproto.admin.defs#repoBlobRef", forKey: .type)
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
                    case .comAtprotoAdminDefsRepoBlobRef(let value):
                        hasher.combine("com.atproto.admin.defs#repoBlobRef")
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
                        case (.comAtprotoAdminDefsRepoBlobRef(let selfValue), 
                            .comAtprotoAdminDefsRepoBlobRef(let otherValue)):
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
                case comAtprotoAdminDefsRepoBlobRef(ComAtprotoAdminDefs.RepoBlobRef)
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
                    case "com.atproto.admin.defs#repoBlobRef":
                        print("Decoding as com.atproto.admin.defs#repoBlobRef")
                        let value = try ComAtprotoAdminDefs.RepoBlobRef(from: decoder)
                        self = .comAtprotoAdminDefsRepoBlobRef(value)
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
                    case .comAtprotoAdminDefsRepoBlobRef(let value):
                        print("Encoding com.atproto.admin.defs#repoBlobRef")
                        try container.encode("com.atproto.admin.defs#repoBlobRef", forKey: .type)
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
                    case .comAtprotoAdminDefsRepoBlobRef(let value):
                        hasher.combine("com.atproto.admin.defs#repoBlobRef")
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
                        case (.comAtprotoAdminDefsRepoBlobRef(let selfValue), 
                            .comAtprotoAdminDefsRepoBlobRef(let otherValue)):
                            return selfValue == otherValue
                        case (.unexpected(let selfValue), .unexpected(let otherValue)):
                            return selfValue.isEqual(to: otherValue)
                        default:
                            return false
                    }
                }
            }


}
extension ATProtoClient.Com.Atproto.Admin {
    /// Update the service-specific admin status of a subject (account, record, or blob).
    public func updateSubjectStatus(input: ComAtprotoAdminUpdateSubjectStatus.Input) async throws -> (responseCode: Int, data: ComAtprotoAdminUpdateSubjectStatus.Output?) {
        let endpoint = "/com.atproto.admin.updateSubjectStatus"
        
        let requestData = try JSONEncoder().encode(input)
        
        
        // Perform the network request
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "POST", body: requestData)

        
        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(ComAtprotoAdminUpdateSubjectStatus.Output.self, from: responseData)
        return (responseCode, decodedData)
        
    }
}
                           
