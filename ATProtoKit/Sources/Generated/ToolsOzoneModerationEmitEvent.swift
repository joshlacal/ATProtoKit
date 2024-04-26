import Foundation
import ZippyJSON
                            
// lexicon: 1, id: tools.ozone.moderation.emitEvent


public struct ToolsOzoneModerationEmitEvent { 
    public static let typeIdentifier = "tools.ozone.moderation.emitEvent"        
public struct Input: ATProtocolCodable {
            public let event: InputEventUnion
            public let subject: InputSubjectUnion
            public let subjectBlobCids: [String]?
            public let createdBy: String

            // Standard public initializer
            public init(event: InputEventUnion, subject: InputSubjectUnion, subjectBlobCids: [String]? = nil, createdBy: String) {
                self.event = event
                self.subject = subject
                self.subjectBlobCids = subjectBlobCids
                self.createdBy = createdBy
                
            }
        }    
    public typealias Output = ToolsOzoneModerationDefs.ModEventView
            
public enum Error: String, Swift.Error, CustomStringConvertible {
                case subjectHasAction = "SubjectHasAction."
            public var description: String {
                return self.rawValue
            }
        }


            // Union Type
            
public enum InputEventUnion: Codable, ATProtocolCodable, ATProtocolValue {
                case toolsOzoneModerationDefsModEventTakedown(ToolsOzoneModerationDefs.ModEventTakedown)
                case toolsOzoneModerationDefsModEventAcknowledge(ToolsOzoneModerationDefs.ModEventAcknowledge)
                case toolsOzoneModerationDefsModEventEscalate(ToolsOzoneModerationDefs.ModEventEscalate)
                case toolsOzoneModerationDefsModEventComment(ToolsOzoneModerationDefs.ModEventComment)
                case toolsOzoneModerationDefsModEventLabel(ToolsOzoneModerationDefs.ModEventLabel)
                case toolsOzoneModerationDefsModEventReport(ToolsOzoneModerationDefs.ModEventReport)
                case toolsOzoneModerationDefsModEventMute(ToolsOzoneModerationDefs.ModEventMute)
                case toolsOzoneModerationDefsModEventReverseTakedown(ToolsOzoneModerationDefs.ModEventReverseTakedown)
                case toolsOzoneModerationDefsModEventUnmute(ToolsOzoneModerationDefs.ModEventUnmute)
                case toolsOzoneModerationDefsModEventEmail(ToolsOzoneModerationDefs.ModEventEmail)
                case toolsOzoneModerationDefsModEventTag(ToolsOzoneModerationDefs.ModEventTag)
                case unexpected(ATProtocolValueContainer)

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    let typeValue = try container.decode(String.self, forKey: .type)
                    print("InputEventUnion decoding: \(typeValue)")

                    switch typeValue {
                    case "tools.ozone.moderation.defs#modEventTakedown":
                        print("Decoding as tools.ozone.moderation.defs#modEventTakedown")
                        let value = try ToolsOzoneModerationDefs.ModEventTakedown(from: decoder)
                        self = .toolsOzoneModerationDefsModEventTakedown(value)
                    case "tools.ozone.moderation.defs#modEventAcknowledge":
                        print("Decoding as tools.ozone.moderation.defs#modEventAcknowledge")
                        let value = try ToolsOzoneModerationDefs.ModEventAcknowledge(from: decoder)
                        self = .toolsOzoneModerationDefsModEventAcknowledge(value)
                    case "tools.ozone.moderation.defs#modEventEscalate":
                        print("Decoding as tools.ozone.moderation.defs#modEventEscalate")
                        let value = try ToolsOzoneModerationDefs.ModEventEscalate(from: decoder)
                        self = .toolsOzoneModerationDefsModEventEscalate(value)
                    case "tools.ozone.moderation.defs#modEventComment":
                        print("Decoding as tools.ozone.moderation.defs#modEventComment")
                        let value = try ToolsOzoneModerationDefs.ModEventComment(from: decoder)
                        self = .toolsOzoneModerationDefsModEventComment(value)
                    case "tools.ozone.moderation.defs#modEventLabel":
                        print("Decoding as tools.ozone.moderation.defs#modEventLabel")
                        let value = try ToolsOzoneModerationDefs.ModEventLabel(from: decoder)
                        self = .toolsOzoneModerationDefsModEventLabel(value)
                    case "tools.ozone.moderation.defs#modEventReport":
                        print("Decoding as tools.ozone.moderation.defs#modEventReport")
                        let value = try ToolsOzoneModerationDefs.ModEventReport(from: decoder)
                        self = .toolsOzoneModerationDefsModEventReport(value)
                    case "tools.ozone.moderation.defs#modEventMute":
                        print("Decoding as tools.ozone.moderation.defs#modEventMute")
                        let value = try ToolsOzoneModerationDefs.ModEventMute(from: decoder)
                        self = .toolsOzoneModerationDefsModEventMute(value)
                    case "tools.ozone.moderation.defs#modEventReverseTakedown":
                        print("Decoding as tools.ozone.moderation.defs#modEventReverseTakedown")
                        let value = try ToolsOzoneModerationDefs.ModEventReverseTakedown(from: decoder)
                        self = .toolsOzoneModerationDefsModEventReverseTakedown(value)
                    case "tools.ozone.moderation.defs#modEventUnmute":
                        print("Decoding as tools.ozone.moderation.defs#modEventUnmute")
                        let value = try ToolsOzoneModerationDefs.ModEventUnmute(from: decoder)
                        self = .toolsOzoneModerationDefsModEventUnmute(value)
                    case "tools.ozone.moderation.defs#modEventEmail":
                        print("Decoding as tools.ozone.moderation.defs#modEventEmail")
                        let value = try ToolsOzoneModerationDefs.ModEventEmail(from: decoder)
                        self = .toolsOzoneModerationDefsModEventEmail(value)
                    case "tools.ozone.moderation.defs#modEventTag":
                        print("Decoding as tools.ozone.moderation.defs#modEventTag")
                        let value = try ToolsOzoneModerationDefs.ModEventTag(from: decoder)
                        self = .toolsOzoneModerationDefsModEventTag(value)
                    default:
                        print("InputEventUnion decoding encountered an unexpected type: \(typeValue)")
                        let unknownValue = try ATProtocolValueContainer(from: decoder)
                        self = .unexpected(unknownValue)
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)

                    switch self {
                    case .toolsOzoneModerationDefsModEventTakedown(let value):
                        print("Encoding tools.ozone.moderation.defs#modEventTakedown")
                        try container.encode("tools.ozone.moderation.defs#modEventTakedown", forKey: .type)
                        try value.encode(to: encoder)
                    case .toolsOzoneModerationDefsModEventAcknowledge(let value):
                        print("Encoding tools.ozone.moderation.defs#modEventAcknowledge")
                        try container.encode("tools.ozone.moderation.defs#modEventAcknowledge", forKey: .type)
                        try value.encode(to: encoder)
                    case .toolsOzoneModerationDefsModEventEscalate(let value):
                        print("Encoding tools.ozone.moderation.defs#modEventEscalate")
                        try container.encode("tools.ozone.moderation.defs#modEventEscalate", forKey: .type)
                        try value.encode(to: encoder)
                    case .toolsOzoneModerationDefsModEventComment(let value):
                        print("Encoding tools.ozone.moderation.defs#modEventComment")
                        try container.encode("tools.ozone.moderation.defs#modEventComment", forKey: .type)
                        try value.encode(to: encoder)
                    case .toolsOzoneModerationDefsModEventLabel(let value):
                        print("Encoding tools.ozone.moderation.defs#modEventLabel")
                        try container.encode("tools.ozone.moderation.defs#modEventLabel", forKey: .type)
                        try value.encode(to: encoder)
                    case .toolsOzoneModerationDefsModEventReport(let value):
                        print("Encoding tools.ozone.moderation.defs#modEventReport")
                        try container.encode("tools.ozone.moderation.defs#modEventReport", forKey: .type)
                        try value.encode(to: encoder)
                    case .toolsOzoneModerationDefsModEventMute(let value):
                        print("Encoding tools.ozone.moderation.defs#modEventMute")
                        try container.encode("tools.ozone.moderation.defs#modEventMute", forKey: .type)
                        try value.encode(to: encoder)
                    case .toolsOzoneModerationDefsModEventReverseTakedown(let value):
                        print("Encoding tools.ozone.moderation.defs#modEventReverseTakedown")
                        try container.encode("tools.ozone.moderation.defs#modEventReverseTakedown", forKey: .type)
                        try value.encode(to: encoder)
                    case .toolsOzoneModerationDefsModEventUnmute(let value):
                        print("Encoding tools.ozone.moderation.defs#modEventUnmute")
                        try container.encode("tools.ozone.moderation.defs#modEventUnmute", forKey: .type)
                        try value.encode(to: encoder)
                    case .toolsOzoneModerationDefsModEventEmail(let value):
                        print("Encoding tools.ozone.moderation.defs#modEventEmail")
                        try container.encode("tools.ozone.moderation.defs#modEventEmail", forKey: .type)
                        try value.encode(to: encoder)
                    case .toolsOzoneModerationDefsModEventTag(let value):
                        print("Encoding tools.ozone.moderation.defs#modEventTag")
                        try container.encode("tools.ozone.moderation.defs#modEventTag", forKey: .type)
                        try value.encode(to: encoder)
                    case .unexpected(let ATProtocolValueContainer):
                        print("InputEventUnion encoding unexpected value")
                        try ATProtocolValueContainer.encode(to: encoder)
                    }
                }

                public func hash(into hasher: inout Hasher) {
                    switch self {
                    case .toolsOzoneModerationDefsModEventTakedown(let value):
                        hasher.combine("tools.ozone.moderation.defs#modEventTakedown")
                        hasher.combine(value)
                    case .toolsOzoneModerationDefsModEventAcknowledge(let value):
                        hasher.combine("tools.ozone.moderation.defs#modEventAcknowledge")
                        hasher.combine(value)
                    case .toolsOzoneModerationDefsModEventEscalate(let value):
                        hasher.combine("tools.ozone.moderation.defs#modEventEscalate")
                        hasher.combine(value)
                    case .toolsOzoneModerationDefsModEventComment(let value):
                        hasher.combine("tools.ozone.moderation.defs#modEventComment")
                        hasher.combine(value)
                    case .toolsOzoneModerationDefsModEventLabel(let value):
                        hasher.combine("tools.ozone.moderation.defs#modEventLabel")
                        hasher.combine(value)
                    case .toolsOzoneModerationDefsModEventReport(let value):
                        hasher.combine("tools.ozone.moderation.defs#modEventReport")
                        hasher.combine(value)
                    case .toolsOzoneModerationDefsModEventMute(let value):
                        hasher.combine("tools.ozone.moderation.defs#modEventMute")
                        hasher.combine(value)
                    case .toolsOzoneModerationDefsModEventReverseTakedown(let value):
                        hasher.combine("tools.ozone.moderation.defs#modEventReverseTakedown")
                        hasher.combine(value)
                    case .toolsOzoneModerationDefsModEventUnmute(let value):
                        hasher.combine("tools.ozone.moderation.defs#modEventUnmute")
                        hasher.combine(value)
                    case .toolsOzoneModerationDefsModEventEmail(let value):
                        hasher.combine("tools.ozone.moderation.defs#modEventEmail")
                        hasher.combine(value)
                    case .toolsOzoneModerationDefsModEventTag(let value):
                        hasher.combine("tools.ozone.moderation.defs#modEventTag")
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
                    guard let otherValue = other as? InputEventUnion else { return false }

                    switch (self, otherValue) {
                        case (.toolsOzoneModerationDefsModEventTakedown(let selfValue), 
                            .toolsOzoneModerationDefsModEventTakedown(let otherValue)):
                            return selfValue == otherValue
                        case (.toolsOzoneModerationDefsModEventAcknowledge(let selfValue), 
                            .toolsOzoneModerationDefsModEventAcknowledge(let otherValue)):
                            return selfValue == otherValue
                        case (.toolsOzoneModerationDefsModEventEscalate(let selfValue), 
                            .toolsOzoneModerationDefsModEventEscalate(let otherValue)):
                            return selfValue == otherValue
                        case (.toolsOzoneModerationDefsModEventComment(let selfValue), 
                            .toolsOzoneModerationDefsModEventComment(let otherValue)):
                            return selfValue == otherValue
                        case (.toolsOzoneModerationDefsModEventLabel(let selfValue), 
                            .toolsOzoneModerationDefsModEventLabel(let otherValue)):
                            return selfValue == otherValue
                        case (.toolsOzoneModerationDefsModEventReport(let selfValue), 
                            .toolsOzoneModerationDefsModEventReport(let otherValue)):
                            return selfValue == otherValue
                        case (.toolsOzoneModerationDefsModEventMute(let selfValue), 
                            .toolsOzoneModerationDefsModEventMute(let otherValue)):
                            return selfValue == otherValue
                        case (.toolsOzoneModerationDefsModEventReverseTakedown(let selfValue), 
                            .toolsOzoneModerationDefsModEventReverseTakedown(let otherValue)):
                            return selfValue == otherValue
                        case (.toolsOzoneModerationDefsModEventUnmute(let selfValue), 
                            .toolsOzoneModerationDefsModEventUnmute(let otherValue)):
                            return selfValue == otherValue
                        case (.toolsOzoneModerationDefsModEventEmail(let selfValue), 
                            .toolsOzoneModerationDefsModEventEmail(let otherValue)):
                            return selfValue == otherValue
                        case (.toolsOzoneModerationDefsModEventTag(let selfValue), 
                            .toolsOzoneModerationDefsModEventTag(let otherValue)):
                            return selfValue == otherValue
                        case (.unexpected(let selfValue), .unexpected(let otherValue)):
                            return selfValue.isEqual(to: otherValue)
                        default:
                            return false
                    }
                }
            }

            // Union Type
            
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


}
extension ATProtoClient.Tools.Ozone.Moderation {
    /// Take a moderation action on an actor.
    public func emitEvent(input: ToolsOzoneModerationEmitEvent.Input) async throws -> (responseCode: Int, data: ToolsOzoneModerationEmitEvent.Output?) {
        let endpoint = "/tools.ozone.moderation.emitEvent"
        
        
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

        
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(ToolsOzoneModerationEmitEvent.Output.self, from: responseData)
        return (responseCode, decodedData)
        
    }
}
                           
