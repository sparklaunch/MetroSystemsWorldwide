//
//  FavoritesView.swift
//  MetroSystemsWorldwide
//
//  Created by Jinwook Kim on 2023/06/21.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject private var favoritesManager: FavoritesManager
    var body: some View {
        NavigationView {
            List {
                ForEach(favoritesManager.favorites) { favorite in
                    NavigationLink {
                        MetroSystemView(metroSystem: favorite)
                    } label: {
                        MetroSystemRow(name: favorite.name)
                    }
                }
            }
            .navigationTitle("Favorite Metro Systems")
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
