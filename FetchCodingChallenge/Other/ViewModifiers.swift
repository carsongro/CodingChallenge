//
//  ViewModifiers.swift
//  FetchCodingChallenge
//
//  Created by Carson Gross on 2/29/24.
//

import SwiftUI

struct DessertListRowImage: ViewModifier {
    func body(content: Content) -> some View {
        let imageClipShape = RoundedRectangle(cornerRadius: 10, style: .continuous)
        content
            .aspectRatio(contentMode: .fill)
            .frame(width: 60, height: 60)
            .clipShape(imageClipShape)
            .contentShape(imageClipShape)
            .accessibilityHidden(true)
    }
}

extension View {
    func dessertListRowImage() -> some View {
        modifier(DessertListRowImage())
    }
}
