//
//  MetroSystemView.swift
//  MetroSystemsWorldwide
//
//  Created by Jinwook Kim on 2023/06/15.
//

import SwiftUI

struct MetroSystemView: View {
    @EnvironmentObject private var favoritesManager: FavoritesManager
    let metroSystem: MetroSystem
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image(metroSystem.name.removingSpaces())
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: 300, alignment: .center)
                    .clipped()
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text(metroSystem.name)
                            .font(.largeTitle.bold())
                        Spacer()
                        if favoritesManager.hasFavorite(metroSystem) {
                            Button {
                                favoritesManager.removeFromFavorites(metroSystem)
                            } label: {
                                Image(systemName: "star.fill")
                                    .imageScale(.large)
                            }
                        } else {
                            Button {
                                favoritesManager.addToFavorites(metroSystem)
                            } label: {
                                Image(systemName: "star")
                                    .imageScale(.large)
                            }
                        }

                    }
                    HStack(spacing: 10) {
                        Text("Country: \(metroSystem.country).")
                        Image(metroSystem.country.removingSpaces())
                            .resizable()
                            .frame(width: 40, height: 30)
                    }
                    Text("First Opened: \(metroSystem.firstOpened).")
                    Text("Last Expanded: \(metroSystem.lastExpanded ?? "N/A").")
                    Text("Number of Stations: \(metroSystem.numberOfStations).")
                    Text("Total Length: \(metroSystem.totalLength).")
                    Text("Annual Ridership (Million): \(metroSystem.annualRidership ?? "N/A").")
                }
                .padding()
            }
        }
        .ignoresSafeArea(.all)
    }
}

struct MetroSystemView_Previews: PreviewProvider {
    static var previews: some View {
        MetroSystemView(metroSystem: MetroSystem.example)
            .environmentObject(FavoritesManager())
    }
}
