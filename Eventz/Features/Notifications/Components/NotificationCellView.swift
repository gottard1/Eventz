//
//  NotificationCellView.swift
//  Eventz
//
//  Created by Gabriel Olbrisch on 11/11/23.
//

import SwiftUI

struct NotificationCellView: View {
    
    var title: String
    var description: String
    var date: String
    
    var body: some View {
        ZStack {
            Color.gray1D1D1D
            
            VStack {
                HStack(alignment: .top) {
                   Circle()
                        .fill(.grayD9D9D9)
                        .frame(width: 10, height: 10)
                        .padding(.top, 8)
                    
                    VStack(alignment: .leading) {
                        Text(title)
                            .font(.blinker(type: .semiBold, size: 20))
                            .foregroundStyle(.white)
                            .lineLimit(1)
                        
                        Text(description)
                            .font(.blinker(size: 15))
                            .foregroundStyle(.white)
                    }
                    .padding(.leading, 17)
                    
                    Spacer()
                    
                    VStack {
                        Image(systemName: "chevron.right")
                            .foregroundStyle(.white)
                            .padding(.top, 4)
                        
                        Spacer()
                        
                        Text(date)
                            .font(.blinker(type: .light, size: 13))
                            .foregroundStyle(.white)
                            .padding(.bottom, 4)
                    }
                    .padding(.trailing, 16)
                }
                .padding([.leading, .top], 16)
                
                Rectangle()
                    .fill(.white.opacity(0.1))
                    .frame(height: 1)
                    .padding(.leading, 10)
            }
        }
        .frame(height: 100)
    }
    
}

#Preview {
    NotificationCellView(title: "Lorem ipsum dolor sit amet", description: "Cras vel elit vel magna luctus congue ut congue elit. Proin sed ex magna. Aliquam volutpat porttitor magna, nec convallis purus ultricies id.", date: "Ontem")
}
