//
//  FavoritesViewModel.swift
//  MetroSystemsWorldwide
//
//  Created by Jinwook Kim on 2023/06/21.
//

import SwiftUI

extension FavoritesView {
    @MainActor class ViewModel: ObservableObject {
        @Published var searchText = ""
        func filteringFavorites(_ favorites: [MetroSystem]) -> [MetroSystem] {
            if searchText.isEmpty {
                return favorites
            } else {
                return favorites.filter { favorite in
                    favorite.name.localizedCaseInsensitiveContains(searchText)
                }
            }
        }
    }
}
