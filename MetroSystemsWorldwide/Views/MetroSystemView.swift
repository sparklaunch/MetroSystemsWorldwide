//
//  MetroSystemView.swift
//  MetroSystemsWorldwide
//
//  Created by Jinwook Kim on 2023/06/15.
//

import SwiftUI

struct MetroSystemView: View {
    let metroSystem: MetroSystem
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image(metroSystem.name.removingSpaces())
                    .resizable()
                    .scaledToFit()
                VStack(alignment: .leading, spacing: 10) {
                    Text(metroSystem.name)
                        .font(.largeTitle.bold())
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
    }
}
