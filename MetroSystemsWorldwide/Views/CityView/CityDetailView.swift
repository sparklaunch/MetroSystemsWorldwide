//
//  CityDetailView.swift
//  MetroSystemsWorldwide
//
//  Created by Jinwook Kim on 2023/06/19.
//

import SwiftUI

struct CityDetailView: View {
    @EnvironmentObject private var metroSystemManager: MetroSystemManager
    @StateObject private var viewModel = ViewModel()
    let city: String
    var body: some View {
        List(viewModel.metroSystems) { metroSystem in
            NavigationLink {
                MetroSystemView(metroSystem: metroSystem)
            } label: {
                MetroSystemRow(name: metroSystem.name)
            }
        }
        .navigationTitle("Metro Systems in \(city)")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.metroSystems = metroSystemManager.metroSystemsIn(city: city)
        }
    }
}

struct CityDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CityDetailView(city: "Algiers")
    }
}
