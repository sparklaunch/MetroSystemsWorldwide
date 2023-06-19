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
        List(metroSystemManager.metroSystemsIn(country: country)) { metroSystem in
            NavigationLink {
                MetroSystemView(metroSystem: metroSystem)
            } label: {
                MetroSystemRow(name: metroSystem.name)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                VStack {
                    Text("Metro Systems in")
                        .font(.subheadline.bold())
                        .foregroundColor(.secondary)
                    Text(country)
                        .font(.headline.bold())
                }
            }
        }
    }
}

struct CountryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CountryDetailView(country: "Algeria")
            .environmentObject(MetroSystemManager())
    }
}
