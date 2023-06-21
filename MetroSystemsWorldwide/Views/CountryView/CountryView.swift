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
    private var filteredCountries: [String] {
        viewModel.filteringCountries(metroSystemManager.countries)
    }
    private var filteredCountriesCount: Int {
        filteredCountries.count
    }
    var body: some View {
        List(filteredCountries, id: \.self) { country in
            NavigationLink {
                CountryDetailView(country: country)
            } label: {
                CountryRow(countryName: country, numberOfMetroSystems: metroSystemManager.metroSystemsIn(country: country).count)
            }
        }
        .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always))
        .autocorrectionDisabled()
        .navigationTitle("Search by countries (\(filteredCountriesCount))")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CountryView_Previews: PreviewProvider {
    static var previews: some View {
        CountryView()
            .environmentObject(MetroSystemManager())
    }
}
