//
//  NameViewModel.swift
//  MetroSystemsWorldwide
//
//  Created by Jinwook Kim on 2023/06/14.
//

import SwiftUI

extension NameView {
    @MainActor class ViewModel: ObservableObject {
        @Published var searchText = ""
        @Published var metroSystems: [MetroSystem] = []
        func filteringMetroSystems() -> [MetroSystem] {
            if searchText.isEmpty {
                return metroSystems
            }
            return metroSystems.filter { metroSystem in
                metroSystem.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
}
