//
//  AppDetailColumn.swift
//  FetchCodingChallenge
//
//  Created by Carson Gross on 3/1/24.
//

import SwiftUI

struct AppDetailColumn: View {
    var selection: MealListItem?
    
    var body: some View {
        Group {
            if let selection {
                DessertDetailView(dessertItem: selection)
            } else {
                ContentUnavailableView("Select a Dessert", systemImage: "fork.knife", description: Text("Pick something from the list."))
            }
        }
    }
}

#Preview {
    AppDetailColumn()
}
