//
//  MyTicketsListView.swift
//  Eventz
//
//  Created by Marcel Felipe Gottardi Anesi on 28/03/24.
//

import SwiftUI

struct MyTicketsListView: View {
    let viewModel: MyTicketsListViewModel
    
    init(tickets: [MyTicketsModel]) {
        viewModel = MyTicketsListViewModel(data: tickets)
    }
    
    var body: some View {
        ZStack {
            Color.backgroundGray
                .ignoresSafeArea()
            
            VStack(spacing: 24) {
                ForEach(viewModel.tickets.indices, id: \.self) { index in
                    NavigationLink {
                        MyTicketsDetailView(ticket: viewModel.tickets[index], qrCode: "qrcode")
                    } label: {
                        MyTicketsListCardView(data: viewModel.tickets[index])
                            .shadow(radius: 8)
                    }
                }
                
                Spacer(minLength: 32)
            }
            .padding(.top, 24)
            .padding()
            .navigationTitle("INGRESSOS")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    NavigationView {
        MyTicketsListView(tickets: [
            MyTicketsModel(
                owner:
                    Owner(
                        name: "Fulaninho",
                        cpf: "000.000.000-00"
                    ),
                ticket:
                    Ticket(
                        code: "123123abc",
                        image: "testeste",
                        name: "Inteiro masculino",
                        description: "Descrição do melhor evento do melhor app",
                        date: "01-02-2001T05:15",
                        address: "Rua dos bobos numero zero",
                        batch: "Lote 1"),
                status: .available
            ),
            MyTicketsModel(
                owner:
                    Owner(
                        name: "Fulanao",
                        cpf: "000.000.000-00"
                    ),
                ticket:
                    Ticket(
                        code: "123123abc",
                        image: "testeste",
                        name: "Inteiro masculino",
                        description: "Descrição do melhor evento do melhor app",
                        date: "01-02-2001T05:15",
                        address: "Rua dos bobos numero zero",
                        batch: "Lote 1"),
                status: .available
            )
        ])
    }
}
