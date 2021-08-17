//
//  PersistanceManager.swift
//  TheStocksApp
//
//  Created by Richard Price on 17/08/2021.
//

import Foundation
//step 5 this class will manage all things for persistance during life cycle
final class PersistanceManager {

    private init() {}
    
    static let shared = PersistanceManager()
    private let userDefaults: UserDefaults = .standard
    
    private struct Constants {
        
    }

    public var watchlist: [String] {
        return []
    }
    
    public var hasOnBoarded: Bool {
        return false
    }
    
    public func addToWatchList() {
        
    }
    
    public func removeFromWatchList() {
        
    }
}
