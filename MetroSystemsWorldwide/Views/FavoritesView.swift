//
//  FavoritesView.swift
//  MetroSystemsWorldwide
//
//  Created by Jinwook Kim on 2023/06/21.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject private var favoritesManager: FavoritesManager
    @State private var searchText = ""
    var body: some View {
        NavigationView {
            List {
                ForEach(favoritesManager.filteredFavorites(with: searchText)) { favorite in
                    NavigationLink {
                        MetroSystemView(metroSystem: favorite)
                    } label: {
                        MetroSystemRow(name: favorite.name)
                    }
                }
                .onDelete(perform: favoritesManager.deleteFavorites)
            }
            .navigationTitle("Favorite Metro Systems")
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
            .autocorrectionDisabled()
        }
        .navigationViewStyle(.stack)
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
            .environmentObject(FavoritesManager())
    }
}
