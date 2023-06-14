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
    var body: some View {
        List(viewModel.filteringCities(metroSystemManager.cities), id: \.self) { city in
            Text(city)
        }
        .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always))
        .navigationTitle("Search by cities (\(viewModel.filteringCities(metroSystemManager.cities).count))")
    }
}

struct CityView_Previews: PreviewProvider {
    static var previews: some View {
        CityView()
            .environmentObject(MetroSystemManager())
    }
}
