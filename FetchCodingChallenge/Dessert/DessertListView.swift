//
//  DessertListView.swift
//  FetchCodingChallenge
//
//  Created by Carson Gross on 2/29/24.
//

import SwiftUI

struct DessertListView: View {
    @Environment(DessertViewModel.self) private var viewModel
    
    var body: some View {
        @Bindable var viewModel = viewModel
        if viewModel.desserts.isEmpty {
            ProgressView()
        } else {
            List(viewModel.listedDesserts) { dessert in
                DessertRow(dessert)
            }
            .listStyle(.plain)
            .searchable(text: $viewModel.searchText)
        }
    }
}

#Preview {
    DessertListView()
}
