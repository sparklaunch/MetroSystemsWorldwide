//
//  FavoritesManager.swift
//  MetroSystemsWorldwide
//
//  Created by Jinwook Kim on 2023/06/21.
//

import SwiftUI

@MainActor class FavoritesManager: ObservableObject {
    @Published var _favorites = Set([MetroSystem]())
    var favorites: [MetroSystem] {
        get {
            _favorites.sorted()
        }
        set {
            _favorites = Set(newValue)
        }
    }
    func addToFavorites(_ metroSystem: MetroSystem) {
        favorites.append(metroSystem)
    }
    func hasFavorite(_ metroSystem: MetroSystem) -> Bool {
        favorites.contains(metroSystem)
    }
    func removeFromFavorites(_ metroSystem: MetroSystem) {
        if let index = favorites.firstIndex(of: metroSystem) {
            favorites.remove(at: index)
        }
    }
}
