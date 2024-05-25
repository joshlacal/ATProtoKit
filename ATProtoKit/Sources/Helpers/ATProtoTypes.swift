//
//  ATProtoTypes.swift
//
//
//  Created by Josh LaCalamito on 11/30/23.
//

import Foundation

public protocol ATProtocolCodable: Codable, Sendable {}

public protocol ATProtocolValue: ATProtocolCodable, Equatable, Hashable {
    func isEqual(to other: any ATProtocolValue) -> Bool
}

 // MARK: URIs

public struct ATProtocolURI: ATProtocolValue, CustomStringConvertible, QueryParameterConvertible {
    
    
    let authority: String
    let collection: String?
    let recordKey: String?

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let uriString = try container.decode(String.self)

        // Temporarily bypass validation to test decoding
        // guard uriString.hasPrefix("at://"),
        //       uriString.utf8.count <= 8192,
        //       !uriString.contains(".."),
        //       !uriString.contains("//"),
        //       !uriString.hasSuffix("/")
        // else {
        //     throw DecodingError.dataCorruptedError(in: container, debugDescription: "Invalid URI format")
        // }

        let components = uriString.dropFirst("at://".count).split(separator: "/", omittingEmptySubsequences: true)
        self.authority = String(components.first ?? "")
        self.collection = components.count > 1 ? String(components[1]) : nil
        self.recordKey = components.count > 2 ? String(components[2]) : nil
    }

    public init?(uriString: String) {
//        guard uriString.hasPrefix("at://"),
//              uriString.utf8.count <= 8192,
//              !uriString.contains(".."),
//              !uriString.contains("//"),
//              !uriString.hasSuffix("/")
//        else {
//            return nil
//        }

        let components = uriString.dropFirst("at://".count).split(separator: "/", omittingEmptySubsequences: true)

        guard let authorityComponent = components.first else {
            return nil
        }

        self.authority = String(authorityComponent)
        self.collection = components.count > 1 ? String(components[1]) : nil
        self.recordKey = components.count > 2 ? String(components[2]) : nil

        // TODO: Additional normalization and validation
    }

    public var description: String {
        return uriString()
    }

    func uriString() -> String {
        var uri = "at://\(authority)"
        if let collection = collection {
            uri += "/\(collection)"
        }
        if let recordKey = recordKey {
            uri += "/\(recordKey)"
        }
        return uri
    }

    public func isEqual(to other: any ATProtocolValue) -> Bool {
        guard let otherURI = other as? ATProtocolURI else {
            return false
        }

        return authority == otherURI.authority &&
            collection == otherURI.collection &&
            recordKey == otherURI.recordKey
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        let uriString = self.uriString()
        try container.encode(uriString)
    }
    
    func asQueryItem(name: String) -> URLQueryItem? {
        return URLQueryItem(name: name, value: self.uriString())
    }

}

public struct URI: ATProtocolValue, CustomStringConvertible, QueryParameterConvertible, ExpressibleByStringLiteral {
    let scheme: String
    let authority: String
    let path: String?
    let query: String?
    let fragment: String?
    
    enum URIError: Error {
        case invalidScheme
        case invalidURI
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let uriString = try container.decode(String.self)

        let urlComponents = URLComponents(string: uriString)

        self.scheme = urlComponents?.scheme ?? ""
        self.authority = urlComponents?.host ?? ""
        if let pathComponent = urlComponents?.path, !pathComponent.isEmpty {
            self.path = pathComponent
        } else {
            self.path = nil
        }
        self.query = urlComponents?.query
        self.fragment = urlComponents?.fragment
    }

    init(uriString: String) {
        let urlComponents = URLComponents(string: uriString)

        // Fallback to a default scheme if necessary or handle the error appropriately.
        let defaultScheme = "https"
        self.scheme = urlComponents?.scheme ?? defaultScheme
        self.authority = urlComponents?.host ?? ""
        self.path = urlComponents?.path.isEmpty ?? true ? nil : urlComponents?.path
        self.query = urlComponents?.query
        self.fragment = urlComponents?.fragment
    }

    func isValid() -> Bool {
        // Ensure the scheme and authority are not empty as a basic validation
        return !scheme.isEmpty && !authority.isEmpty
    }

    func asQueryItem(name: String) -> URLQueryItem? {
        // Validate the URI before converting it to a string.
        guard self.isValid() else {
            return nil
        }
        // Since uriString is not throwing, we can use it directly.
        return URLQueryItem(name: name, value: self.uriString())
    }

    public func uriString() -> String {
        // Construct the URI string without error throwing.
        // This will use the existing logic but won't throw errors.
        var components = URLComponents()
        components.scheme = scheme.isEmpty ? nil : scheme
        components.host = authority
        components.path = path ?? ""
        components.query = query
        components.fragment = fragment
        // If the URI components are not valid, return an empty string or some form of indication.
        return components.string ?? "invalid-uri"
    }

    // Conform to ExpressibleByStringLiteral
    public init(stringLiteral value: String) {
        self.init(uriString: value)
    }

    // Conform to LosslessStringConvertible
    public init?(_ description: String) {
        self.init(uriString: description)
    }

    // Update the description property to return the uriString directly
    public var description: String {
        return uriString()
    }


    public func isEqual(to other: any ATProtocolValue) -> Bool {
        guard let otherURI = other as? URI else {
            return false
        }
        return scheme == otherURI.scheme &&
               authority == otherURI.authority &&
               path == otherURI.path &&
               query == otherURI.query &&
               fragment == otherURI.fragment
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        let uriString = self.uriString()
        try container.encode(uriString)
    }
    

}

// MARK: Blob

public struct Blob: Codable, ATProtocolCodable, Hashable, Equatable, Sendable {
    public let type: String
    public let ref: ATProtoLink?
    public let mimeType: String
    public let size: Int
    public let cid: String?

    enum CodingKeys: String, CodingKey {
        case type = "$type"
        case ref
        case mimeType
        case size
        case cid
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(String.self, forKey: .type)
        self.ref = try container.decodeIfPresent(ATProtoLink.self, forKey: .ref)
        self.mimeType = try container.decode(String.self, forKey: .mimeType)
        self.size = try container.decode(Int.self, forKey: .size)
        self.cid = try container.decodeIfPresent(String.self, forKey: .cid)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(type, forKey: .type)
        try container.encodeIfPresent(ref, forKey: .ref)
        try container.encode(mimeType, forKey: .mimeType)
        try container.encode(size, forKey: .size)
        try container.encodeIfPresent(cid, forKey: .cid)
    }

    public func isEqual(to other: any ATProtocolCodable) -> Bool {
        guard let otherBlob = other as? Blob else { return false }
        return self == otherBlob
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(type)
        hasher.combine(ref)
        hasher.combine(mimeType)
        hasher.combine(size)
        hasher.combine(cid)
    }
}

// MARK: $link

public struct ATProtoLink: Codable, ATProtocolCodable, Hashable, Equatable, Sendable {
    public let cid: String

    enum CodingKeys: String, CodingKey {
        case cid = "$link"
    }

    public init(cid: String) {
        self.cid = cid
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.cid = try container.decode(String.self, forKey: .cid)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(cid, forKey: .cid)
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(cid)
    }

    public func isEqual(to other: any ATProtocolCodable) -> Bool {
        guard let otherLink = other as? ATProtoLink else { return false }
        return self == otherLink
    }
}

// MARK: $bytes

public struct Bytes: Codable, ATProtocolCodable, Hashable, Equatable, Sendable {
    public let data: Data

    enum CodingKeys: String, CodingKey {
        case data = "$bytes"
    }

    public init(data: Data) {
        self.data = data
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let base64String = try container.decode(String.self, forKey: .data)
        guard let data = Data(base64Encoded: base64String) else {
            throw DecodingError.dataCorruptedError(forKey: .data,
                                                   in: container,
                                                   debugDescription: "Base64 string could not be decoded")
        }
        self.data = data
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        let base64String = data.base64EncodedString()
        try container.encode(base64String, forKey: .data)
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(data)
    }

    public func isEqual(to other: any ATProtocolCodable) -> Bool {
        guard let otherBytes = other as? Bytes else { return false }
        return self == otherBytes
    }
}

extension AppBskyFeedDefs.FeedViewPost: Identifiable {
    public var id: String {
        if case .appBskyFeedDefsReasonRepost(let reasonRepost) = reason {
            let reposterDID = reasonRepost.by.did
            return "\(post.uri)-repostedBy-\(reposterDID)"
        } else if let replyRef = reply {
            let rootId = extractIdentifierFrom(replyRef.root)
            let parentId = extractIdentifierFrom(replyRef.parent)
            return "\(post.uri)-reply-root-\(rootId)-parent-\(parentId)"
        } else {
            return post.uri.uriString()
        }
    }

    private func extractIdentifierFrom(_ union: AppBskyFeedDefs.ReplyRefRootUnion) -> String {
        switch union {
        case .appBskyFeedDefsPostView(let postView):
            return postView.uri.uriString()
        case .appBskyFeedDefsNotFoundPost(let notFoundPost):
            return notFoundPost.uri.uriString()
        case .appBskyFeedDefsBlockedPost(let blockedPost):
            return blockedPost.uri.uriString()
        case .unexpected(let ATProtocolValueContainer):
            return ATProtocolValueContainer.hashValue.description
        }
    }

    private func extractIdentifierFrom(_ union: AppBskyFeedDefs.ReplyRefParentUnion) -> String {
        switch union {
        case .appBskyFeedDefsPostView(let postView):
            return postView.uri.uriString()
        case .appBskyFeedDefsNotFoundPost(let notFoundPost):
            return notFoundPost.uri.uriString()
        case .appBskyFeedDefsBlockedPost(let blockedPost):
            return blockedPost.uri.uriString()
        case .unexpected(let ATProtocolValueContainer):
            return ATProtocolValueContainer.hashValue.description
        }
    }
}
/*
extension ATProtocolValueContainer: Equatable {
    public static func == (lhs: ATProtocolValueContainer, rhs: ATProtocolValueContainer) -> Bool {
        switch (lhs, rhs) {
        case (.knownType(let lhsValue), .knownType(let rhsValue)):
            return lhsValue.isEqual(to: rhsValue)
        case (.string(let lhsValue), .string(let rhsValue)):
            return lhsValue == rhsValue
        case (.number(let lhsValue), .number(let rhsValue)):
            return lhsValue == rhsValue
        case (.bigNumber(let lhsValue), .bigNumber(let rhsValue)):
            return lhsValue == rhsValue
        case (.object(let lhsValue), .object(let rhsValue)):
            return lhsValue == rhsValue
        case (.array(let lhsValue), .array(let rhsValue)):
            return lhsValue == rhsValue
        case (.bool(let lhsValue), .bool(let rhsValue)):
            return lhsValue == rhsValue
        case (.null, .null):
            return true
        case (.link(let lhsValue), .link(let rhsValue)):
            return lhsValue == rhsValue
        case (.bytes(let lhsValue), .bytes(let rhsValue)):
            return lhsValue == rhsValue
        case (.unknownType(let lhsType, let lhsValue), .unknownType(let rhsType, let rhsValue)):
            return lhsType == rhsType && lhsValue == rhsValue
        case (.decodeError(let lhsError), .decodeError(let rhsError)):
            return lhsError == rhsError
        default:
            return false
        }
    }
}

public extension ATProtocolValueContainer {
    func isEqual(to other: any ATProtocolValue) -> Bool {
        guard let otherValue = other as? ATProtocolValueContainer else { return false }

        switch (self, otherValue) {
        case (.knownType(let lhsValue), .knownType(let rhsValue)):
            return lhsValue.isEqual(to: rhsValue)
        case (.string(let lhsValue), .string(let rhsValue)):
            return lhsValue == rhsValue
        case (.number(let lhsValue), .number(let rhsValue)):
            return lhsValue == rhsValue
        case (.bigNumber(let lhsValue), .bigNumber(let rhsValue)):
            return lhsValue == rhsValue
        case (.object(let lhsValue), .object(let rhsValue)):
            return lhsValue == rhsValue
        case (.array(let lhsValue), .array(let rhsValue)):
            return lhsValue == rhsValue
        case (.bool(let lhsValue), .bool(let rhsValue)):
            return lhsValue == rhsValue
        case (.null, .null):
            return true
        case (.link(let lhsValue), .link(let rhsValue)):
            return lhsValue == rhsValue
        case (.bytes(let lhsValue), .bytes(let rhsValue)):
            return lhsValue == rhsValue
        case (.unknownType(let lhsType, let lhsValue), .unknownType(let rhsType, let rhsValue)):
            return lhsType == rhsType && lhsValue == rhsValue
        case (.decodeError(let lhsError), .decodeError(let rhsError)):
            return lhsError == rhsError
        default:
            return false
        }
    }
}

extension ATProtocolValueContainer: Hashable {
    public func hash(into hasher: inout Hasher) {
        switch self {
        case .knownType(let customValue):
            customValue.hash(into: &hasher)
        case .string(let stringValue):
            hasher.combine("string")
            hasher.combine(stringValue)
        case .number(let intValue):
            hasher.combine("number")
            hasher.combine(intValue)
        case .bigNumber(let bigNumberString):
            hasher.combine("bigNumber")
            hasher.combine(bigNumberString)
        case .object(let objectValue):
            hasher.combine("object")
            hasher.combine(objectValue)
        case .array(let arrayValue):
            hasher.combine("array")
            hasher.combine(arrayValue)
        case .bool(let boolValue):
            hasher.combine("bool")
            hasher.combine(boolValue)
        case .null:
            hasher.combine("null")
        case .link(let linkValue):
            hasher.combine("link")
            hasher.combine(linkValue)
        case .bytes(let bytesValue):
            hasher.combine("bytes")
            hasher.combine(bytesValue)
        case .unknownType(let type, let value):
            hasher.combine("unknownType")
            hasher.combine(type)
            hasher.combine(value)
        case .decodeError(let errorMessage):
            hasher.combine("decodeError")
            hasher.combine(errorMessage)
        }
    }
}
 */
