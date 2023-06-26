//
//  FavoritesManager.swift
//  MetroSystemsWorldwide
//
//  Created by Jinwook Kim on 2023/06/21.
//

import SwiftUI

@MainActor class FavoritesManager: ObservableObject {
    private let key = "Favorites"
    @Published private var _favorites = Set([MetroSystem]())
    var favorites: [MetroSystem] {
        get {
            _favorites.sorted()
        }
        set {
            _favorites = Set(newValue)
        }
    }
    func filteredFavorites(with searchText: String) -> [MetroSystem] {
        if searchText.isEmpty {
            return favorites
        } else {
            return favorites.filter { favorite in
                favorite.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    func addToFavorites(_ metroSystem: MetroSystem) {
        favorites.append(metroSystem)
        save()
    }
    func hasFavorite(_ metroSystem: MetroSystem) -> Bool {
        favorites.contains(metroSystem)
    }
    func removeFromFavorites(_ metroSystem: MetroSystem) {
        if let index = favorites.firstIndex(of: metroSystem) {
            favorites.remove(at: index)
            save()
        }
    }
    func save() {
        guard let encodedData = try? JSONEncoder().encode(favorites) else {
            fatalError("Failed to encode favorites.")
        }
        UserDefaults.standard.set(encodedData, forKey: key)
    }
    func load() {
        if let encodedData = UserDefaults.standard.data(forKey: key) {
            guard let decodedData = try? JSONDecoder().decode([MetroSystem].self, from: encodedData) else {
                fatalError("Failed to decode favorites.")
            }
            favorites = decodedData
        } else {
            favorites = []
        }
    }
    func deleteFavorites(at offsets: IndexSet) {
        favorites.remove(atOffsets: offsets)
        save()
    }
    init() {
        load()
    }
}
