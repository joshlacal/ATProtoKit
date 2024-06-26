import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.moderation.createReport


public struct ComAtprotoModerationCreateReport { 

    public static let typeIdentifier = "com.atproto.moderation.createReport"        
public struct Input: ATProtocolCodable {
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
    
public struct Output: ATProtocolCodable { 
        
        public let id: Int
        
        public let reasonType: ComAtprotoModerationDefs.ReasonType
        
        public let reason: String?
        
        public let subject: OutputSubjectUnion
        
        public let reportedBy: String
        
        public let createdAt: ATProtocolDate
        
        
        // Standard public initializer
        public init(
            id: Int, 
        
            reasonType: ComAtprotoModerationDefs.ReasonType, 
        
            reason: String? = nil, 
        
            subject: OutputSubjectUnion, 
        
            reportedBy: String, 
        
            createdAt: ATProtocolDate
        ) {
            
            self.id = id
            
            self.reasonType = reasonType
            
            self.reason = reason
            
            self.subject = subject
            
            self.reportedBy = reportedBy
            
            self.createdAt = createdAt
            
        }
    }
    





public enum InputSubjectUnion: Codable, ATProtocolCodable, ATProtocolValue {
    case comAtprotoAdminDefsRepoRef(ComAtprotoAdminDefs.RepoRef)
    case comAtprotoRepoStrongRef(ComAtprotoRepoStrongRef)
    case unexpected(ATProtocolValueContainer)

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
            let unknownValue = try ATProtocolValueContainer(from: decoder)
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
        case .unexpected(let ATProtocolValueContainer):
            print("InputSubjectUnion encoding unexpected value")
            try ATProtocolValueContainer.encode(to: encoder)
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
        case .unexpected(let ATProtocolValueContainer):
            hasher.combine("unexpected")
            hasher.combine(ATProtocolValueContainer)
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




public enum OutputSubjectUnion: Codable, ATProtocolCodable, ATProtocolValue {
    case comAtprotoAdminDefsRepoRef(ComAtprotoAdminDefs.RepoRef)
    case comAtprotoRepoStrongRef(ComAtprotoRepoStrongRef)
    case unexpected(ATProtocolValueContainer)

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
            let unknownValue = try ATProtocolValueContainer(from: decoder)
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
        case .unexpected(let ATProtocolValueContainer):
            print("OutputSubjectUnion encoding unexpected value")
            try ATProtocolValueContainer.encode(to: encoder)
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
        case .unexpected(let ATProtocolValueContainer):
            hasher.combine("unexpected")
            hasher.combine(ATProtocolValueContainer)
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




public enum ComAtprotoModerationCreateReportSubjectUnion: Codable, ATProtocolCodable, ATProtocolValue {
    case comAtprotoAdminDefsRepoRef(ComAtprotoAdminDefs.RepoRef)
    case comAtprotoRepoStrongRef(ComAtprotoRepoStrongRef)
    case unexpected(ATProtocolValueContainer)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let typeValue = try container.decode(String.self, forKey: .type)
        print("ComAtprotoModerationCreateReportSubjectUnion decoding: \(typeValue)")

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
            print("ComAtprotoModerationCreateReportSubjectUnion decoding encountered an unexpected type: \(typeValue)")
            let unknownValue = try ATProtocolValueContainer(from: decoder)
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
        case .unexpected(let ATProtocolValueContainer):
            print("ComAtprotoModerationCreateReportSubjectUnion encoding unexpected value")
            try ATProtocolValueContainer.encode(to: encoder)
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
        case .unexpected(let ATProtocolValueContainer):
            hasher.combine("unexpected")
            hasher.combine(ATProtocolValueContainer)
        }
    }

    private enum CodingKeys: String, CodingKey {
        case type = "$type"
    }
    
    public func isEqual(to other: any ATProtocolValue) -> Bool {
        guard let otherValue = other as? ComAtprotoModerationCreateReportSubjectUnion else { return false }

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
    /// Submit a moderation report regarding an atproto account or record. Implemented by moderation services (with PDS proxying), and requires auth.
    public func createReport(input: ComAtprotoModerationCreateReport.Input, duringInitialSetup: Bool = false) async throws -> (responseCode: Int, data: ComAtprotoModerationCreateReport.Output?) {
        let endpoint = "/com.atproto.moderation.createReport"
        
        
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

        
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(ComAtprotoModerationCreateReport.Output.self, from: responseData)
        return (responseCode, decodedData)
        
    }
}
                           
