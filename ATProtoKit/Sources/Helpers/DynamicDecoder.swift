//
//  DynamicDecoder.swift
//  Petrel
//
//  Created by Josh LaCalamito on 11/20/23.
//

import Foundation

extension JSONValue {

    public var textRepresentation: String {
        switch self {
        case .custom(let value):
            let mirror = Mirror(reflecting: value)
            return mirror.children.map { "\($0.label ?? ""): \($0.value)" }.joined(separator: ", ")
        case .string(let value):
            return value
        case .number(let value):
            return String(value)
        case .bigNumber(let value):
            return value
        case .object(let value):
            return "Object: \(value.description)"
        case .array(let value):
            return "Array: \(value.description)"
        case .bool(let value):
            return value ? "True" : "False"
        case .null:
            return "Null"
        case .link(let value):
            return "Link: \(value)"
        case .bytes(let value):
            return "Bytes: \(value)"
        case .unknownType(let type, let dict):
            if case .object(let objectDict) = dict {
                return "Unknown Type: \(type), Values: \(objectDict.map { key, value in "\(key): \(value.textRepresentation)" }.joined(separator: ", "))"
            } else {
                return "Unknown Type: \(type)"
            }
        case .decodeError(let errorMessage):
            return "Decode Error: \(errorMessage)"

        }
    }
    


    public func toJSON() throws -> Any {
        switch self {
        case .custom(let value):
            return value
        case .string(let value):
            return value
        case .number(let value):
            return value
        case .bigNumber(let value):
            return value
        case .bool(let value):
            return value
        case .null:
            return NSNull()
        case .link(let value):
            return value
        case .bytes(let value):
            return value
        case .object(let dict):
            return try dict.mapValues { try $0.toJSON() }
        case .array(let array):
            return try array.map { try $0.toJSON() }
        case .unknownType(let typeName, let jsonValue):
            var jsonDict = [String: Any]()
            if case .object(let dict) = jsonValue {
                for (key, value) in dict {
                    jsonDict[key] = try value.toJSON()
                }
            }
            return ["type": typeName, "value": jsonDict]
        case .decodeError(let value):
            print("Decode Error: \(value.debugDescription)")
            return value
        }
    }

    public func toData() throws -> Data {
        let json = try self.toJSON()
        return try JSONSerialization.data(withJSONObject: json)
    }
}

