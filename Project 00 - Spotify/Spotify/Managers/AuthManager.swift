//
//  AuthManager.swift
//  Spotify
//
//  Created by Akyl Mukatay  on 26.05.2023.
//

import Foundation

final class AuthManager {
    static let shared = AuthManager()
    
    private init() {}
    
    var isSignedIn: Bool {
        return false
    }
    
    private var accessToken: String? {
        return nil
    }
    
    private var refreshToken: String? {
        return nil
    }
    
    private var tokenExpirationDate: Date? {
        return nil
    }
    
    private var ShouldRefreshToken: Bool {
        return false
    }
    
    
}
