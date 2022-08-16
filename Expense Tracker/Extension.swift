//
//  Extension.swift
//  Expense Tracker
//
//  Created by DSOFT on 15/08/2022.
//

import Foundation
import SwiftUI

extension Color {
    static let background = Color("Background")
    static let icon = Color("Icon")
    static let text = Color("Text")
    static let systemBackground = Color(uiColor: .systemBackground)
}

extension DateFormatter {
    static let allNumericVN: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter
    }()
}

extension String {
    func dateParsed() -> Date {
        guard let parsedDate = DateFormatter.allNumericVN.date(from: self) else {
            return Date()
        }
        
        return parsedDate
    }
}
