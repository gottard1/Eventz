//
//  BuyNowButton.swift
//  Eventz
//
//  Created by Marcel Felipe Gottardi Anesi on 26/01/24.
//

import SwiftUI

struct BuyNowButton: View {
    let title: String
    let description: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.blinker(type: .bold, size: 20))
                    .foregroundStyle(.black)
                Text(description)
                    .font(.blinker(type: .light, size: 16))
                    .foregroundStyle(.black)
            }
            Spacer()
            
            Image("ticketIcon")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.black)
                .frame(width: 35, height: 35)
                .padding()
            
            Image(systemName: "chevron.right")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.black)
                .frame(width: 12, height: 22)
                .padding()
        }
        .padding(.vertical, 5)
        .padding(.horizontal, 16)
    }
}
