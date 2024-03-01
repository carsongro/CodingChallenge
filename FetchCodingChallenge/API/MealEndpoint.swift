//
//  MealEndpoint.swift
//  FetchCodingChallenge
//
//  Created by Carson Gross on 2/29/24.
//

import Foundation

@frozen enum MealEndpoint: String, CaseIterable, Hashable {
    /// Endpoint to filter results
    case filter = "filter.php"
    /// Endpoint to lookup an item
    case lookup = "lookup.php"
}
