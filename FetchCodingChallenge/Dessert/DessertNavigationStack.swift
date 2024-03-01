//
//  DessertNavigationStack.swift
//  FetchCodingChallenge
//
//  Created by Carson Gross on 2/29/24.
//

import SwiftUI

struct DessertNavigationStack: View {
    @State private var viewModel = DessertViewModel()
    
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
