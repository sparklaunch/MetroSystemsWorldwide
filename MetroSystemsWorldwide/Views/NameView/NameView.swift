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
        List(viewModel.filteringMetroSystems()) { metroSystem in
            NavigationLink {
                MetroSystemView(metroSystem: metroSystem)
            } label: {
                MetroSystemRow(name: metroSystem.name)
            }
        }
        .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always))
        .autocorrectionDisabled()
        .navigationTitle("Search by names (\(viewModel.filteringMetroSystems().count))")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.metroSystems = metroSystemManager.metroSystems
        }
    }
}

struct NameView_Previews: PreviewProvider {
    static var previews: some View {
        NameView()
            .environmentObject(MetroSystemManager())
    }
}
