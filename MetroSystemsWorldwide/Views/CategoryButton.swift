//
//  CategoryButton.swift
//  MetroSystemsWorldwide
//
//  Created by Jinwook Kim on 2023/06/14.
//

import SwiftUI

struct CategoryButton: View {
    let label: String
    let systemName: String
    let color: Color
    var body: some View {
        ZStack(alignment: .topLeading) {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(LinearGradient(colors: [color.opacity(0.5), color], startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 150, height: 150)
                .shadow(radius: 5)
                .overlay(Image(systemName: systemName)
                    .font(.system(size: 100))
                    .foregroundColor(.white)
                    .offset(x: 30, y: 30)
                         , alignment: .bottomTrailing)
                .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            Text(label)
                .font(.title3.bold())
                .foregroundColor(.white)
                .padding(10)
        }
    }
}
