//
//  AssuredPurchaseView.swift
//  Eventz
//
//  Created by Marcel Felipe Gottardi Anesi on 16/02/24.
//

import SwiftUI

struct AssuredPurchaseView: View {
    @State var timeRemaining: Int
    @State var isActive: Bool
    
    @Environment(\.scenePhase) var scenePhase
    
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        HStack(alignment: .center, spacing: 0) {
            VStack(alignment: .leading) {
                Text("COMPRA GARANTIDA")
                    .font(.blinker(type: .bold, size: 20))
                    .foregroundStyle(.whiteLabel)
                
                Text("Sua compra será garantida pelos próximos minutos")
                    .font(.blinker(type: .light, size: 12))
                    .foregroundStyle(.whiteLabel)
            }
            
            Spacer(minLength: 32)
            
            Text(convertToTime(time: timeRemaining))
                .font(.blinker(type: .bold, size: 35))
                .foregroundStyle(.whiteLabel)
                .monospacedDigit()
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .stroke(.whiteLabel, lineWidth: 1)
                .background(
                    Color.gray222222
                        .cornerRadius(16)
                        .shadow(color: .whiteLabel, radius: 8)
                )
        )
        .padding(.horizontal, 16)
        .onReceive(timer) { time in
            guard isActive else { return }
            
            if timeRemaining > 0 {
                timeRemaining -= 1
            }
        }
        .onChange(of: scenePhase) { newPhase in
            if newPhase == .active {
                isActive = true
            } else {
                isActive = false
            }
        }
    }
}

// MARK: - Functions
extension AssuredPurchaseView {
    
    func convertToTime(time: Int) -> String {
        let minutes = time / 60
        let seconds = time % 60
        
        let timer = String(format: "%02i:%02i", minutes, seconds)
        return timer
    }
    
}

#Preview {
    ZStack {
        Color.backgroundGray
            .ignoresSafeArea()
        AssuredPurchaseView(timeRemaining: 1203, isActive: true)
    }
}
