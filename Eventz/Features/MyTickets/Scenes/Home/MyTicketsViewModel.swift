//
//  MyTicketsViewModel.swift
//  Eventz
//
//  Created by Marcel Felipe Gottardi Anesi on 22/02/24.
//

import Foundation

enum MyTicketsStatus {
    case available
    case paymentPending
    case used
    case expired
}

struct Owner {
    let name: String
    let cpf: String
}

struct Ticket {
    let code: String
    let image: String
    let name: String
    let description: String
    let date: String
    let address: String
    let batch: String
}

struct MyTicketsModel: Identifiable {
    let id = UUID()
    let owner: Owner
    let ticket: Ticket
    let status: MyTicketsStatus
}

class MyTicketsViewModel: ObservableObject {
    
    let tickets: [[MyTicketsModel]] = [
        [
            MyTicketsModel(
                owner: Owner(
                    name: "Fulano de tal",
                    cpf: "99966699966"
                ),
                ticket: Ticket(
                    code: "1793abcd",
                    image: "bannerImage",
                    name: "Dalla Club",
                    description: "Festa de formandos USP",
                    date: "2024-02-10T22:00",
                    address: "Rua Antonio da Veiga - 405", 
                    batch: "Lote 1"),
                status: .available
            ),
            MyTicketsModel(
                owner: Owner(
                    name: "Bora de tal",
                    cpf: "66699966699"
                ),
                ticket: Ticket(
                    code: "7931abcd",
                    image: "bannerImage",
                    name: "Sinfonia de Betoven",
                    description: "Orquestra da USP",
                    date: "2024-02-11T22:00",
                    address: "Rua Antonio da Veiga - 405",
                    batch: "Lote 1"),
                status: .expired
            ),
            MyTicketsModel(
                owner: Owner(
                    name: "Bora de tal",
                    cpf: "66699966699"
                ),
                ticket: Ticket(
                    code: "7931abcd",
                    image: "bannerImage",
                    name: "Sinfonia de Betoven",
                    description: "Orquestra da USP",
                    date: "2024-02-11T22:00",
                    address: "Rua Antonio da Veiga - 405",
                    batch: "Lote 1"),
                status: .expired
            )
        ],
        [
            MyTicketsModel(
                owner: Owner(
                    name: "Ciclano de tal",
                    cpf: "66699966699"
                ),
                ticket: Ticket(
                    code: "7931abcd",
                    image: "bannerImage",
                    name: "Sinfonia de Betoven",
                    description: "Orquestra da USP",
                    date: "2024-02-11T22:00",
                    address: "Rua Antonio da Veiga - 405",
                    batch: "Lote 1"),
                status: .expired
            )
        ],
        [
            MyTicketsModel(
                owner: Owner(
                    name: "Ciclano de tal",
                    cpf: "66699966699"
                ),
                ticket: Ticket(
                    code: "7931abcd",
                    image: "bannerImage",
                    name: "Sinfonia de Betoven",
                    description: "Orquestra da USP",
                    date: "2024-02-11T22:00",
                    address: "Rua Antonio da Veiga - 405",
                    batch: "Lote 1"),
                status: .paymentPending
            ),
            MyTicketsModel(
                owner: Owner(
                    name: "Bora de tal",
                    cpf: "66699966699"
                ),
                ticket: Ticket(
                    code: "7931abcd",
                    image: "bannerImage",
                    name: "Sinfonia de Betoven",
                    description: "Orquestra da USP",
                    date: "2024-02-11T22:00",
                    address: "Rua Antonio da Veiga - 405",
                    batch: "Lote 1"),
                status: .expired
            )
        ],
        [
            MyTicketsModel(
                owner: Owner(
                    name: "Ciclano de tal",
                    cpf: "66699966699"
                ),
                ticket: Ticket(
                    code: "7931abcd",
                    image: "bannerImage",
                    name: "Sinfonia de Betoven",
                    description: "Orquestra da USP",
                    date: "2024-02-05T22:00",
                    address: "Rua Antonio da Veiga - 405",
                    batch: "Lote 1"),
                status: .used
            )
        ],
        [
            MyTicketsModel(
                owner: Owner(
                    name: "Ciclano de tal",
                    cpf: "66699966699"
                ),
                ticket: Ticket(
                    code: "7931abcd",
                    image: "bannerImage",
                    name: "Sinfonia de Betoven",
                    description: "Orquestra da USP",
                    date: "2024-02-11T22:00",
                    address: "Rua Antonio da Veiga - 405",
                    batch: "Lote 1"),
                status: .expired
            )
        ],
    ]
    
}
