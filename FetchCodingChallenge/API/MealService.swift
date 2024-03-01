//
//  MealService.swift
//  FetchCodingChallenge
//
//  Created by Carson Gross on 2/29/24.
//

@preconcurrency import UIKit

/// Primary API Service object to get meal data
actor MealService {
    /// Shared singleton instance
    static let shared = MealService()
    
    private init() {}
    
    /// An `NSCache` for storing request data in memory
    private let cache = NSCache<NSString, CacheEntry>()
    
    enum MealServiceError: Error {
        case failedToCreateRequest, failedToGetData, urlError
    }
    
    /// A function to execute a `MealRequest` and caches it in memory
    /// - Parameter request: A `MealRequest` to execute
    /// - Returns: A generic codable type
    public func execute<T: Codable>(_ request: MealRequest) async throws -> T {
        guard let url = request.url else { throw MealServiceError.urlError }
        let urlString = url.absoluteString as NSString
        
        if let item = cache.object(forKey: urlString)?.item {
            let data = switch item {
            case .inProgress(let task):
                try await task.value
            case .ready(let data):
                data
            }
            return try JSONDecoder().decode(T.self, from: data)
        }
        
        let task = Task {
            return try await loadData(from: request)
        }
        
        cache.setObject(CacheEntry(item: .inProgress(task)), forKey: urlString)
        
        do {
            let data = try await task.value
            let result = try JSONDecoder().decode(T.self, from: data)
            cache.setObject(CacheEntry(item: .ready(data)), forKey: urlString)
            return result
        } catch {
            cache.removeObject(forKey: urlString)
            throw error
        }
    }
    
    // MARK: Private Helpers
    
    private func request(from mealRequest: MealRequest) -> URLRequest? {
        guard let url = mealRequest.url else {
            return nil
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = mealRequest.httpMethod
        return request
    }
    
    private func loadData(from mealRequest: MealRequest) async throws -> Data {
        guard let urlRequest = self.request(from: mealRequest) else {
            throw MealServiceError.failedToCreateRequest
        }
        
        let (data, _) = try await URLSession.shared.data(for: urlRequest)
        return data
    }
}

// MARK: Cache Entry

extension MealService {
    private enum CacheEntryItem {
        case ready(Data)
        case inProgress(Task<Data, Error>)
    }
    
    private class CacheEntry {
        let item: CacheEntryItem
        
        init(item: CacheEntryItem) {
            self.item = item
        }
    }
}
