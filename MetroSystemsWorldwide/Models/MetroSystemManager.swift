//
//  MetroSystemManager.swift
//  MetroSystemsWorldwide
//
//  Created by Jinwook Kim on 2023/06/13.
//

import SwiftUI

@MainActor class MetroSystemManager: ObservableObject {
    @Published var metroSystems = [MetroSystem]()
    var countries: [String] {
        let countries = metroSystems.map(\.country)
        let countrySet = Set(countries)
        return countrySet.sorted()
    }
    func loadData() {
        let dataURL = Bundle.main.url(forResource: "data", withExtension: "csv")!
        let stringData = try! String(contentsOf: dataURL)
        let separatedData = stringData.components(separatedBy: "\n").dropLast()
        let processedData = separatedData.map { line in
             line.trimmingCharacters(in: .whitespacesAndNewlines)
        }
        var metroSystems = [MetroSystem]()
        for datum in processedData {
            let components = datum.components(separatedBy: ",")
            let city = components[0]
            let country = components[1]
            let name = components[2]
            let firstOpened = components[3]
            let lastExpanded = components[4] != "-" ? components[4] : nil
            let numberOfStations = components[5]
            let totalLength = components[6]
            let annualRidership = components[7] != "-" ? components[7] : nil
            let metroSystem = MetroSystem(city: city, country: country, name: name, firstOpened: firstOpened, lastExpanded: lastExpanded, numberOfStations: numberOfStations, totalLength: totalLength, annualRidership: annualRidership)
            metroSystems.append(metroSystem)
        }
        self.metroSystems = metroSystems
    }
    init() {
        loadData()
    }
}
