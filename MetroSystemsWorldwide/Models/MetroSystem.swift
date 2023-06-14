//
//  MetroSystem.swift
//  MetroSystemsWorldwide
//
//  Created by Jinwook Kim on 2023/06/13.
//

import SwiftUI

struct MetroSystem {
    static let example = MetroSystem(city: "Algiers", country: "Algeria", name: "Algiers Metro", firstOpened: "2011", lastExpanded: "2018", numberOfStations: "19", totalLength: "18.5 km (11.5 mi)", annualRidership: "45.3 (2019)")
    let city: String
    let country: String
    let name: String
    let firstOpened: String
    let lastExpanded: String?
    let numberOfStations: String
    let totalLength: String
    let annualRidership: String?
}
