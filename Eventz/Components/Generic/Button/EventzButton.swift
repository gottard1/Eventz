//
//  EventzButton.swift
//  Eventz
//
//  Created by Marcel Felipe Gottardi Anesi on 30/09/23.
//

import SwiftUI

struct EventzButton: View {
    @Binding var isEnabled: Bool
    @State var isLoading: Bool = false
    
    var title: String
    var image: String?
    var systemImage: String?
    var titleColor: Color?
    var color: Color?
    var action: () -> Void
    
    var body: some View {
        Button(action: {
           action()
        }) {
            if isLoading {
                CircularLoading(width: 10, height: 10)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 45)
                    .background(.gray565656)
                    .cornerRadius(5)
            } else {
                EventzButtonView(isEnabled: $isEnabled,
                                 title: title,
                                 image: image ?? nil,
                                 systemImage: systemImage ?? nil,
                                 titleColor: titleColor ?? .black,
                                 color: color)
            }
        }
        .disabled(!isEnabled || isLoading)
    }
}

struct EventzButtonPreview: View {
    @State var isEnabled: Bool = true
    @State var isLoading: Bool = false
    
    var body: some View {
        EventzButton(isEnabled: $isEnabled, isLoading: isLoading, title: "Title", action: {})
    }
}

#Preview {
    ZStack {
        Color.backgroundGray
            .ignoresSafeArea(.all)
        
        EventzButtonPreview()
            .padding(.horizontal, 16)
    }
}
