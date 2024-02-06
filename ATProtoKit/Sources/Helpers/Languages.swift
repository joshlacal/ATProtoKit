//
//  Languages.swift
//  
//
//  Created by Josh LaCalamito on 11/29/23.
//

import Foundation

import Foundation

public extension Locale.Language {
    init(bcp47LanguageTag: String) {
        self.init(identifier: bcp47LanguageTag)
    }
}

public struct LanguageContainer: Codable, ATProtocolCodable, Hashable {
    public var lang: Locale.Language

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let languageTag = try container.decode(String.self)
        self.lang = Locale.Language(bcp47LanguageTag: languageTag)
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(lang)
    }

}
