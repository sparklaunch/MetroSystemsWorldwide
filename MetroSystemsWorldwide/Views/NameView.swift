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
    var body: some View {
        List(viewModel.filteringNames(metroSystemManager.names), id: \.self) { name in
            Text(name)
        }
        .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always))
        .navigationTitle("Search by names (\(viewModel.filteringNames(metroSystemManager.names).count))")
    }
}

struct NameView_Previews: PreviewProvider {
    static var previews: some View {
        NameView()
            .environmentObject(MetroSystemManager())
    }
}
