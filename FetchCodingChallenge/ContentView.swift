//
//  ContentView.swift
//  FetchCodingChallenge
//
//  Created by Carson Gross on 2/29/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.prefersTabNavigation) private var prefersTabNavigation
    @State private var selection: MealListItem? = nil
    @State private var viewModel = DessertViewModel()
    
    var body: some View {
        Group {
            if prefersTabNavigation {
                DessertNavigationStack()
            } else {
                NavigationSplitView {
                    AppSidebarList(selection: $selection)
                } detail: {
                    AppDetailColumn(selection: selection)
                }
            }
        }
        .environment(viewModel)
    }
}

#Preview {
    ContentView()
}
