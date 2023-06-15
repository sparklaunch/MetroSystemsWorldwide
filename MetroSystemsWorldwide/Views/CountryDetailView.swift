//
//  CountryDetailView.swift
//  MetroSystemsWorldwide
//
//  Created by Jinwook Kim on 2023/06/15.
//

import SwiftUI

struct CountryDetailView: View {
    @EnvironmentObject private var metroSystemManager: MetroSystemManager
    let country: String
    var body: some View {
        List(metroSystemManager.metroSystems(in: country)) { metroSystem in
            NavigationLink {
                MetroSystemView(metroSystem: metroSystem)
            } label: {
                HStack(spacing: 10) {
                    Image("\(metroSystem.name.replacingOccurrences(of: " ", with: ""))Logo")
                        .resizable()
                        .frame(width: 40, height: 40)
                    Text(metroSystem.name)
                }
            }
        }
        .navigationTitle("Metro Systems in \(country)")
    }
}

struct CountryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailView(country: "Algeria")
            .environmentObject(MetroSystemManager())
    }
}
