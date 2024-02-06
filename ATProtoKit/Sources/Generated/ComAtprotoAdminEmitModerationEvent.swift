import Foundation
import ZippyJSON
                            
// lexicon: 1, id: com.atproto.admin.emitModerationEvent


public struct ComAtprotoAdminEmitModerationEvent { 
    public static let typeIdentifier = "com.atproto.admin.emitModerationEvent"        
public struct Input: Codable {
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
public struct Output: Codable {
            public let data: ComAtprotoAdminDefs.ModEventView
                                    
            // Standard public initializer
            public init(data: ComAtprotoAdminDefs.ModEventView) {
                self.data = data
                
            }

        }        
public enum Error: String, Swift.Error, CustomStringConvertible {
                case subjectHasAction = "SubjectHasAction."
            public var description: String {
                return self.rawValue
            }
        }


            // Union Type
            
public enum InputEventUnion: Codable, ATProtocolCodable, ATProtocolValue {
                case comAtprotoAdminDefsModEventTakedown(ComAtprotoAdminDefs.ModEventTakedown)
                case comAtprotoAdminDefsModEventAcknowledge(ComAtprotoAdminDefs.ModEventAcknowledge)
                case comAtprotoAdminDefsModEventEscalate(ComAtprotoAdminDefs.ModEventEscalate)
                case comAtprotoAdminDefsModEventComment(ComAtprotoAdminDefs.ModEventComment)
                case comAtprotoAdminDefsModEventLabel(ComAtprotoAdminDefs.ModEventLabel)
                case comAtprotoAdminDefsModEventReport(ComAtprotoAdminDefs.ModEventReport)
                case comAtprotoAdminDefsModEventMute(ComAtprotoAdminDefs.ModEventMute)
                case comAtprotoAdminDefsModEventReverseTakedown(ComAtprotoAdminDefs.ModEventReverseTakedown)
                case comAtprotoAdminDefsModEventUnmute(ComAtprotoAdminDefs.ModEventUnmute)
                case comAtprotoAdminDefsModEventEmail(ComAtprotoAdminDefs.ModEventEmail)
                case unexpected(JSONValue)

                public init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: CodingKeys.self)
                    let typeValue = try container.decode(String.self, forKey: .type)
                    print("InputEventUnion decoding: \(typeValue)")

                    switch typeValue {
                    case "com.atproto.admin.defs#modEventTakedown":
                        print("Decoding as com.atproto.admin.defs#modEventTakedown")
                        let value = try ComAtprotoAdminDefs.ModEventTakedown(from: decoder)
                        self = .comAtprotoAdminDefsModEventTakedown(value)
                    case "com.atproto.admin.defs#modEventAcknowledge":
                        print("Decoding as com.atproto.admin.defs#modEventAcknowledge")
                        let value = try ComAtprotoAdminDefs.ModEventAcknowledge(from: decoder)
                        self = .comAtprotoAdminDefsModEventAcknowledge(value)
                    case "com.atproto.admin.defs#modEventEscalate":
                        print("Decoding as com.atproto.admin.defs#modEventEscalate")
                        let value = try ComAtprotoAdminDefs.ModEventEscalate(from: decoder)
                        self = .comAtprotoAdminDefsModEventEscalate(value)
                    case "com.atproto.admin.defs#modEventComment":
                        print("Decoding as com.atproto.admin.defs#modEventComment")
                        let value = try ComAtprotoAdminDefs.ModEventComment(from: decoder)
                        self = .comAtprotoAdminDefsModEventComment(value)
                    case "com.atproto.admin.defs#modEventLabel":
                        print("Decoding as com.atproto.admin.defs#modEventLabel")
                        let value = try ComAtprotoAdminDefs.ModEventLabel(from: decoder)
                        self = .comAtprotoAdminDefsModEventLabel(value)
                    case "com.atproto.admin.defs#modEventReport":
                        print("Decoding as com.atproto.admin.defs#modEventReport")
                        let value = try ComAtprotoAdminDefs.ModEventReport(from: decoder)
                        self = .comAtprotoAdminDefsModEventReport(value)
                    case "com.atproto.admin.defs#modEventMute":
                        print("Decoding as com.atproto.admin.defs#modEventMute")
                        let value = try ComAtprotoAdminDefs.ModEventMute(from: decoder)
                        self = .comAtprotoAdminDefsModEventMute(value)
                    case "com.atproto.admin.defs#modEventReverseTakedown":
                        print("Decoding as com.atproto.admin.defs#modEventReverseTakedown")
                        let value = try ComAtprotoAdminDefs.ModEventReverseTakedown(from: decoder)
                        self = .comAtprotoAdminDefsModEventReverseTakedown(value)
                    case "com.atproto.admin.defs#modEventUnmute":
                        print("Decoding as com.atproto.admin.defs#modEventUnmute")
                        let value = try ComAtprotoAdminDefs.ModEventUnmute(from: decoder)
                        self = .comAtprotoAdminDefsModEventUnmute(value)
                    case "com.atproto.admin.defs#modEventEmail":
                        print("Decoding as com.atproto.admin.defs#modEventEmail")
                        let value = try ComAtprotoAdminDefs.ModEventEmail(from: decoder)
                        self = .comAtprotoAdminDefsModEventEmail(value)
                    default:
                        print("InputEventUnion decoding encountered an unexpected type: \(typeValue)")
                        let unknownValue = try JSONValue(from: decoder)
                        self = .unexpected(unknownValue)
                    }
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: CodingKeys.self)

                    switch self {
                    case .comAtprotoAdminDefsModEventTakedown(let value):
                        print("Encoding com.atproto.admin.defs#modEventTakedown")
                        try container.encode("com.atproto.admin.defs#modEventTakedown", forKey: .type)
                        try value.encode(to: encoder)
                    case .comAtprotoAdminDefsModEventAcknowledge(let value):
                        print("Encoding com.atproto.admin.defs#modEventAcknowledge")
                        try container.encode("com.atproto.admin.defs#modEventAcknowledge", forKey: .type)
                        try value.encode(to: encoder)
                    case .comAtprotoAdminDefsModEventEscalate(let value):
                        print("Encoding com.atproto.admin.defs#modEventEscalate")
                        try container.encode("com.atproto.admin.defs#modEventEscalate", forKey: .type)
                        try value.encode(to: encoder)
                    case .comAtprotoAdminDefsModEventComment(let value):
                        print("Encoding com.atproto.admin.defs#modEventComment")
                        try container.encode("com.atproto.admin.defs#modEventComment", forKey: .type)
                        try value.encode(to: encoder)
                    case .comAtprotoAdminDefsModEventLabel(let value):
                        print("Encoding com.atproto.admin.defs#modEventLabel")
                        try container.encode("com.atproto.admin.defs#modEventLabel", forKey: .type)
                        try value.encode(to: encoder)
                    case .comAtprotoAdminDefsModEventReport(let value):
                        print("Encoding com.atproto.admin.defs#modEventReport")
                        try container.encode("com.atproto.admin.defs#modEventReport", forKey: .type)
                        try value.encode(to: encoder)
                    case .comAtprotoAdminDefsModEventMute(let value):
                        print("Encoding com.atproto.admin.defs#modEventMute")
                        try container.encode("com.atproto.admin.defs#modEventMute", forKey: .type)
                        try value.encode(to: encoder)
                    case .comAtprotoAdminDefsModEventReverseTakedown(let value):
                        print("Encoding com.atproto.admin.defs#modEventReverseTakedown")
                        try container.encode("com.atproto.admin.defs#modEventReverseTakedown", forKey: .type)
                        try value.encode(to: encoder)
                    case .comAtprotoAdminDefsModEventUnmute(let value):
                        print("Encoding com.atproto.admin.defs#modEventUnmute")
                        try container.encode("com.atproto.admin.defs#modEventUnmute", forKey: .type)
                        try value.encode(to: encoder)
                    case .comAtprotoAdminDefsModEventEmail(let value):
                        print("Encoding com.atproto.admin.defs#modEventEmail")
                        try container.encode("com.atproto.admin.defs#modEventEmail", forKey: .type)
                        try value.encode(to: encoder)
                    case .unexpected(let jsonValue):
                        print("InputEventUnion encoding unexpected value")
                        try jsonValue.encode(to: encoder)
                    }
                }

                public func hash(into hasher: inout Hasher) {
                    switch self {
                    case .comAtprotoAdminDefsModEventTakedown(let value):
                        hasher.combine("com.atproto.admin.defs#modEventTakedown")
                        hasher.combine(value)
                    case .comAtprotoAdminDefsModEventAcknowledge(let value):
                        hasher.combine("com.atproto.admin.defs#modEventAcknowledge")
                        hasher.combine(value)
                    case .comAtprotoAdminDefsModEventEscalate(let value):
                        hasher.combine("com.atproto.admin.defs#modEventEscalate")
                        hasher.combine(value)
                    case .comAtprotoAdminDefsModEventComment(let value):
                        hasher.combine("com.atproto.admin.defs#modEventComment")
                        hasher.combine(value)
                    case .comAtprotoAdminDefsModEventLabel(let value):
                        hasher.combine("com.atproto.admin.defs#modEventLabel")
                        hasher.combine(value)
                    case .comAtprotoAdminDefsModEventReport(let value):
                        hasher.combine("com.atproto.admin.defs#modEventReport")
                        hasher.combine(value)
                    case .comAtprotoAdminDefsModEventMute(let value):
                        hasher.combine("com.atproto.admin.defs#modEventMute")
                        hasher.combine(value)
                    case .comAtprotoAdminDefsModEventReverseTakedown(let value):
                        hasher.combine("com.atproto.admin.defs#modEventReverseTakedown")
                        hasher.combine(value)
                    case .comAtprotoAdminDefsModEventUnmute(let value):
                        hasher.combine("com.atproto.admin.defs#modEventUnmute")
                        hasher.combine(value)
                    case .comAtprotoAdminDefsModEventEmail(let value):
                        hasher.combine("com.atproto.admin.defs#modEventEmail")
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
                    guard let otherValue = other as? InputEventUnion else { return false }

                    switch (self, otherValue) {
                        case (.comAtprotoAdminDefsModEventTakedown(let selfValue), 
                            .comAtprotoAdminDefsModEventTakedown(let otherValue)):
                            return selfValue == otherValue
                        case (.comAtprotoAdminDefsModEventAcknowledge(let selfValue), 
                            .comAtprotoAdminDefsModEventAcknowledge(let otherValue)):
                            return selfValue == otherValue
                        case (.comAtprotoAdminDefsModEventEscalate(let selfValue), 
                            .comAtprotoAdminDefsModEventEscalate(let otherValue)):
                            return selfValue == otherValue
                        case (.comAtprotoAdminDefsModEventComment(let selfValue), 
                            .comAtprotoAdminDefsModEventComment(let otherValue)):
                            return selfValue == otherValue
                        case (.comAtprotoAdminDefsModEventLabel(let selfValue), 
                            .comAtprotoAdminDefsModEventLabel(let otherValue)):
                            return selfValue == otherValue
                        case (.comAtprotoAdminDefsModEventReport(let selfValue), 
                            .comAtprotoAdminDefsModEventReport(let otherValue)):
                            return selfValue == otherValue
                        case (.comAtprotoAdminDefsModEventMute(let selfValue), 
                            .comAtprotoAdminDefsModEventMute(let otherValue)):
                            return selfValue == otherValue
                        case (.comAtprotoAdminDefsModEventReverseTakedown(let selfValue), 
                            .comAtprotoAdminDefsModEventReverseTakedown(let otherValue)):
                            return selfValue == otherValue
                        case (.comAtprotoAdminDefsModEventUnmute(let selfValue), 
                            .comAtprotoAdminDefsModEventUnmute(let otherValue)):
                            return selfValue == otherValue
                        case (.comAtprotoAdminDefsModEventEmail(let selfValue), 
                            .comAtprotoAdminDefsModEventEmail(let otherValue)):
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


}
extension ATProtoClient.Com.Atproto.Admin {
    /// Take a moderation action on an actor.
    public func emitModerationEvent(input: ComAtprotoAdminEmitModerationEvent.Input) async throws -> (responseCode: Int, data: ComAtprotoAdminEmitModerationEvent.Output?) {
        let endpoint = "/com.atproto.admin.emitModerationEvent"
        
        let requestData = try JSONEncoder().encode(input)
        
        
        // Perform the network request
        let (responseCode, responseData) = try await parent.parent.parent.performRequestForData(endpoint: endpoint, method: "POST", body: requestData)

        
        // Decode the response if an output type is expected
        let decoder = ZippyJSONDecoder()
        let decodedData = try? decoder.decode(ComAtprotoAdminEmitModerationEvent.Output.self, from: responseData)
        return (responseCode, decodedData)
        
    }
}
                           
