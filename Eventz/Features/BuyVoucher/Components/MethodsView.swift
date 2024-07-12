//
//  MethodsView.swift
//  Eventz
//
//  Created by Marcel Felipe Gottardi Anesi on 16/02/24.
//

import SwiftUI

struct MethodsView: View {
    var image: String
    var title: String
    var isSelected: Bool
    
    var body: some View {
        VStack {
            HStack {
                Image(image)
                    .padding(.leading, 16)
                
                Text(title)
                    .font(.blinker(size: 20))
                    .foregroundStyle(.whiteLabel)
                    .padding(.leading, 8)
                
                Spacer()
                
                if isSelected {
                    Image("checkbox-icon")
                        .foregroundStyle(.blue)
                        .padding(.trailing, 16)
                } else {
                    Image("checkbox-unselected-icon")
                        .foregroundStyle(Color.gray6D6D6D)
                        .padding(.trailing, 16)
                }
                
            }
            .padding(.top, 4)
            
            Divider()
                .background(Color.whiteLabel)
                .padding(.leading, 50)
        }
    }
    
}

#Preview {
    ZStack {
        Color.backgroundGray
            .ignoresSafeArea()
        MethodsView(image: "picpay-icon", 
                    title: "PicPay",
                    isSelected: true)
    }
}
