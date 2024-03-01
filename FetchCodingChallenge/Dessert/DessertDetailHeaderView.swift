//
//  DessertDetailHeaderView.swift
//  FetchCodingChallenge
//
//  Created by Carson Gross on 2/29/24.
//

import SwiftUI
import IoImage

struct DessertDetailHeaderView: View {
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    
    let dessert: MealPreview
    
    var body: some View {
        Group {
            if horizontalSizeClass == .compact {
                fullBleedContent
            } else {
                wideContent
            }
        }
    }
    
    private var fullBleedContent: some View {
        IoImageView(url: URL(string: dessert.strMealThumb))
            .resizable()
            .placeholder {
                Color(.systemGroupedBackground)
                    .frame(width: 220, height: 250)
                    .clipped()
                    .accessibilityHidden(true)
            }
            .aspectRatio(contentMode: .fit)
            .accessibilityHidden(true)
    }
    
    let wideClipShape = RoundedRectangle(cornerRadius: 20, style: .continuous)
    private var wideContent: some View {
        IoImageView(url: URL(string: dessert.strMealThumb))
            .resizable()
            .placeholder {
                Color(.systemGroupedBackground)
                    .frame(width: 220, height: 250)
                    .clipped()
                    .accessibilityHidden(true)
            }
            .aspectRatio(contentMode: .fit)
            .frame(width: 220, height: 250)
            .clipped()
            .accessibilityHidden(true)
            .overlay {
                wideClipShape.strokeBorder(.quaternary, lineWidth: 0.5)
            }
            .padding()
    }
}

#Preview {
    DessertDetailHeaderView(dessert: Meal.previewMeal)
}
