//
//  MyTicketCardView.swift
//  Eventz
//
//  Created by Marcel Felipe Gottardi Anesi on 22/02/24.
//

import SwiftUI

struct MyTicketCardView: View {
    let event: MyTicketsModel
    let quantity: Int
    
    var body: some View {
        VStack(spacing: 0) {
            Image("bannerImage")
                .resizable()
                .frame(height: 160)
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    eventView
                        .padding(.leading, 16)
                    
                    timeView
                        .padding(.leading, 16)
                        .padding(.bottom, 12)
                }
                
                Spacer()
                
                imageStackView
                    .padding(.trailing, 12)
                    .frame(height: 70)
            }
            .background(Color.gray181818)
        }
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(radius: 8, x: 5, y: 10)
    }
}

// MARK: - Layout
extension MyTicketCardView {
    
    var eventView: some View {
        Text(event.ticket.name)
            .font(.blinker(type: .bold, size: 17))
            .foregroundColor(.whiteLabel) +
        
        Text(" - \(event.ticket.description)")
            .font(.blinker(size: 17))
            .foregroundColor(.whiteLabel)
    }
    
    var timeView: some View {
        HStack {
            Image(systemName: "clock")
                .foregroundStyle(.whiteLabel)
            
            Text(event.ticket.date)
                .font(.blinker(size: 12))
                .foregroundStyle(.whiteLabel)
        }
    }
    
    var imageStackView: some View {
        VStack(spacing: 5) {
            if quantity > 1 {
                quantityCircleView
                    .padding(.top, 8)
            }
            
            Spacer(minLength: 4)
            
            Image(systemName: "qrcode.viewfinder")
                .padding(.bottom, 12)
                .foregroundStyle(Color.whiteLabel)
        }
    }
    
    var quantityCircleView: some View {
        ZStack {
            Circle()
                .fill(Color.purple)
                .frame(width: 20, height: 20)
                .shadow(color: .purpleB352FF, radius: 4)
                .shadow(color: .purpleB352FF, radius: 4)
            
            Text("\(quantity)x")
                .font(.blinker(type: .extraBold, size: 12))
                .foregroundStyle(Color.whiteLabel)
        }
    }
}

#Preview {
    MyTicketCardView(
        event: MyTicketsModel(
            owner: Owner(name: "Fulano",
                         cpf: "99966699966"),
            ticket: Ticket(code: "1397",
                           image: "bannerImage",
                           name: "Dalla Club",
                           description: "Festa de formandos UFSP",
                           date: "2024-02-10T22:00",
                           address: "Rua Antonio da Veiga - 405",
                           batch: "Lote 1"),
            status: .available
        ),
        quantity: 1
    )
    .frame(width: 360, height: 200)
    .foregroundStyle(Color.whiteLabel)
}
