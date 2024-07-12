//
//  ShadowedCardView.swift
//  Eventz
//
//  Created by Gabriel Olbrisch on 22/10/23.
//

import SwiftUI

struct ShadowedCardView<Content: View>: View {
    
    var backgroundColor: Color = .gray181818
    
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        ZStack {
            content()
        }
        .background(
            RoundedRectangle(cornerRadius: 8)
                .foregroundStyle(backgroundColor)
                .shadow(color: .black.opacity(0.3), radius: 2, x: -4, y: 4)

        )
    }
    
}

#Preview {
    ShadowedCardView {
        VStack {
            HStack {
                Text("Text")
                    .foregroundStyle(.white)
                Spacer()
            }
        }
    }
}
