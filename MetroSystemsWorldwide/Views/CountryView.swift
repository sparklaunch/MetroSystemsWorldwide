//
//  CountryView.swift
//  MetroSystemsWorldwide
//
//  Created by Jinwook Kim on 2023/06/14.
//

import SwiftUI

struct CountryView: View {
    @EnvironmentObject private var metroSystemManager: MetroSystemManager
    @StateObject private var viewModel = ViewModel()
    var body: some View {
        List(viewModel.filteringCountries(metroSystemManager.countries), id: \.self) { country in
            NavigationLink {
                CountryDetailView(country: country)
            } label: {
                HStack(spacing: 10) {
                    Image(country.replacingOccurrences(of: " ", with: ""))
                        .resizable()
                        .frame(width: 60, height: 40)
                    VStack(alignment: .leading) {
                        Text(country)
                        Text("^[\(metroSystemManager.metroSystems(in: country).count) Metro \("System")](inflect: true)")
                            .font(.callout)
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.vertical, 5)
            }
        }
        .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always))
        .navigationTitle("Search by countries (\(viewModel.filteringCountries(metroSystemManager.countries).count))")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CountryView_Previews: PreviewProvider {
    static var previews: some View {
        CountryView()
            .environmentObject(MetroSystemManager())
    }
}
