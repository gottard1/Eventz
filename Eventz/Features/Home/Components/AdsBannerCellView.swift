//
//  AdsBannerView.swift
//  Eventz
//
//  Created by Gabriel Olbrisch on 02/10/23.
//

import SwiftUI

struct AdsBannerCellView: View {
    
    var body: some View {
        VStack {
            HStack(alignment: .firstTextBaseline) {
                Text("Ads")
                    .foregroundStyle(.white)
                    .font(.blinker(type: .regular, size: 15))
                Spacer()
            }
            .padding(.horizontal, 16)
            Spacer()
                .frame(height: 14)
            Image("bannerPlaceholder")
                .frame(width: UIScreen.main.bounds.size.width - 32, height: 76)
                .clipShape(.rect(cornerRadius: 10))
                .foregroundStyle(.gray)
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
        }
        .padding([.top, .bottom], 12)
    }
    
}

#Preview {
    AdsBannerCellView()
        .background(.black)
}
