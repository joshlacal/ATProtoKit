//
//  KeychainManager.swift
//  ATProtoKit
//
//  Created by Josh LaCalamito on 11/20/23.
//

import Foundation
import Security

enum KeychainError: Error {
    case itemStoreError
    case itemRetrievalError
    case dataFormatError
}

class KeychainManager {
    
    static func store(key: String, value: String) throws {
        let query = [
            kSecValueData: value.data(using: .utf8)!,
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key
        ] as [String: Any]

        SecItemDelete(query as CFDictionary)
        let status = SecItemAdd(query as CFDictionary, nil)
        guard status == errSecSuccess else { throw KeychainError.itemStoreError }
    }
    
    static func retrieve(key: String) throws -> String? {
        let query = [
            kSecReturnData: kCFBooleanTrue!,
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key
        ] as [String: Any]

        var item: CFTypeRef?
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        guard status == errSecSuccess else { throw KeychainError.itemRetrievalError }
        
        guard let data = item as? Data else { throw KeychainError.dataFormatError }
        return String(data: data, encoding: .utf8)
    }
    
    static func delete(key: String) throws {
        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key
        ] as [String: Any]

        let status = SecItemDelete(query as CFDictionary)
        guard status == errSecSuccess || status == errSecItemNotFound else { throw KeychainError.itemStoreError }
    }

}

extension ATProtoClient {
    func storeSessionTokens() throws {
        guard let access = accessJwt, let refresh = refreshJwt else { return }
        try KeychainManager.store(key: "accessJwt", value: access)
        try KeychainManager.store(key: "refreshJwt", value: refresh)
    }
    
    func loadSessionTokens() throws {
        self.accessJwt = try KeychainManager.retrieve(key: "accessJwt")
        self.refreshJwt = try KeychainManager.retrieve(key: "refreshJwt")
    }
}
