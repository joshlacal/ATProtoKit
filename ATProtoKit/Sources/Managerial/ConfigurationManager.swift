//
//  ConfigurationManager.swift
//  ATProtoKit
//
//  Created by Josh LaCalamito on 4/21/24.
//


import Foundation

protocol BaseURLUpdateDelegate: AnyActor {
    func baseURLDidUpdate(_ newBaseURL: URL) async
}

protocol ConfigurationManaging: AnyActor {
    func updateBaseURL(_ url: URL) async
    func updateUserConfiguration(did: String, serviceEndpoint: String) async throws
    func updateDID(did: String) async
    func getDID() async -> String?
    func getServiceEndpoint() async -> String
}

actor ConfigurationManager: ConfigurationManaging {
    var delegate: BaseURLUpdateDelegate?


    private var baseURL: URL
    private var did: String?
    
    init(baseURL: URL) {
        self.baseURL = baseURL
        Task {
            await loadSettings()
        }
    }
    
    func setDelegate(_ delegate: (any BaseURLUpdateDelegate)?) {
        self.delegate = delegate
    }

    enum ConfigurationManagerError: Error {
        case invalidURL
    }

    func updateUserConfiguration(did: String, serviceEndpoint: String) async throws {
        updateDID(did: did)
        guard let serviceURL = URL(string: serviceEndpoint) else {
            throw ConfigurationManagerError.invalidURL
        }
        await updateBaseURL(serviceURL)
    }

    
    private func loadSettings() {
        if let savedURLString = UserDefaults.standard.string(forKey: "baseURL"),
           let savedURL = URL(string: savedURLString) {
            self.baseURL = savedURL
        }
        self.did = UserDefaults.standard.string(forKey: "did")
    }
    
    func updateBaseURL(_ url: URL) async {
        baseURL = url
        UserDefaults.standard.set(url.absoluteString, forKey: "baseURL")
        await delegate?.baseURLDidUpdate(url)
    }

    public func updateDID(did: String) {
        self.did = did
        UserDefaults.standard.set(did, forKey: "did")
    }
    
    public func getDID() async -> String? {
        return did
    }
    
    func getServiceEndpoint() async -> String {
        return baseURL.absoluteString
    }

}
