//
//  EventzButtonView.swift
//  Eventz
//
//  Created by Marcel Felipe Gottardi Anesi on 16/02/24.
//

import SwiftUI

struct EventzButtonView: View {
    @Binding var isEnabled: Bool
    
    var title: String
    var image: String?
    var systemImage: String?
    var titleColor: Color?
    var color: Color?
    
    var body: some View {
        HStack {
            Spacer()
            
            if let image {
                Image(image)
                    .frame(width: 24, height: 24)
            } else if let systemImage {
                Image(systemName: systemImage)
                    .frame(width: 24, height: 24)
            }
            
            
            Text(title)
                .font(.blinker(type: .bold, size: 18))
                .frame(height: 45)
            
            Spacer()
        }
        .disabled(!isEnabled)
        .background(isEnabled ? color ?? .whiteLabel : .gray565656)
        .foregroundColor(titleColor ?? .black)
        .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}

#Preview {
    @State var isEnabled: Bool = true
    
    return ZStack {
        Color.backgroundGray
            .ignoresSafeArea(.all)
        
        EventzButtonView(
            isEnabled: $isEnabled,
            title: "Sair",
            systemImage: "rectangle.portrait.and.arrow.right",
            titleColor: .blackLabel,
            color: .redFF5252)
        .padding()
    }
}
