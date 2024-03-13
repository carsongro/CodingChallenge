//
//  DessertViewModel.swift
//  FetchCodingChallenge
//
//  Created by Carson Gross on 2/29/24.
//

import Foundation

@Observable 
class DessertViewModel: @unchecked Sendable {
    var desserts = [MealListItem]()
    var searchText = ""
    
    var listedDesserts: [MealListItem] {
        desserts
            .filter { $0.matches(searchText) }
            .sorted(by: { $0.strMeal.localizedCompare($1.strMeal) == .orderedAscending })
    }
    
    private let mealService: MealServiceProtocol
    
    init(mealService: MealServiceProtocol = MealService()) {
        self.mealService = mealService
        
        Task {
            await getDessertList()
        }
    }
    
    func getDessertList() async {
        let request = MealRequest(
            endpoint: .filter,
            queryParameters: [URLQueryItem(name: "c", value: "Dessert")]
        )
        
        do {
            let result: MealCategoryResponse = try await mealService.execute(request)
            
            Task { @MainActor in
                desserts = result.meals.sorted(by: { $0.strMeal < $1.strMeal })
            }
        } catch {
            print("Error loading dessert list: \(error.localizedDescription)")
        }
    }
    
    func getDessert(_ id: String) async throws -> Meal? {
        let request = MealRequest(
            endpoint: .lookup,
            queryParameters: [URLQueryItem(name: "i", value: id)]
        )
        
        let result: MealLookupResponse = try await mealService.execute(request)
        let detail: MealDetailResponse = result.meals[0]
        return Meal(
            id: detail.id,
            strMeal: detail.strMeal,
            strInstructions: detail.strInstructions,
            strMealThumb: detail.strMealThumb,
            ingredients: Array(Set([
                Ingredient(measurement: detail.strMeasure1.safelyUnwrapped, name: detail.strIngredient1.safelyUnwrapped),
                Ingredient(measurement: detail.strMeasure2.safelyUnwrapped, name: detail.strIngredient2.safelyUnwrapped),
                Ingredient(measurement: detail.strMeasure3.safelyUnwrapped, name: detail.strIngredient3.safelyUnwrapped),
                Ingredient(measurement: detail.strMeasure4.safelyUnwrapped, name: detail.strIngredient4.safelyUnwrapped),
                Ingredient(measurement: detail.strMeasure5.safelyUnwrapped, name: detail.strIngredient5.safelyUnwrapped),
                Ingredient(measurement: detail.strMeasure6.safelyUnwrapped, name: detail.strIngredient6.safelyUnwrapped),
                Ingredient(measurement: detail.strMeasure7.safelyUnwrapped, name: detail.strIngredient7.safelyUnwrapped),
                Ingredient(measurement: detail.strMeasure8.safelyUnwrapped, name: detail.strIngredient8.safelyUnwrapped),
                Ingredient(measurement: detail.strMeasure9.safelyUnwrapped, name: detail.strIngredient9.safelyUnwrapped),
                Ingredient(measurement: detail.strMeasure10.safelyUnwrapped, name: detail.strIngredient10.safelyUnwrapped),
                Ingredient(measurement: detail.strMeasure11.safelyUnwrapped, name: detail.strIngredient11.safelyUnwrapped),
                Ingredient(measurement: detail.strMeasure12.safelyUnwrapped, name: detail.strIngredient12.safelyUnwrapped),
                Ingredient(measurement: detail.strMeasure13.safelyUnwrapped, name: detail.strIngredient13.safelyUnwrapped),
                Ingredient(measurement: detail.strMeasure14.safelyUnwrapped, name: detail.strIngredient14.safelyUnwrapped),
                Ingredient(measurement: detail.strMeasure15.safelyUnwrapped, name: detail.strIngredient15.safelyUnwrapped),
                Ingredient(measurement: detail.strMeasure16.safelyUnwrapped, name: detail.strIngredient16.safelyUnwrapped),
                Ingredient(measurement: detail.strMeasure17.safelyUnwrapped, name: detail.strIngredient17.safelyUnwrapped),
                Ingredient(measurement: detail.strMeasure18.safelyUnwrapped, name: detail.strIngredient18.safelyUnwrapped),
                Ingredient(measurement: detail.strMeasure19.safelyUnwrapped, name: detail.strIngredient19.safelyUnwrapped),
                Ingredient(measurement: detail.strMeasure20.safelyUnwrapped, name: detail.strIngredient20.safelyUnwrapped)
            ]))
        )
    }
}
