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
                Image(metroSystem.name.replacingOccurrences(of: " ", with: ""))
                    .resizable()
                    .scaledToFit()
                VStack(alignment: .leading) {
                    Text(metroSystem.name)
                        .font(.largeTitle.bold())
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
