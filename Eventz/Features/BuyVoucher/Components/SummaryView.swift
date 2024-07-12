//
//  SummaryView.swift
//  Eventz
//
//  Created by Marcel Felipe Gottardi Anesi on 26/01/24.
//

import SwiftUI

struct SummaryView: View {
    let purchase: TicketType
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                quantityText
                
                Spacer()
                
                Text(purchase.totalPrice.formatAsCurrency())
                    .font(.blinker(size: 15))
                    .foregroundStyle(.whiteLabel)
            }
            
            HStack {
                Text("+ taxa")
                    .font(.blinker(size: 15))
                    .foregroundStyle(.gray6D6D6D)
                
                Spacer()
                
                Text(purchase.tax.formatAsCurrency())
                    .font(.blinker(size: 15))
                    .foregroundStyle(.gray6D6D6D)
            }
        }
        .padding(.horizontal, 16)
    }
}

// MARK: - Layout
extension SummaryView {
    
    var quantityText: some View {
        Text(String(purchase.quantity))
            .font(.blinker(size: 15))
            .foregroundColor(.whiteLabel) +
        
        Text("x ")
            .font(.blinker(size: 15))
            .foregroundColor(.whiteLabel) +
        
        Text(purchase.name)
            .font(.blinker(size: 15))
            .foregroundColor(.whiteLabel)
    }
    
}

#Preview {
    ZStack {
        Color.backgroundGray
            .ignoresSafeArea()
        
        SummaryView(purchase: TicketType(ticketNumber: "Teste",
                                         name: "Teste Marcel",
                                         description: "Description",
                                         quantity: 5,
                                         section: "4",
                                         price: 50.0,
                                         tax: 5.0,
                                         installments: 3,
                                         isSoldOff: false))
    }
}
