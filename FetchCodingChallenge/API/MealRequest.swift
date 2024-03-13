//
//  MealRequest.swift
//  FetchCodingChallenge
//
//  Created by Carson Gross on 2/29/24.
//

import Foundation

/// Object that represents a single API Call
final class MealRequest: Sendable {
    /// A `String` of the base meals db url
    private enum Constants: String {
        case baseURL = "https://themealdb.com/api/json/v1/1/"
    }
    
    /// Desired endpoint
    let endpoint: MealEndpoint
    
    /// Query arguments for API if any
    private let queryParameters: [URLQueryItem]
    
    /// Computed & constructed API URL
    public var url: URL? {
        var components = URLComponents(string: Constants.baseURL.rawValue + endpoint.rawValue)
        components?.queryItems = queryParameters
        return components?.url
    }
    
    /// Desired http method, the only option is GET for the mealsdb API
    public let httpMethod = "GET"
    
    /// Construct request
    /// - Parameters:
    ///   - endpoint: Target endpoint
    ///   - pathComponents: Collection of path components
    ///   - queryParameters: Collection of query parameters
    public init(
        endpoint: MealEndpoint,
        queryParameters: [URLQueryItem] = []
    ) {
        self.endpoint = endpoint
        self.queryParameters = queryParameters
    }
}
