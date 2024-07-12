//
//  PaymentModel.swift
//  Eventz
//
//  Created by Marcel Felipe Gottardi Anesi on 22/03/24.
//

import Foundation

struct PaymentMethod: Identifiable {
    let id = UUID()
    var image: String
    var title: String
    var isSelected: Bool
}
