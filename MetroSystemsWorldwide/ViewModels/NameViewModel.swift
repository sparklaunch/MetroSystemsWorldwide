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
        func filteringNames(_ names: [String]) -> [String] {
            if searchText.isEmpty {
                return names
            }
            return names.filter { name in
                name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
}
