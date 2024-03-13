//
//  MealServiceCache.swift
//  FetchCodingChallenge
//
//  Created by Carson Gross on 3/12/24.
//

import Foundation

actor MealServiceCache {
    private let cache = NSCache<NSString, CacheEntry>()
    
    func object(forKey key: String) -> CacheEntry? {
        cache.object(forKey: key as NSString)
    }

    func setObject(_ obj: CacheEntry, forKey key: String) {
        cache.setObject(obj, forKey: key as NSString)
    }

    func removeObject(forKey key: String) {
        cache.removeObject(forKey: key as NSString)
    }
}
