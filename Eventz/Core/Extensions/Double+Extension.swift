//
//  Double+Extension.swift
//  Eventz
//
//  Created by Marcel Felipe Gottardi Anesi on 19/01/24.
//

import Foundation

extension Double {
    func formatAsCurrency() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "pt_BR")
        
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
}
