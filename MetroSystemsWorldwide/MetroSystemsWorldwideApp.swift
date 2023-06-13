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
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(metroSystemManager)
        }
    }
}
