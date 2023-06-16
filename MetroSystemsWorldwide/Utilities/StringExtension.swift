//
//  StringExtension.swift
//  MetroSystemsWorldwide
//
//  Created by Jinwook Kim on 2023/06/16.
//

import SwiftUI

extension String {
    func removingSpaces() -> String {
        self.replacingOccurrences(of: " ", with: "")
    }
}
