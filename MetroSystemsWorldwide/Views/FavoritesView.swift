//
//  FavoritesView.swift
//  MetroSystemsWorldwide
//
//  Created by Jinwook Kim on 2023/06/21.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject private var favoritesManager: FavoritesManager
    @StateObject private var viewModel = ViewModel()
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.filteredFavorites) { favorite in
                    NavigationLink {
                        MetroSystemView(metroSystem: favorite)
                    } label: {
                        MetroSystemRow(name: favorite.name)
                    }
                }
            }
            .navigationTitle("Favorite Metro Systems")
            .searchable(text: $viewModel.searchText)
            .autocorrectionDisabled()
        }
        .navigationViewStyle(.stack)
        .onAppear {
            viewModel.favorites = favoritesManager.favorites
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
            .environmentObject(FavoritesManager())
    }
}
