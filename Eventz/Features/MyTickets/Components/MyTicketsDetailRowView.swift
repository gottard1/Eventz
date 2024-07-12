//
//  MyTicketsDetailRowView.swift
//  Eventz
//
//  Created by Marcel Felipe Gottardi Anesi on 28/03/24.
//

import SwiftUI

struct MyTicketsDetailRowView: View {
    let title: String
    let description: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .padding(.top, 4)
                    .padding([.leading, .trailing], 16)
                    .font(.blinker(type: .light, size: 15))
                    .foregroundStyle(.whiteLabel)
                
                Text(description)
                    .padding(.top, 2)
                    .padding([.bottom, .leading, .trailing], 16)
                    .font(.blinker(type: .semiBold, size: 18))
                    .foregroundStyle(.whiteLabel)
            }
            
            Spacer()
        }
    }
}

#Preview {
    ZStack {
        Color.backgroundGray
            .ignoresSafeArea()
        
        MyTicketsDetailRowView(title: "Teste", description: "Testado")
    }
}
