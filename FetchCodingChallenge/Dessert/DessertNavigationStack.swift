//
//  DessertNavigationStack.swift
//  FetchCodingChallenge
//
//  Created by Carson Gross on 2/29/24.
//

import SwiftUI

struct DessertNavigationStack: View {
    @Environment(DessertViewModel.self) private var viewModel
    
    var body: some View {
        NavigationStack {
            DessertListView()
                .environment(viewModel)
                .navigationTitle("Desserts")
                .navigationDestination(for: MealListItem.self) { item in
                    DessertDetailView(dessertItem: item)
                        .environment(viewModel)
                }
        }
    }
}

#Preview {
    DessertNavigationStack()
}
