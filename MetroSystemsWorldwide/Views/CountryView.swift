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
                HStack(spacing: 10) {
                    Image(country.removingSpaces())
                        .resizable()
                        .frame(width: 60, height: 40)
                    VStack(alignment: .leading) {
                        Text(country)
                        Text("^[\(metroSystemManager.metroSystems(in: country).count) Metro \("System")](inflect: true)")
                            .font(.callout)
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.vertical, 5)
            }
        }
        .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always))
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
