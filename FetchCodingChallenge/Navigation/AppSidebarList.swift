//
//  AppSidebarList.swift
//  FetchCodingChallenge
//
//  Created by Carson Gross on 3/1/24.
//

import SwiftUI

struct AppSidebarList: View {
    @Environment(DessertViewModel.self) private var viewModel
    @Binding var selection: MealListItem?
    
    var body: some View {
        @Bindable var viewModel = viewModel
        List(viewModel.listedDesserts, selection: $selection) { dessert in
            NavigationLink(value: dessert) {
                DessertRow(dessert)
            }
        }
        .searchable(text: $viewModel.searchText)
        .navigationTitle("Desserts")
    }
}

#Preview {
    NavigationSplitView {
        AppSidebarList(selection: .constant(nil))
    } detail: {
        Text("Check out that sidebar!")
    }

}
