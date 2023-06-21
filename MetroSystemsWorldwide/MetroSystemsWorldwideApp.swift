//
//  MetroSystemsWorldwideApp.swift
//  MetroSystemsWorldwide
//
//  Created by Jinwook Kim on 2023/06/13.
//

import SwiftUI

@main
struct MetroSystemsWorldwideApp: App {
    @StateObject private var metroSystemManager = MetroSystemManager()
    @StateObject private var favoritesManager = FavoritesManager()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(metroSystemManager)
                .environmentObject(favoritesManager)
        }
    }
}
