//
//  CityView.swift
//  MetroSystemsWorldwide
//
//  Created by Jinwook Kim on 2023/06/14.
//

import SwiftUI

struct CityView: View {
    @EnvironmentObject private var metroSystemManager: MetroSystemManager
    @StateObject private var viewModel = ViewModel()
    private var filteredCities: [String] {
        viewModel.filteringCities(metroSystemManager.cities)
    }
    private var filteredCitiesCount: Int {
        filteredCities.count
    }
    var body: some View {
        List(filteredCities, id: \.self) { city in
            NavigationLink(city) {
                CityDetailView(city: city)
            }
        }
        .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always))
        .autocorrectionDisabled()
        .navigationTitle("Search by cities (\(filteredCitiesCount))")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CityView_Previews: PreviewProvider {
    static var previews: some View {
        CityView()
            .environmentObject(MetroSystemManager())
    }
}
