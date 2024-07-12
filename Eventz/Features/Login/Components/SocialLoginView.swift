//
//  SocialLoginView.swift
//  Eventz
//
//  Created by Marcel Felipe Gottardi Anesi on 03/10/23.
//

import SwiftUI

struct SocialLoginView: View {
    var facebookAction: () -> ()
    var appleAction: () -> ()
    var googleAction: () -> ()
    
    var body: some View {
        HStack(spacing: 32) {
            Button(action: {
                facebookAction()
            }) {
                Image("facebookIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 42, height: 42)
                    .padding(10)
            }
            
            Button(action: {
                appleAction()
            }) {
                Image("appleIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 42, height: 42)
                    .padding(10)
            }
            
            Button(action: {
                googleAction()
            }) {
                Image("googleIcon")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 42, height: 42)
                    .padding(10)
            }
            
        }
    }
}
