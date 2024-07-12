//
//  CircularLoading.swift
//  Eventz
//
//  Created by Gabriel Olbrisch on 28/12/23.
//

import SwiftUI

struct CircularLoading: View {
    
    @State private var isAnimating: Bool = false
    @State private var circleStart: CGFloat = 0.17
    @State private var circleEnd: CGFloat = 0.325
    @State private var rotationDegree: Angle = .degrees(0)
    @State private var repeaterTimer: Timer?
    
    private let trackerRotation: Double = 2
    private let animationDuration: Double = 0.75
    private let circleTrackGradient = LinearGradient(colors: [.white], startPoint: .top, endPoint: .bottom)
    
    var loadingColor: Color = .white
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        ZStack {
            Circle()
                .trim(from: circleStart, to: circleEnd)
                .stroke(style: StrokeStyle(lineWidth: height * 0.15, lineCap: .round))
                .fill(loadingColor)
                .rotationEffect(rotationDegree)
            
        }
        .frame(width: width, height: height)
        .onAppear() {
            repeaterTimer?.invalidate()
            animateLoader()
            repeaterTimer = Timer.scheduledTimer(withTimeInterval: (trackerRotation * animationDuration) + animationDuration, repeats: true) { _ in
                self.animateLoader()
            }
        }
        .onDisappear() {
            repeaterTimer?.invalidate()
        }
    }
    
    func getRotationAngle() -> Angle {
        return .degrees(360 * trackerRotation) + .degrees(120)
    }
    
    func animateLoader () {
        withAnimation(.spring(response: animationDuration * 2)) {
            rotationDegree = .degrees(-57.5)
            circleEnd = 0.325
        }
        
        Timer.scheduledTimer(withTimeInterval: animationDuration, repeats: false) { _ in
            withAnimation(.easeInOut(duration: trackerRotation * animationDuration)) {
                self.rotationDegree += self.getRotationAngle()
            }
        }
        
        Timer.scheduledTimer(withTimeInterval: animationDuration * 1.25, repeats: false) { _ in
            withAnimation(.easeOut(duration: (trackerRotation * animationDuration) / 2.25)) {
                circleEnd = 0.95
            }
        }
        
        Timer.scheduledTimer(withTimeInterval: trackerRotation * animationDuration, repeats: false) { _ in
            rotationDegree = .degrees (47.5)
            withAnimation (.easeOut(duration: animationDuration)) {
                circleEnd = 0.25
            }
        }
    }
    
}


#Preview {
    ZStack {
        Color.backgroundGray
            .ignoresSafeArea()
        
        CircularLoading(width: 20, height: 20)
    }
}
