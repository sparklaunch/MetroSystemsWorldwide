//
//  MetroSystemRow.swift
//  MetroSystemsWorldwide
//
//  Created by Jinwook Kim on 2023/06/19.
//

import SwiftUI

struct MetroSystemRow: View {
    let name: String
    var body: some View {
        HStack(spacing: 10) {
            Image("\(name.removingSpaces())Logo")
                .resizable()
                .frame(width: 40, height: 40)
            Text(name)
        }
    }
}

struct MetroSystemRow_Previews: PreviewProvider {
    static var previews: some View {
        MetroSystemRow(name: "Algiers Metro")
    }
}
