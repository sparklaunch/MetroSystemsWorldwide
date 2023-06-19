//
//  CountryRow.swift
//  MetroSystemsWorldwide
//
//  Created by Jinwook Kim on 2023/06/19.
//

import SwiftUI

struct CountryRow: View {
    let countryName: String
    let numberOfMetroSystems: Int
    var body: some View {
        HStack(spacing: 10) {
            Image(countryName.removingSpaces())
                .resizable()
                .frame(width: 60, height: 40)
            VStack(alignment: .leading) {
                Text(countryName)
                Text("^[\(numberOfMetroSystems) Metro \("System")](inflect: true)")
                    .font(.callout)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 5)
    }
}

struct CountryRow_Previews: PreviewProvider {
    static var previews: some View {
        CountryRow(countryName: "Brazil", numberOfMetroSystems: 8)
    }
}
