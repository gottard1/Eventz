//
//  PurchaseSummaryViewModel.swift
//  Eventz
//
//  Created by Marcel Felipe Gottardi Anesi on 26/01/24.
//

import Foundation

final class PurchaseSummaryViewModel: ObservableObject {
    
    var purchaseSummary: PurchaseSummaryModel
    
    init(summary: PurchaseSummaryModel) {
        purchaseSummary = summary
    }
    
}
