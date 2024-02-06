//
//  QueryParameters.swift
//  Petrel
//
//  Created by Josh LaCalamito on 11/20/23.
//

import Foundation

public protocol Parametrizable {
}

extension Parametrizable {
    public func asQueryItems() -> [URLQueryItem] {
        let mirror = Mirror(reflecting: self)
        return mirror.children.compactMap { child in
            guard let label = child.label, let value = child.value as? QueryParameterConvertible else {
                return nil
            }
            return value.asQueryItem(name: label)
        }
    }
}


protocol QueryParameterConvertible {
    func asQueryItem(name: String) -> URLQueryItem?
}

extension String: QueryParameterConvertible {
    func asQueryItem(name: String) -> URLQueryItem? {
        return URLQueryItem(name: name, value: self)
    }
}

extension Bool: QueryParameterConvertible {
    func asQueryItem(name: String) -> URLQueryItem? {
        return URLQueryItem(name: name, value: self ? "true" : "false")
    }
}

extension Int: QueryParameterConvertible {
    func asQueryItem(name: String) -> URLQueryItem? {
        return URLQueryItem(name: name, value: String(self))
    }
}

extension Optional where Wrapped: QueryParameterConvertible {
    func asQueryItem(name: String) -> URLQueryItem? {
        switch self {
        case .some(let value):
            return value.asQueryItem(name: name)
        case .none:
            return nil
        }
    }
}

