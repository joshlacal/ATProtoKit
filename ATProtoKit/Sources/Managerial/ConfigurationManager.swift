//
//  ConfigurationManager.swift
//  ATProtoKit
//
//  Created by Josh LaCalamito on 4/21/24.
//


import Foundation

protocol ConfigurationManaging: AnyActor {
    func updateBaseURL(_ url: URL) async
    func updateUserConfiguration(did: String, serviceEndpoint: String) async throws
    func updateDID(did: String) async
    func getDID() async -> String?
}

actor ConfigurationManager: ConfigurationManaging {

    private(set) var baseURL: URL
    private var did: String?
    
    init(baseURL: URL) {
        self.baseURL = baseURL
        Task {
            await loadSettings()
        }
    }
    
    enum ConfigurationManagerError: Error {
        case invalidURL
    }

    func updateUserConfiguration(did: String, serviceEndpoint: String) async throws {
        updateDID(did: did)
        guard let serviceURL = URL(string: serviceEndpoint) else {
            throw ConfigurationManagerError.invalidURL
        }
        updateBaseURL(serviceURL)
    }

    
    private func loadSettings() {
        if let savedURLString = UserDefaults.standard.string(forKey: "baseURL"),
           let savedURL = URL(string: savedURLString) {
            self.baseURL = savedURL
        }
        self.did = UserDefaults.standard.string(forKey: "did")
    }
    
    public func updateBaseURL(_ url: URL) {
        baseURL = url
        UserDefaults.standard.set(url.absoluteString, forKey: "baseURL")
    }

    public func updateDID(did: String) {
        self.did = did
        UserDefaults.standard.set(did, forKey: "did")
    }
    
    public func getDID() async -> String? {
        return did
    }
}
