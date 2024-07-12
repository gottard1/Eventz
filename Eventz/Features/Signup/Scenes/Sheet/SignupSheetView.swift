//
//  SignupSheetView.swift
//  Eventz
//
//  Created by Gabriel Olbrisch on 06/11/23.
//

import SwiftUI

struct SignupSheetView<Content: View>: View {
    
    @Environment(\.dismiss) var dismiss
    
    @ViewBuilder var content: () -> Content
    
    var body: some View {
        ZStack {
            Color.backgroundGray
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                headerView
                
                content()
                
                loginButton
                    .padding(.bottom, 16)
            }
        }
    }
    
}

private extension SignupSheetView {
    
    var headerView: some View {
        HStack {
            Spacer()
            
            Text("Cadastre-se")
                .font(.blinker(type: .bold, size: 20))
                .foregroundStyle(.whiteLabel)
                .padding(.leading, 32)
            
            Spacer()
            
            Button(action: {
                dismiss()
            }) {
                Image(systemName: "xmark")
                    .foregroundStyle(.whiteLabel)
            }
            .padding(.trailing, 16)
        }
        .padding()
    }
    
    var loginButton: some View {
        HStack(spacing: 8) {
            Text("Já tem uma conta?")
                .font(.blinker(type: .regular, size: 15))
                .foregroundStyle(.whiteLabel)
            
            Button(action: {
                dismiss()
            }) {
                Text("Faça o login!")
                    .font(.blinker(type: .bold, size: 15))
                    .foregroundStyle(.whiteLabel)
            }
        }
    }
    
}
