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
        case baseURL = "https://themealdb.com/api/json/v1/1"
    }
    
    /// Desired endpoint
    let endpoint: MealEndpoint
    
    /// Path components for API if any
    private let pathComponents: [String]
    
    /// Query arguments for API if any
    private let queryParameters: [URLQueryItem]
    
    /// Constructed `String` url for the API request
    private var urlString: String {
        var string = Constants.baseURL.rawValue
        string += "/"
        string += endpoint.rawValue
        
        if !pathComponents.isEmpty {
            pathComponents.forEach { string += "/\($0)" }
        }
        
        if !queryParameters.isEmpty {
            string += "?"
            let argumentString = queryParameters.compactMap {
                guard let value = $0.value else { return nil }
                return "\($0.name)=\(value)"
            }.joined(separator: "&")
            
            string += argumentString
        }
        
        return string
    }
    
    /// Computed & constructed API URL
    public var url: URL? {
        URL(string: urlString)
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
        pathComponents: [String] = [],
        queryParameters: [URLQueryItem] = []
    ) {
        self.endpoint = endpoint
        self.pathComponents = pathComponents
        self.queryParameters = queryParameters
    }
    
    /// Attempt to create request url to parse
    /// - Parameter url: url
    convenience init?(url: URL) {
        let string = url.absoluteString
        guard string.contains(Constants.baseURL.rawValue) else { return nil }
        let trimmed = string.replacingOccurrences(of: Constants.baseURL.rawValue + "/", with: "")
        if trimmed.contains("/") {
            let components = trimmed.components(separatedBy: "/")
            if !components.isEmpty {
                let endpointString = components[0] // Endpoint
                var pathComponents = [String]()
                if components.count > 1 {
                    pathComponents = components
                    pathComponents.removeFirst()
                }
                if let mealEndpoint = MealEndpoint(
                    rawValue: endpointString
                ) {
                    self.init(
                        endpoint: mealEndpoint,
                        pathComponents: pathComponents
                    )
                    return
                }
            }
        } else if trimmed.contains("?") {
            let components = trimmed.components(separatedBy: "?")
            if !components.isEmpty, components.count >= 2 {
                let endpointString = components[0]
                let queryItemsString = components[1]
                let queryItems: [URLQueryItem] = queryItemsString.components(separatedBy: "&").compactMap {
                    guard $0.contains("=") else {
                        return nil
                    }
                    let parts = $0.components(separatedBy: "=")
                    return URLQueryItem(
                        name: parts[0],
                        value: parts[1]
                    )
                }
                if let mealEndpoint = MealEndpoint(
                    rawValue: endpointString
                ) {
                    self.init(
                        endpoint: mealEndpoint,
                        queryParameters: queryItems
                    )
                    return
                }
            }
        }
        return nil
    }
}
