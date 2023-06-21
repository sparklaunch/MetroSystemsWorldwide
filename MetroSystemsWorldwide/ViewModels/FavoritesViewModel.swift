//
//  FavoritesViewModel.swift
//  MetroSystemsWorldwide
//
//  Created by Jinwook Kim on 2023/06/21.
//

import SwiftUI

extension FavoritesView {
    @MainActor class ViewModel: ObservableObject {
        @Published var favorites: [MetroSystem] = []
        @Published var searchText = ""
        var filteredFavorites: [MetroSystem] {
            if searchText.isEmpty {
                return favorites
            }
            return favorites.filter { favorite in
                favorite.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
}
