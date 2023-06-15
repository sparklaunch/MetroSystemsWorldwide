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
        VStack {

        }
        .navigationTitle(metroSystem.name)
    }
}

struct MetroSystemView_Previews: PreviewProvider {
    static var previews: some View {
        MetroSystemView(metroSystem: MetroSystem.example)
    }
}
