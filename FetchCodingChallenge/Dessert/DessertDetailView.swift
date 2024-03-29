//
//  DessertDetailView.swift
//  FetchCodingChallenge
//
//  Created by Carson Gross on 2/29/24.
//

import SwiftUI

struct DessertDetailView: View, @unchecked Sendable {
    @Environment(DessertViewModel.self) private var viewModel
    
    let dessertItem: MealListItem
    
    @State private var dessert: Meal?
    @State private var showingError = false
    
    var body: some View {
        Group {
            List {
                Section { } header: { DessertDetailHeaderView(dessert: dessertItem).listRowSeparator(.hidden)}
                
                if let dessert {
                    if let instructions = dessert.strInstructions {
                        Section {
                            Text(instructions)
                        } header: { Text("Instructions") }
                    }
                    
                    if !dessert.ingredients.isEmpty {
                        Section {
                            ForEach(Array(dessert.ingredients.filter { !$0.name.isEmpty }.enumerated()), id: \.offset) { _, ingredient in
                                Text(ingredient.measurement + " " + ingredient.name)
                            }
                        } header: { Text("Ingredients") }
                    }
                } else if showingError {
                    ContentUnavailableView {
                        Text("Error fetching dessert")
                    } description: {
                        Text("There was an error fetching the dessert")
                    } actions: {
                        Button("Retry", systemImage: "arrow.clockwise", action: getDessert)
                    }
                }
            }
        }
        .navigationTitle(dessertItem.strMeal)
        .task(id: dessertItem.id) {
            getDessert()
        }
    }
    
    private func getDessert() {
        Task {
            do {
                let dessert = try await viewModel.getDessert(dessertItem.id)
                Task { @MainActor in
                    withAnimation { self.dessert = dessert }
                    showingError = false
                }
            } catch {
                print("Error fetching dessert: \(error.localizedDescription)")
                showingError = true
            }
        }
    }
}

#Preview {
    DessertDetailView(dessertItem: MealListItem.previewData)
        .environment(DessertViewModel())
}
