//
//  CityViewModel.swift
//  MetroSystemsWorldwide
//
//  Created by Jinwook Kim on 2023/06/14.
//

import SwiftUI

extension CityView {
    @MainActor class ViewModel: ObservableObject {
        @Published var searchText = ""
        func filteringCities(_ cities: [String]) -> [String] {
            if searchText.isEmpty {
                return cities
            }
            return cities.filter { city in
                city.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
}
