//
//  MyTicketsListCardView.swift
//  Eventz
//
//  Created by Marcel Felipe Gottardi Anesi on 28/03/24.
//

import SwiftUI

struct MyTicketsListCardView: View {
    let data: MyTicketsModel
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 4) {
                Text(data.ticket.name)
                    .padding([.top, .leading], 16)
                    .font(.blinker(type: .light, size: 20))
                    .foregroundStyle(.whiteLabel)
                
                Text("Nome")
                    .padding(.top, 4)
                    .padding(.leading, 16)
                    .font(.blinker(type: .light, size: 15))
                    .foregroundStyle(.whiteLabel)
                
                Text(data.owner.name)
                    .padding(.top, 4)
                    .padding([.bottom, .leading], 16)
                    .font(.blinker(type: .semiBold, size: 18))
                    .foregroundStyle(.whiteLabel)
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundStyle(.whiteLabel)
                .padding([.top, .trailing], 16)
        }
        .background(Color.gray181818)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(radius: 8, x: 5, y: 10)
    }
}

#Preview {
    ZStack {
        Color.whiteLabel
            .ignoresSafeArea()
        
        MyTicketsListCardView(data:
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
                                )
        )
        .padding()
    }
}
