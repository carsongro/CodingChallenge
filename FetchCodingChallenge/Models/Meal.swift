//
//  Meal.swift
//  FetchCodingChallenge
//
//  Created by Carson Gross on 2/29/24.
//

import Foundation

struct Meal: Identifiable, Equatable, MealPreview {
    let id: String
    let strMeal: String
    let strInstructions: String?
    let strMealThumb: String?
    let ingredients: [Ingredient]
}

// MARK: Identifiable

extension Meal {
    static func == (lhs: Meal, rhs: Meal) -> Bool {
        lhs.id == rhs.id
    }
}

// MARK: Preview

extension Meal {
    static let previewMeal = Meal(
        id: "52893",
        strMeal: "Apple & Blackberry Crumble",
        strInstructions: "Heat oven to 190C\\/170C fan\\/gas 5. Tip the flour and sugar into a large bowl. Add the butter, then rub into the flour using your fingertips to make a light breadcrumb texture. Do not overwork it or the crumble will become heavy. Sprinkle the mixture evenly over a baking sheet and bake for 15 mins or until lightly coloured.\\r\\nMeanwhile, for the compote, peel, core and cut the apples into 2cm dice. Put the butter and sugar in a medium saucepan and melt together over a medium heat. Cook for 3 mins until the mixture turns to a light caramel. Stir in the apples and cook for 3 mins. Add the blackberries and cinnamon, and cook for 3 mins more. Cover, remove from the heat, then leave for 2-3 mins to continue cooking in the warmth of the pan.\\r\\nTo serve, spoon the warm fruit into an ovenproof gratin dish, top with the crumble mix, then reheat in the oven for 5-10 mins. Serve with vanilla ice cream.",
        strMealThumb: "https:\\/\\/www.themealdb.com\\/images\\/media\\/meals\\/xvsurr1511719182.jpg",
        ingredients: []
    )
}

// MARK: MealPreview

protocol MealPreview {
    var id: String { get }
    var strMeal: String { get }
    var strMealThumb: String? { get }
}
