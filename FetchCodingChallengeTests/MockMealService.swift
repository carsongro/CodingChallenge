//
//  MockMealService.swift
//  FetchCodingChallengeTests
//
//  Created by Carson Gross on 3/12/24.
//

import Foundation
@testable import FetchCodingChallenge

final class MockMealService: MealServiceProtocol, Mockable {
    func execute<T: Codable>(_ request: FetchCodingChallenge.MealRequest) async throws -> T {
        loadJSON(filename: "MealCategoryResponse", type: T.self)
    }
}
