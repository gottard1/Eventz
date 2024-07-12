//
//  TicketInfoView.swift
//  Eventz
//
//  Created by Marcel Felipe Gottardi Anesi on 25/01/24.
//

import SwiftUI

struct TicketInfoView: View {
    let ticket: TicketType
    
    let plusAction: (TicketType) -> Void
    let minusAction: (TicketType) -> Void
    
    var body: some View {
        HStack {
            ticketInfoVStack
            
            Spacer()
            
            Divider()
                .background(.gray6D6D6D)
                .padding([.top, .bottom], 8)
            
            if ticket.isSoldOff {
                Text("Esgotado")
                    .font(Font.blinker(type: .bold, size: 14))
                    .foregroundStyle(.white)
                    .frame(width: 90)
            } else {
                plusAndMinusButton
                    .frame(width: 90)
            }
        }
        .background(.gray1D1D1D)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.gray6D6D6D, lineWidth: 1))
        .padding([.leading, .trailing], 16)
    }
}

extension TicketInfoView {
    
    var ticketInfoVStack: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(ticket.name)
                    .font(.blinker(type: .headline, size: 20))
                    .foregroundStyle(.whiteLabel)
                
                Spacer()
                
                if ticket.description != nil {
                    Button(action: {
                        // Ação de adicionar
                    }) {
                        Image(systemName: "questionmark.square")
                            .foregroundStyle(.whiteLabel)
                    }
                }
            }
            .padding(.top, 4)
            
            priceText
                .padding(.top, 6)
            
            Text(" em até \(ticket.installments)x sem juros")
                .font(.blinker(size: 14))
                .foregroundStyle(.green52FF82)
        }
        .padding()
    }
    
    var priceText: some View {
        Text(ticket.price.formatAsCurrency())
            .font(.blinker(type: .bold, size: 20))
            .foregroundColor(.whiteLabel) +
        
        Text(" (+ \(ticket.tax.formatAsCurrency()) de taxa*)")
            .font(.blinker(size: 14))
            .foregroundColor(.whiteLabel)
    }
    
    var plusAndMinusButton: some View {
        VStack(spacing: 8) {
            
            Button(action: {
                plusAction(ticket)
            }) {
                Image(systemName: "plus")
                    .foregroundStyle(.whiteLabel)
                    .padding()
            }
            .frame(width: 75, height: 32)
            
            Divider()
                .frame(width: 84)
                .background(.gray6D6D6D)
                .padding(.trailing, 8)
            
            Button(action: {
                minusAction(ticket)
            }) {
                Image(systemName: "minus")
                    .foregroundStyle(.whiteLabel)
                    .padding()
            }
            .frame(width: 75, height: 32)
            
        }
    }
    
}
