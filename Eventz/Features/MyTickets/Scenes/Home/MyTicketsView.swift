//
//  MyTicketsView.swift
//  Eventz
//
//  Created by Marcel Felipe Gottardi Anesi on 22/02/24.
//

import SwiftUI

struct MyTicketsView: View {
    
    @ObservedObject private var viewModel: MyTicketsViewModel = .init()
    
    var body: some View {
        ZStack {
            Color.backgroundGray
                .ignoresSafeArea()
            
            ScrollView {
                
                Text("Neste local, será possível visualizar os bilhetes disponíveis, os ingressos pendentes de pagamento e também aqueles que foram utilizados por você!")
                    .font(.blinker(size: 13))
                    .foregroundStyle(.whiteLabel)
                    .padding([.top, .leading, .trailing], 16)
                
                ForEach(viewModel.tickets.indices, id: \.self) { index in
                    if let event = viewModel.tickets[index].first {
                        let quantity = viewModel.tickets[index].count
                        NavigationLink {
                            if quantity > 1 {
                                MyTicketsListView(tickets: viewModel.tickets[index])
                            }  else {
                                Text("+1")
                            }
                        } label: {
                            MyTicketCardView(event: event,
                                             quantity: quantity)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                        }
                        
                    }
                }
                
            }
        }
        .navigationTitle("Meus Ingressos")
        .navigationBarItems(
            trailing: Button(action: {
                print("do something")
            }, label: {
                Image("filterIcon")
                    .foregroundStyle(.whiteLabel)
            })
        )
    }
}

#Preview {
    NavigationView {
        MyTicketsView()
    }
}
