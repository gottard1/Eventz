//
//  Font+Extension.swift
//  Eventz
//
//  Created by Gabriel Olbrisch on 03/10/23.
//

import SwiftUI

extension Font {
    
    enum BlinkerType: String {
        case black = "Black"
        case bold = "Bold"
        case extraBold = "ExtraBold"
        case headline = "Headline"
        case light = "Light"
        case regular = "Regular"
        case semiBold = "SemiBold"
        case semiLight = "SemiLight"
        case thin = "Thin"
        
    }
    
    static func blinker(type: BlinkerType = .regular, size: CGFloat) -> Font {
        .custom("Blinker-\(type.rawValue)", size: size)
    }
    
    static func bungeeSpice(size: CGFloat) -> Font {
        .custom("BungeeSpice-Regular", size: size)
    }
    
}
