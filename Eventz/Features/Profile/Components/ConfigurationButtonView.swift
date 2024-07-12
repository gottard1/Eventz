//
//  ConfigurationButtonView.swift
//  Eventz
//
//  Created by Marcel Felipe Gottardi Anesi on 05/04/24.
//

import SwiftUI

struct ConfigurationButtonView: View {
    var image: Image
    var text: String
    
    var body: some View {
        HStack {
            image
                .frame(width: 24, height: 24)
                .padding([.top, .leading, .bottom], 16)
                .foregroundStyle(.whiteLabel)
            
            Text(text)
                .font(.blinker(size: 18))
                .foregroundStyle(.whiteLabel)
                .padding([.top, .bottom], 16)
                .padding(.leading, 10)
                .padding(.trailing, 16)
            
            Spacer()
        }
        .background(.gray181818)
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    ZStack {
        Color.backgroundGray
            .ignoresSafeArea()
        
        ConfigurationButtonView(image: Image(systemName: "gearshape"), text: "Teste")
            .padding()
    }
}
