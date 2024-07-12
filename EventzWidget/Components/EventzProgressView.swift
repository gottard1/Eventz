//
//  EventzProgressView.swift
//  Eventz
//
//  Created by Marcel Felipe Gottardi Anesi on 19/04/24.
//

import SwiftUI

struct EventzProgressView: View {
    let progressValue: Float
    
    var body: some View {
        ProgressView(value: progressValue, total: 3)
            .tint(.whiteLabel)
            .overlay {
                HStack {
                    Rectangle()
                        .fill(.backgroundGray)
                        .frame(width: 10)
                    
                    Spacer()
                    
                    Rectangle()
                        .fill(.backgroundGray)
                        .frame(width: 10)
                    
                    Spacer()
                    
                    Rectangle()
                        .fill(.backgroundGray)
                        .frame(width: 10)
                    
                    Spacer()
                    
                    Rectangle()
                        .fill(.backgroundGray)
                        .frame(width: 10)
                }
            }
            .padding(16)
    }
}

#Preview {
    ZStack {
        Color.backgroundGray
            .ignoresSafeArea()
        
        EventzProgressView(progressValue: 2)
    }
}
