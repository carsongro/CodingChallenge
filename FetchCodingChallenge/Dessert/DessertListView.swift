//
//  DessertListView.swift
//  FetchCodingChallenge
//
//  Created by Carson Gross on 2/29/24.
//

import SwiftUI

struct DessertListView: View {
    @Environment(DessertViewModel.self) private var viewModel
    
    @State private var searchText = ""
    
    private var listedDesserts: [MealListItem] {
        viewModel.desserts
            .filter { $0.matches(searchText) }
            .sorted(by: { $0.strMeal.localizedCompare($1.strMeal) == .orderedAscending })
    }
    
    var body: some View {
        if viewModel.desserts.isEmpty {
            ProgressView()
        } else {
            List(listedDesserts) { dessert in
                DessertRow(dessert)
            }
            .listStyle(.plain)
            .searchable(text: $searchText)
        }
    }
}

#Preview {
    DessertListView()
}
