//
//  ContentView.swift
//  MetroSystemsWorldwide
//
//  Created by Jinwook Kim on 2023/06/13.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        Text("Search by…")
                            .font(.title.bold())
                            .padding(.horizontal, 20)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                NavigationLink {
                                    CountryView()
                                } label: {
                                    CategoryButton(label: "Country", systemName: "globe.asia.australia.fill", color: .blue)
                                }
                                NavigationLink {

                                } label: {
                                    CategoryButton(label: "City", systemName: "building.2.crop.circle.fill", color: .green)
                                }
                                NavigationLink {

                                } label: {
                                    CategoryButton(label: "Name", systemName: "tram.circle.fill", color: .yellow)
                                }
                            }
                            .padding(.horizontal, 20)
                        }
                    }
                }
            }
            .navigationTitle("Hello, Passengers.")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
