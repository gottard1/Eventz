//
//  PurchaseTicketViewModel.swift
//  Eventz
//
//  Created by Marcel Felipe Gottardi Anesi on 19/01/24.
//

import SwiftUI

final class PurchaseTicketViewModel: ObservableObject {
    @Published var selectedTickets = [TicketType]()
    
    let partyInfo = PartyInfo(
        local: "Dalla Club",
        name: "Festa de formandos UFSP",
        dateTime: "17/11/2023",
        address: "Rua Antônio da Veiga - 405"
    )
    
    var ticketLot: [TicketLot] = [
        TicketLot(
            section: "1 Lote",
            tickets: [
                TicketType(
                    ticketNumber: nil,
                    name: "Inteiro + Caneca",
                    description: "Lote Masculino Inteiro", 
                    quantity: 1,
                    section: "1 Lote",
                    price: 105.00,
                    tax: 8.0,
                    installments: 4,
                    isSoldOff: false
                ),
                TicketType(
                    ticketNumber: nil,
                    name: "Inteiro Masculino",
                    description: nil,
                    quantity: 1,
                    section: "1 Lote",
                    price: 80.00,
                    tax: 8.0,
                    installments: 4,
                    isSoldOff: false
                )
            ]
        ),
        TicketLot(
            section: "2 Lote",
            tickets: [
                TicketType(
                    ticketNumber: nil,
                    name: "Camarote",
                    description: nil,
                    quantity: 1,
                    section: "2 Lote",
                    price: 560.00,
                    tax: 8.0,
                    installments: 4,
                    isSoldOff: false
                )
            ]
        ),
        TicketLot(
            section: "3 Lote",
            tickets: [
                TicketType(
                    ticketNumber: nil,
                    name: "VIP Unisex",
                    description: nil,
                    quantity: 1,
                    section: "3 Lote",
                    price: 180.00,
                    tax: 8.0,
                    installments: 4,
                    isSoldOff: true
                )
            ]
        )
    ]
    
    func addSelectedTicket(_ ticket: TicketType) {
        if selectedTickets.isEmpty {
            selectedTickets.append(ticket)
        } else {
            if selectedTickets.contains(where: { $0.name == ticket.name }) {
                selectedTickets.indices.forEach { index in
                    let selectedTicket = selectedTickets[index]
                    
                    if selectedTicket.name == ticket.name {
                        selectedTickets[index].quantity += 1
                    }
                }
            } else {
                selectedTickets.append(ticket)
            }
        }
    }
    
    func removeSelectedTicket(_ ticket: TicketType) {
        if selectedTickets.contains(where: { $0.name == ticket.name }) {
            selectedTickets.indices.forEach { index in
                let selectedTicket = selectedTickets[index]
                
                if selectedTicket.name == ticket.name {
                    if selectedTicket.quantity == 1 {
                        if let index = selectedTickets.firstIndex(of: ticket) {
                            selectedTickets.remove(at: index)
                        }
                    } else {
                        selectedTickets[index].quantity -= 1
                    }
                }
            }
        }
    }
    
}
