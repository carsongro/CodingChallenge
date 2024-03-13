//
//  MealService.swift
//  FetchCodingChallenge
//
//  Created by Carson Gross on 2/29/24.
//

@preconcurrency import UIKit

protocol MealServiceProtocol {
    func execute<T: Codable>(_ request: MealRequest) async throws -> T
}

/// Primary API Service object to get meal data
struct MealService: MealServiceProtocol, Sendable {
    
    /// An `NSCache` for storing request data in memory
    private let cache = MealServiceCache()
    
    /// A function to execute a `MealRequest` and caches it in memory
    /// - Parameter request: A `MealRequest` to execute
    /// - Returns: A generic codable type
    public func execute<T: Codable>(_ request: MealRequest) async throws -> T {
        guard let url = request.url else { throw MealServiceError.urlError }
        let urlString = url.absoluteString
        
        if let item = await cache.object(forKey: urlString)?.item {
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
        
        await cache.setObject(CacheEntry(item: .inProgress(task)), forKey: urlString)
        
        do {
            let data = try await task.value
            let result = try JSONDecoder().decode(T.self, from: data)
            await cache.setObject(CacheEntry(item: .ready(data)), forKey: urlString)
            return result
        } catch {
            await cache.removeObject(forKey: urlString)
            throw error
        }
    }
    
    // MARK: Helpers
    
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

enum MealServiceError: Error {
    case failedToCreateRequest, failedToGetData, urlError
}
