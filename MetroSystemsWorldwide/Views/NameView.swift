//
//  NameView.swift
//  MetroSystemsWorldwide
//
//  Created by Jinwook Kim on 2023/06/14.
//

import SwiftUI

struct NameView: View {
    @EnvironmentObject private var metroSystemManager: MetroSystemManager
    @StateObject private var viewModel = ViewModel()
    private var filteredNames: [String] {
        viewModel.filteringNames(metroSystemManager.names)
    }
    private var filteredNamesCount: Int {
        filteredNames.count
    }
    var body: some View {
        List(filteredNames, id: \.self) { name in
            Text(name)
        }
        .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always))
        .navigationTitle("Search by names (\(filteredNamesCount))")
    }
}

struct NameView_Previews: PreviewProvider {
    static var previews: some View {
        NameView()
            .environmentObject(MetroSystemManager())
    }
}
