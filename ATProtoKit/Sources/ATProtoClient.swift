//
//  ATProtoClient.swift
//  ATProtoKit
//
//  Created by Josh LaCalamito on 1/19/24.
//

import Foundation
import ZippyJSON


import Foundation
import ZippyJSON

enum APIError: String, Error {
    case expiredToken = "ExpiredToken"
    case invalidToken
    case invalidResponse
}


public actor ATProtoClient {
    public let baseURL: URL
       let config: ConfigurationManager
       let sessionManager: SessionManager
       let authenticationManager: AuthenticationManager
       let networkManager: NetworkManager
       let tokenManager: TokenManager
       weak var authDelegate: AuthenticationDelegate?
       
       enum InitializationState {
           case uninitialized
           case initializing
           case ready
           case failed(Error)
       }

       private(set) var initState: InitializationState = .uninitialized

       public init(baseURL: URL) {
           self.baseURL = baseURL
           // Instantly initializing components
           networkManager = NetworkManager(baseURL: baseURL)
           tokenManager = TokenManager(networkService: networkManager)
           config = ConfigurationManager(baseURL: baseURL)
           sessionManager = SessionManager(tokenManager: tokenManager)
           authenticationManager = AuthenticationManager(networkManager: networkManager, tokenManager: tokenManager, configManager: config)
       }


    // User-related properties
    var did: String?
    var handle: String?
    
    // Public API methods (simplified for clarity)
    public func login(identifier: String, password: String) async throws {
        try await authenticationManager.createSession(identifier: identifier, password: password)
    }
    
    public func logout() async throws {
        do {
            await sessionManager.clearSession()
            try KeychainManager.delete(key: "accessJwt")
            try KeychainManager.delete(key: "refreshJwt")
        } catch {
            print("Logout failed: \(error)")
            throw error
        }
        Task.detached { [weak self] in
            guard let self = self else { return }
            await authDelegate?.authenticationRequired(client: self)
        }
    }
    
    // MARK: - Utility Functions
    public func getHandle() -> String? {
        return handle
    }
    
    public func getDid() -> String? {
        return did
    }
    
    
    
    
    
    
    // MARK: Generated classes:
    
    public lazy var tools: Tools = {
        return Tools(networkManager: self.networkManager)
    }()
    
    public final class Tools: @unchecked Sendable {
        internal let networkManager: NetworkManager
        internal init(networkManager: NetworkManager) {
            self.networkManager = networkManager
        }
        
        public lazy var ozone: Ozone = {
            return Ozone(networkManager: self.networkManager)
        }()
        
        public final class Ozone: @unchecked Sendable {
            internal let networkManager: NetworkManager
            internal init(networkManager: NetworkManager) {
                self.networkManager = networkManager
            }
            
            public lazy var communication: Communication = {
                return Communication(networkManager: self.networkManager)
            }()
            
            public final class Communication: @unchecked Sendable {
                internal let networkManager: NetworkManager
                internal init(networkManager: NetworkManager) {
                    self.networkManager = networkManager
                }
                
            }
            
            public lazy var moderation: Moderation = {
                return Moderation(networkManager: self.networkManager)
            }()
            
            public final class Moderation: @unchecked Sendable {
                internal let networkManager: NetworkManager
                internal init(networkManager: NetworkManager) {
                    self.networkManager = networkManager
                }
                
            }
            
        }
        
    }
    
    public lazy var app: App = {
        return App(networkManager: self.networkManager)
    }()
    
    public final class App: @unchecked Sendable {
        internal let networkManager: NetworkManager
        internal init(networkManager: NetworkManager) {
            self.networkManager = networkManager
        }
        
        public lazy var bsky: Bsky = {
            return Bsky(networkManager: self.networkManager)
        }()
        
        public final class Bsky: @unchecked Sendable {
            internal let networkManager: NetworkManager
            internal init(networkManager: NetworkManager) {
                self.networkManager = networkManager
            }
            
            public lazy var embed: Embed = {
                return Embed(networkManager: self.networkManager)
            }()
            
            public final class Embed: @unchecked Sendable {
                internal let networkManager: NetworkManager
                internal init(networkManager: NetworkManager) {
                    self.networkManager = networkManager
                }
                
            }
            
            public lazy var notification: Notification = {
                return Notification(networkManager: self.networkManager)
            }()
            
            public final class Notification: @unchecked Sendable {
                internal let networkManager: NetworkManager
                internal init(networkManager: NetworkManager) {
                    self.networkManager = networkManager
                }
                
            }
            
            public lazy var unspecced: Unspecced = {
                return Unspecced(networkManager: self.networkManager)
            }()
            
            public final class Unspecced: @unchecked Sendable {
                internal let networkManager: NetworkManager
                internal init(networkManager: NetworkManager) {
                    self.networkManager = networkManager
                }
                
            }
            
            public lazy var graph: Graph = {
                return Graph(networkManager: self.networkManager)
            }()
            
            public final class Graph: @unchecked Sendable {
                internal let networkManager: NetworkManager
                internal init(networkManager: NetworkManager) {
                    self.networkManager = networkManager
                }
                
            }
            
            public lazy var feed: Feed = {
                return Feed(networkManager: self.networkManager)
            }()
            
            public final class Feed: @unchecked Sendable {
                internal let networkManager: NetworkManager
                internal init(networkManager: NetworkManager) {
                    self.networkManager = networkManager
                }
                
            }
            
            public lazy var richtext: Richtext = {
                return Richtext(networkManager: self.networkManager)
            }()
            
            public final class Richtext: @unchecked Sendable {
                internal let networkManager: NetworkManager
                internal init(networkManager: NetworkManager) {
                    self.networkManager = networkManager
                }
                
            }
            
            public lazy var actor: Actor = {
                return Actor(networkManager: self.networkManager)
            }()
            
            public final class Actor: @unchecked Sendable {
                internal let networkManager: NetworkManager
                internal init(networkManager: NetworkManager) {
                    self.networkManager = networkManager
                }
                
            }
            
            public lazy var labeler: Labeler = {
                return Labeler(networkManager: self.networkManager)
            }()
            
            public final class Labeler: @unchecked Sendable {
                internal let networkManager: NetworkManager
                internal init(networkManager: NetworkManager) {
                    self.networkManager = networkManager
                }
                
            }
            
        }
        
    }
    
    public lazy var com: Com = {
        return Com(networkManager: self.networkManager)
    }()
    
    public final class Com: @unchecked Sendable {
        internal let networkManager: NetworkManager
        internal init(networkManager: NetworkManager) {
            self.networkManager = networkManager
        }
        
        public lazy var atproto: Atproto = {
            return Atproto(networkManager: self.networkManager)
        }()
        
        public final class Atproto: @unchecked Sendable {
            internal let networkManager: NetworkManager
            internal init(networkManager: NetworkManager) {
                self.networkManager = networkManager
            }
            
            public lazy var temp: Temp = {
                return Temp(networkManager: self.networkManager)
            }()
            
            public final class Temp: @unchecked Sendable {
                internal let networkManager: NetworkManager
                internal init(networkManager: NetworkManager) {
                    self.networkManager = networkManager
                }
                
            }
            
            public lazy var identity: Identity = {
                return Identity(networkManager: self.networkManager)
            }()
            
            public final class Identity: @unchecked Sendable {
                internal let networkManager: NetworkManager
                internal init(networkManager: NetworkManager) {
                    self.networkManager = networkManager
                }
                
            }
            
            public lazy var admin: Admin = {
                return Admin(networkManager: self.networkManager)
            }()
            
            public final class Admin: @unchecked Sendable {
                internal let networkManager: NetworkManager
                internal init(networkManager: NetworkManager) {
                    self.networkManager = networkManager
                }
                
            }
            
            public lazy var label: Label = {
                return Label(networkManager: self.networkManager)
            }()
            
            public final class Label: @unchecked Sendable {
                internal let networkManager: NetworkManager
                internal init(networkManager: NetworkManager) {
                    self.networkManager = networkManager
                }
                
            }
            
            public lazy var server: Server = {
                return Server(networkManager: self.networkManager)
            }()
            
            public final class Server: @unchecked Sendable {
                internal let networkManager: NetworkManager
                internal init(networkManager: NetworkManager) {
                    self.networkManager = networkManager
                }
                
            }
            
            public lazy var sync: Sync = {
                return Sync(networkManager: self.networkManager)
            }()
            
            public final class Sync: @unchecked Sendable {
                internal let networkManager: NetworkManager
                internal init(networkManager: NetworkManager) {
                    self.networkManager = networkManager
                }
                
            }
            
            public lazy var repo: Repo = {
                return Repo(networkManager: self.networkManager)
            }()
            
            public final class Repo: @unchecked Sendable {
                internal let networkManager: NetworkManager
                internal init(networkManager: NetworkManager) {
                    self.networkManager = networkManager
                }
                
            }
            
            public lazy var moderation: Moderation = {
                return Moderation(networkManager: self.networkManager)
            }()
            
            public final class Moderation: @unchecked Sendable {
                internal let networkManager: NetworkManager
                internal init(networkManager: NetworkManager) {
                    self.networkManager = networkManager
                }
                
            }
            
        }
        
    }
    
}
