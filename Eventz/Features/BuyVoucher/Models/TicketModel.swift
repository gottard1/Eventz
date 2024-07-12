//
//  TicketModel.swift
//  Eventz
//
//  Created by Marcel Felipe Gottardi Anesi on 22/03/24.
//

import Foundation

struct TicketType: Identifiable, Equatable {
    let id = UUID()
    let ticketNumber: String?
    let name: String
    let description: String?
    var quantity: Int
    let section: String
    let price: Double
    let tax: Double
    let installments: Int
    let isSoldOff: Bool
    
    var totalPrice: Double {
        return Double(quantity ?? 1) * price
    }
    
    static func == (lhs: TicketType, rhs: TicketType) -> Bool {
        return lhs.ticketNumber == rhs.ticketNumber && lhs.id == rhs.id && lhs.name == rhs.name && lhs.description == rhs.description && lhs.section == rhs.section && lhs.price == rhs.price && lhs.tax == rhs.tax && lhs.installments == rhs.installments && lhs.isSoldOff == rhs.isSoldOff && lhs.quantity == rhs.quantity
    }
}

struct TicketLot: Identifiable, Equatable {
    let id = UUID()
    var section: String
    let tickets: [TicketType]
    
    static func == (lhs: TicketLot, rhs: TicketLot) -> Bool {
        return lhs.section == rhs.section && lhs.tickets == rhs.tickets
    }
}
