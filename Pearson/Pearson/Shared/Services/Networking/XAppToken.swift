//
//  XAppToken.swift
//  Pearson
//
//  Created by Dmitriy Tsurkan on 11/13/17.
//  Copyright © 2017 Dima Tsurkan. All rights reserved.
//

import Foundation

private extension Date {
    var isInPast: Bool {
        let now = Date()
        return self.compare(now) == ComparisonResult.orderedAscending
    }
}

struct XAppToken {
    
    enum DefaultsKeys: String {
        case TokenKey = "TokenKey"
        case RefreshToken = "RefreshToken"
    }
    
    // MARK: - Initializers
    
    let defaults: UserDefaults
    
    init(defaults: UserDefaults) {
        self.defaults = defaults
    }
    
    init() {
        self.defaults = UserDefaults.standard
    }
    
    
    // MARK: - Properties
    
    var token: String? {
        get {
            let key = defaults.string(forKey: DefaultsKeys.TokenKey.rawValue)
            return key
        }
        set(newToken) {
            defaults.set(newToken, forKey: DefaultsKeys.TokenKey.rawValue)
        }
    }
    
    var refreshToken: String? {
        get {
            let key = defaults.string(forKey: DefaultsKeys.RefreshToken.rawValue)
            return key
        }
        set(newToken) {
            defaults.set(newToken, forKey: DefaultsKeys.RefreshToken.rawValue)
        }
    }
    
    var expiry: Date? {
        get {
            return defaults.object(forKey: DefaultsKeys.RefreshToken.rawValue) as? Date
        }
        set(newExpiry) {
            defaults.set(newExpiry, forKey: DefaultsKeys.RefreshToken.rawValue)
        }
    }
    
    var expired: Bool {
        if let expiry = expiry {
            return expiry.isInPast
        }
        return true
    }
    
}
