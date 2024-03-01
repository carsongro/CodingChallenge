//
//  MealListItem.swift
//  FetchCodingChallenge
//
//  Created by Carson Gross on 2/29/24.
//

import Foundation

struct MealListItem: Codable, Identifiable, Hashable, MealPreview {
    let id: String
    let strMeal: String
    let strMealThumb: String
}

// MARK: CodingKeys

extension MealListItem {
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case strMeal = "strMeal"
        case strMealThumb = "strMealThumb"
    }
}

// MARK: Preview

extension MealListItem {
    static let previewData = MealListItem(
        id: "Apam balik",
        strMeal: "https:\\/\\/www.themealdb.com\\/images\\/media\\/meals\\/adxcbq1619787919.jpg",
        strMealThumb: "53049"
    )
}

// MARK: Search

extension MealListItem {
    func matches(_ string: String) -> Bool {
        string.isEmpty ||
        strMeal.localizedCaseInsensitiveContains(string)
    }
}
