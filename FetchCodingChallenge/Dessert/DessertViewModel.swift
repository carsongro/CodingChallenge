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
    
    private let mealService: MealService
    
    init(mealService: MealService = MealService.shared) {
        self.mealService = mealService
        
        getDessertList()
    }
    
    func getDessertList() {
        Task {
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
    }
    
    func getDessert(_ id: String) async throws -> Meal? {
        let request = MealRequest(
            endpoint: .lookup,
            queryParameters: [URLQueryItem(name: "i", value: id)]
        )
        
        let result: MealLookupResponse = try await mealService.execute(request)
        return result.meals.first
    }
}
