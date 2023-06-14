//
//  CountryViewModel.swift
//  MetroSystemsWorldwide
//
//  Created by Jinwook Kim on 2023/06/14.
//

import SwiftUI

extension CountryView {
    @MainActor class ViewModel: ObservableObject {
        @Published var searchText = ""
        func filteringCountries(_ countries: [String]) -> [String] {
            if searchText.isEmpty {
                return countries
            }
            return countries.filter { country in
                country.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
}
