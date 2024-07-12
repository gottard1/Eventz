//
//  SignupView.swift
//  Eventz
//
//  Created by Gabriel Olbrisch on 09/10/23.
//

import SwiftUI

struct SignupView: View {
    
    @State private var nameText: String = ""
    @State private var emailText: String = ""
    @State private var passwordText: String = ""
    @State private var isSignUpButtonEnabled: Bool = false
    @State private var isCheckBoxSelected: Bool = false
    @State private var isLoading: Bool = false
    
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject private var viewModel: SignupViewModel
    
    init(viewModel: SignupViewModel = .init()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            Color.backgroundGray
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                fieldsView
                    .padding(.top, 16)
                
                ShadowedCardView(backgroundColor: .white.opacity(isCheckBoxSelected ? 0.3 : 0.1)) {
                    HStack(spacing: 2) {
                        Text("Desejo ser")
                            .font(.blinker(size: 15))
                            .foregroundStyle(isCheckBoxSelected ? .white : .black)
                        
                        Text("Organizador")
                            .font(.blinker(type: .bold, size: 15))
                            .foregroundStyle(isCheckBoxSelected ? .white : .black)
                        
                        Spacer()
                        
                        CheckBox(isSelected: $isCheckBoxSelected)

                    }
                    .padding(16)
                }
                .onTapGesture {
                    withAnimation {
                        isCheckBoxSelected.toggle()
                    }
                }
                .padding(.top, 50)
                .padding(.horizontal, 16)
                
                Spacer(minLength: 16)
                
                termsOfUseView
                    .padding(EdgeInsets(top: 4, leading: 16, bottom: 20, trailing: 16))
                    .multilineTextAlignment(.center)
                
                EventzButton(isEnabled: $isSignUpButtonEnabled, isLoading: isLoading, title: "Cadastrar", action: {
                    let request = UserRegisterRequest(name: nameText, email: emailText, password: passwordText, roles: isCheckBoxSelected ? 2 : 1)
                    
                    Task {
                        await viewModel.register(request: request)
                    }
                })
                .padding([.leading, .trailing, .bottom], 16)
                .onReceive(viewModel.$data, perform: { _ in
                    
                })
                .alert("Atenção", isPresented: $viewModel.showAlert) {
                    Button("Ok") {}
                } message: {
                    Text(viewModel.alertMessage)
                }
                
            }
        }
        .navigationBarBackButtonHidden()
        .navigationBarItems(
            leading:
                Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.whiteLabel)
                })
        )
        .navigationTitle("CADASTRE-SE")
    }
}

// MARK: - Layout
private extension SignupView {
    
    var fieldsView: some View {
        VStack {
            EventzTextField(text: $nameText, titleLabel: "Nome", placeholder: "Seu nome")
                .onReceive(nameText.publisher) { _ in
                    setSignupButtonEnabledIfPossible()
                }
                .padding([.top, .leading, .trailing], 16)
            
            EventzTextField(text: $emailText, titleLabel: "E-mail", placeholder: "seu@email.com")
                .onReceive(emailText.publisher) { _ in
                    setSignupButtonEnabledIfPossible()
                }
                .padding([.top, .leading, .trailing], 16)
            
            EventzTextField(isPasswordField: true, text: $passwordText, titleLabel: "Senha", placeholder: "Números e letras")
                .onReceive(passwordText.publisher) { _ in
                    setSignupButtonEnabledIfPossible()
                }
                .padding([.top, .leading, .trailing], 16)
        }
    }
    
    var termsOfUseView: some View {
        Text("Ao me cadastrar, concordo com os ")
            .font(.blinker(type: .regular, size: 12))
            .foregroundColor(.whiteLabel) +
        
        Text("Termos de Uso")
            .font(.blinker(type: .bold, size: 12))
            .foregroundColor(.whiteLabel) +
        
        Text(" da Eventz.")
            .font(.blinker(type: .regular, size: 12))
            .foregroundColor(.whiteLabel)
    }
    
}

// MARK: - Functions
private extension SignupView {
    
    func setSignupButtonEnabledIfPossible() {
        isSignUpButtonEnabled = {
            !nameText.isEmpty &&
            !emailText.isEmpty &&
            !passwordText.isEmpty
        }()
    }
    
}
