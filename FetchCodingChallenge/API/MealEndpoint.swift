//
//  MealEndpoint.swift
//  FetchCodingChallenge
//
//  Created by Carson Gross on 2/29/24.
//

import Foundation

enum MealEndpoint: String, CaseIterable {
    /// Endpoint to filter results
    case filter = "filter.php"
    /// Endpoint to lookup an item
    case lookup = "lookup.php"
}
