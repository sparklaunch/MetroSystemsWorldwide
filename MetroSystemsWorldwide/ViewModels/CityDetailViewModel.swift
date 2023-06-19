//
//  CityDetailViewModel.swift
//  MetroSystemsWorldwide
//
//  Created by Jinwook Kim on 2023/06/19.
//

import SwiftUI

extension CityDetailView {
    @MainActor class ViewModel: ObservableObject {
        @Published var metroSystems: [MetroSystem] = []
    }
}
