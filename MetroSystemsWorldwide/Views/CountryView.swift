//
//  CountryView.swift
//  MetroSystemsWorldwide
//
//  Created by Jinwook Kim on 2023/06/14.
//

import SwiftUI

struct CountryView: View {
    @EnvironmentObject private var metroSystemManager: MetroSystemManager
    @StateObject private var viewModel = ViewModel()
    var body: some View {
        List(viewModel.filteringCountries(metroSystemManager.countries), id: \.self) { country in
            NavigationLink(country) {
                CountryDetailView(country: country)
            }
        }
        .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always))
        .navigationTitle("Search by countries (\(viewModel.filteringCountries(metroSystemManager.countries).count))")
    }
}

struct CountryView_Previews: PreviewProvider {
    static var previews: some View {
        CountryView()
            .environmentObject(MetroSystemManager())
    }
}
