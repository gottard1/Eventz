//
//  MyTicketsDetailView.swift
//  Eventz
//
//  Created by Marcel Felipe Gottardi Anesi on 28/03/24.
//

import SwiftUI

struct MyTicketsDetailView: View {
    
    let viewModel: MyTicketsDetailViewModel
    
    init(ticket: MyTicketsModel, qrCode: String? = "") {
        viewModel = MyTicketsDetailViewModel(data: ticket, qrCodeString: qrCode)
    }
    
    var body: some View {
        ZStack {
            Color.backgroundGray
                .ignoresSafeArea()
            
            ScrollView {
                Image(systemName: viewModel.qrCode ?? "")
                    .resizable()
                    .padding()
                    .frame(width: 200, height: 200)
                    .background(Color.whiteLabel)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .shadow(radius: 8, x: 5, y: 10)
                    .padding(.top, 30)
                
                VStack(alignment: .leading) {
                    
                        MyTicketsDetailRowView(title: "Nome",
                                               description: viewModel.ticket.owner.name)
                        
                        MyTicketsDetailRowView(title: "CPF",
                                               description: viewModel.ticket.owner.cpf)
                        
                        MyTicketsDetailRowView(title: "Código do ingresso",
                                               description: viewModel.ticket.ticket.code)
                        
                        MyTicketsDetailRowView(title: "Lote",
                                               description: viewModel.ticket.ticket.description)
                        
                        MyTicketsDetailRowView(title: "Data",
                                               description: viewModel.ticket.ticket.date)
                        
                        MyTicketsDetailRowView(title: "Endereço",
                                               description: viewModel.ticket.ticket.address)
                }
                .padding(.top)
            }
        }
        .navigationTitle("INGRESSOS")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView {
        MyTicketsDetailView(ticket:
                                MyTicketsModel(owner:
                                                Owner(
                                                    name: "Funilaria do Tião",
                                                    cpf: "000.000.000-00"
                                                ),
                                               ticket:
                                                Ticket(
                                                    code: "123.3123.11",
                                                    image: "Teste.jpeg",
                                                    name: "Festa dos Salafrarios",
                                                    description: "Melhor festa do mundo",
                                                    date: "01-02-2025T14:21:00",
                                                    address: "Rua dos boobs numero 123", 
                                                    batch: "Lote 1"),
                                               status: .available
                                              )
        )
    }
}
