//
//  EventzTextField.swift
//  Eventz
//
//  Created by Marcel Felipe Gottardi Anesi on 29/09/23.
//

import SwiftUI

struct EventzTextField: View {
    var isPasswordField: Bool
    
    @Binding var text: String
    
    @State var titleLabel: String?
    @State var placeholder: String
    @State private var isPasswordVisible: Bool
    
    init(isPasswordField: Bool = false, text: Binding<String>, titleLabel: String? = nil, placeholder: String = "", isPasswordVisible: Bool = true) {
        self.isPasswordField = isPasswordField
        self._text = text
        self.titleLabel = titleLabel
        self.placeholder = placeholder
        self.isPasswordVisible = !isPasswordField
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            if let titleLabel {
                Text(titleLabel)
                    .font(.blinker(type: .regular, size: 15))
                    .foregroundStyle(.whiteLabel)
                    .padding(.bottom, 8)
            }
            
            ZStack {
                if !isPasswordVisible && isPasswordField {
                    SecureField("", text: $text)
                        .placeholder(when: text.isEmpty) {
                            Text(placeholder)
                                .foregroundStyle(.gray6D6D6D)
                                .font(.blinker(type: .regular, size: 13))
                        }
                        .commonTextFieldModifiers()
                } else {
                    TextField("", text: $text)
                        .placeholder(when: text.isEmpty) {
                            Text(placeholder)
                                .foregroundStyle(.gray6D6D6D)
                                .font(.blinker(type: .regular, size: 13))
                        }
                        .commonTextFieldModifiers()
                }
                
                if isPasswordField {
                    HStack {
                        Spacer()
                        Button(action: {
                            isPasswordVisible.toggle()
                        }) {
                            Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                                .foregroundStyle(.gray6D6D6D)
                                .frame(width: 24, height: 24)
                        }
                        .padding(.trailing, 8)
                    }
                }
            }
        }
    }
}

private extension View {
    
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
    
    func commonTextFieldModifiers() -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .stroke(.gray6D6D6D, lineWidth: 1)
                .background(.gray1D1D1D)
            
            self
                .tint(.whiteLabel)
                .foregroundStyle(.whiteLabel)
                .background(.gray1D1D1D)
                .cornerRadius(5)
                .padding(.horizontal, 16)
                .font(.blinker(type: .regular, size: 15))
        }
        .frame(height: 45)
    }
    
}

private struct EventzTextFieldPreview: View {
    
    @State var text = "teste"
    
    var body: some View {
        EventzTextField(isPasswordField: true, text: $text, titleLabel: "Title", placeholder: "Placeholder")
    }
}

#Preview {
    ZStack {
        Color.backgroundGray
            .ignoresSafeArea()
        EventzTextFieldPreview()
    }
}
