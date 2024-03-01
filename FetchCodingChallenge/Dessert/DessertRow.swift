//
//  DessertRow.swift
//  FetchCodingChallenge
//
//  Created by Carson Gross on 2/29/24.
//

import SwiftUI
import IoImage

struct DessertRow: View {
    let dessert: MealListItem
    
    init(_ dessert: MealListItem) {
        self.dessert = dessert
    }
    
    var body: some View {
        NavigationLink(value: dessert) {
            HStack {
                IoImageView(url: URL(string: dessert.strMealThumb.safelyUnwrapped))
                    .resizable()
                    .placeholder {
                        Image(systemName: "fork.knife.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .dessertListRowImage()
                            .accessibilityHidden(true)
                    }
                    .aspectRatio(contentMode: .fit)
                    .dessertListRowImage()
                    .accessibilityHidden(true)

                Text(dessert.strMeal)
            }
        }
    }
}

#Preview {
    DessertRow(MealListItem.previewData)
}
