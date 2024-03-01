//
//  Meal.swift
//  FetchCodingChallenge
//
//  Created by Carson Gross on 2/29/24.
//

import Foundation

struct Meal: Codable, Identifiable, Equatable, MealPreview {
    let id: String
    let strMeal: String
    let strDrinkAlternate: String?
    let strCategory: String?
    let strArea: String?
    let strInstructions: String?
    let strMealThumb: String?
    let strTags: String?
    let strYoutube: String?
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    let strIngredient16: String?
    let strIngredient17: String?
    let strIngredient18: String?
    let strIngredient19: String?
    let strIngredient20: String?
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    let strMeasure10: String?
    let strMeasure11: String?
    let strMeasure12: String?
    let strMeasure13: String?
    let strMeasure14: String?
    let strMeasure15: String?
    let strMeasure16: String?
    let strMeasure17: String?
    let strMeasure18: String?
    let strMeasure19: String?
    let strMeasure20: String?
    let strSource: String?
    let strImageSource: String?
    let strCreativeCommonsConfirmed: String?
    let dateModified: String?
}

// MARK: Computed Properties

extension Meal {
    var formattedIngredients: [String] {
        [
            strMeasure1.safelyUnwrapped + " " + strIngredient1.safelyUnwrapped,
            strMeasure2.safelyUnwrapped + " " + strIngredient2.safelyUnwrapped,
            strMeasure3.safelyUnwrapped + " " + strIngredient3.safelyUnwrapped,
            strMeasure4.safelyUnwrapped + " " + strIngredient4.safelyUnwrapped,
            strMeasure5.safelyUnwrapped + " " + strIngredient5.safelyUnwrapped,
            strMeasure6.safelyUnwrapped + " " + strIngredient6.safelyUnwrapped,
            strMeasure7.safelyUnwrapped + " " + strIngredient7.safelyUnwrapped,
            strMeasure8.safelyUnwrapped + " " + strIngredient8.safelyUnwrapped,
            strMeasure9.safelyUnwrapped + " " + strIngredient9.safelyUnwrapped,
            strMeasure10.safelyUnwrapped + " " + strIngredient10.safelyUnwrapped,
            strMeasure11.safelyUnwrapped + " " + strIngredient11.safelyUnwrapped,
            strMeasure12.safelyUnwrapped + " " + strIngredient12.safelyUnwrapped,
            strMeasure13.safelyUnwrapped + " " + strIngredient13.safelyUnwrapped,
            strMeasure14.safelyUnwrapped + " " + strIngredient14.safelyUnwrapped,
            strMeasure15.safelyUnwrapped + " " + strIngredient15.safelyUnwrapped,
            strMeasure16.safelyUnwrapped + " " + strIngredient16.safelyUnwrapped,
            strMeasure17.safelyUnwrapped + " " + strIngredient17.safelyUnwrapped,
            strMeasure18.safelyUnwrapped + " " + strIngredient18.safelyUnwrapped,
            strMeasure19.safelyUnwrapped + " " + strIngredient19.safelyUnwrapped,
            strMeasure20.safelyUnwrapped + " " + strIngredient20.safelyUnwrapped
        ].filter { $0.count > 2 }
    }
}

// MARK: CodingKeys

extension Meal {
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case strMeal = "strMeal"
        case strDrinkAlternate = "strDrinkAlternate"
        case strCategory = "strCategory"
        case strArea = "strArea"
        case strInstructions = "strInstructions"
        case strMealThumb = "strMealThumb"
        case strTags = "strTags"
        case strYoutube = "strYoutube"
        case strIngredient1 = "strIngredient1"
        case strIngredient2 = "strIngredient2"
        case strIngredient3 = "strIngredient3"
        case strIngredient4 = "strIngredient4"
        case strIngredient5 = "strIngredient5"
        case strIngredient6 = "strIngredient6"
        case strIngredient7 = "strIngredient7"
        case strIngredient8 = "strIngredient8"
        case strIngredient9 = "strIngredient9"
        case strIngredient10 = "strIngredient10"
        case strIngredient11 = "strIngredient11"
        case strIngredient12 = "strIngredient12"
        case strIngredient13 = "strIngredient13"
        case strIngredient14 = "strIngredient14"
        case strIngredient15 = "strIngredient15"
        case strIngredient16 = "strIngredient16"
        case strIngredient17 = "strIngredient17"
        case strIngredient18 = "strIngredient18"
        case strIngredient19 = "strIngredient19"
        case strIngredient20 = "strIngredient20"
        case strMeasure1 = "strMeasure1"
        case strMeasure2 = "strMeasure2"
        case strMeasure3 = "strMeasure3"
        case strMeasure4 = "strMeasure4"
        case strMeasure5 = "strMeasure5"
        case strMeasure6 = "strMeasure6"
        case strMeasure7 = "strMeasure7"
        case strMeasure8 = "strMeasure8"
        case strMeasure9 = "strMeasure9"
        case strMeasure10 = "strMeasure10"
        case strMeasure11 = "strMeasure11"
        case strMeasure12 = "strMeasure12"
        case strMeasure13 = "strMeasure13"
        case strMeasure14 = "strMeasure14"
        case strMeasure15 = "strMeasure15"
        case strMeasure16 = "strMeasure16"
        case strMeasure17 = "strMeasure17"
        case strMeasure18 = "strMeasure18"
        case strMeasure19 = "strMeasure19"
        case strMeasure20 = "strMeasure20"
        case strSource = "strSource"
        case strImageSource = "strImageSource"
        case strCreativeCommonsConfirmed = "strCreativeCommonsConfirmed"
        case dateModified = "dateModified"
    }
}

// MARK: Preview

extension Meal {
    static let previewMeal = Meal(
        id: "52893",
        strMeal: "Apple & Blackberry Crumble",
        strDrinkAlternate: nil,
        strCategory: "Dessert",
        strArea: "British",
        strInstructions: "Heat oven to 190C\\/170C fan\\/gas 5. Tip the flour and sugar into a large bowl. Add the butter, then rub into the flour using your fingertips to make a light breadcrumb texture. Do not overwork it or the crumble will become heavy. Sprinkle the mixture evenly over a baking sheet and bake for 15 mins or until lightly coloured.\\r\\nMeanwhile, for the compote, peel, core and cut the apples into 2cm dice. Put the butter and sugar in a medium saucepan and melt together over a medium heat. Cook for 3 mins until the mixture turns to a light caramel. Stir in the apples and cook for 3 mins. Add the blackberries and cinnamon, and cook for 3 mins more. Cover, remove from the heat, then leave for 2-3 mins to continue cooking in the warmth of the pan.\\r\\nTo serve, spoon the warm fruit into an ovenproof gratin dish, top with the crumble mix, then reheat in the oven for 5-10 mins. Serve with vanilla ice cream.",
        strMealThumb: "https:\\/\\/www.themealdb.com\\/images\\/media\\/meals\\/xvsurr1511719182.jpg",
        strTags: "Pudding",
        strYoutube: "https:\\/\\/www.youtube.com\\/watch?v=4vhcOwVBDO4",
        strIngredient1: "Plain Flour",
        strIngredient2: "Caster Sugar",
        strIngredient3: "Butter",
        strIngredient4: "Braeburn Apples",
        strIngredient5: "Butter",
        strIngredient6: "Demerara Sugar",
        strIngredient7: "Blackberrys",
        strIngredient8: "Cinnamon",
        strIngredient9: "Ice Cream",
        strIngredient10: "",
        strIngredient11: "",
        strIngredient12: "",
        strIngredient13: "",
        strIngredient14: "",
        strIngredient15: "",
        strIngredient16: "",
        strIngredient17: "",
        strIngredient18: "",
        strIngredient19: "",
        strIngredient20: "",
        strMeasure1: "120g",
        strMeasure2: "60g",
        strMeasure3: "60g",
        strMeasure4: "300g",
        strMeasure5: "30g",
        strMeasure6: "30g",
        strMeasure7: "120g",
        strMeasure8: "\\u00bc teaspoon",
        strMeasure9: "to serve",
        strMeasure10: "",
        strMeasure11: "",
        strMeasure12: "",
        strMeasure13: "",
        strMeasure14: "",
        strMeasure15: "",
        strMeasure16: "",
        strMeasure17: "",
        strMeasure18: "",
        strMeasure19: "",
        strMeasure20: "",
        strSource: "https:\\/\\/www.bbcgoodfood.com\\/recipes\\/778642\\/apple-and-blackberry-crumble",
        strImageSource: nil,
        strCreativeCommonsConfirmed: nil,
        dateModified: nil
    )
}

// MARK: MealPreview

protocol MealPreview {
    var id: String { get }
    var strMeal: String { get }
    var strMealThumb: String? { get }
}
