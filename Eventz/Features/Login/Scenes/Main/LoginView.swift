//
//  LoginView.swift
//  Eventz
//
//  Created by Marcel Felipe Gottardi Anesi on 29/09/23.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isLoginButtonEnabled: Bool = false
    @State private var showRegisterScreen: Bool = false
    
    @ObservedObject private var viewModel: LoginViewModel
    
    init(viewModel: LoginViewModel = .init()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            Color.backgroundGray
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                EventzTextField(text: $email, titleLabel: "E-mail")
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .padding(.horizontal, 16)
                    .padding(.top, 60)
                
                EventzTextField(isPasswordField: true, text: $password, titleLabel: "Senha")
                    .onReceive(password.publisher) { _ in
                        changeButtonState()
                    }
                    .padding(EdgeInsets(top: 28, leading: 16, bottom: 4, trailing: 16))
                
                forgotPasswordButton
                    .padding([.bottom, .trailing], 16)
                
                SocialLoginView(facebookAction: {
                    // TODO: - Button Action
                }, appleAction: {
                    // TODO: - Button Action
                }, googleAction: {
                    // TODO: - Button Action
                })
                .padding(EdgeInsets(top: 16, leading: 0, bottom: 20, trailing: 0))
                
                Spacer()
                
                registerButton
                    .padding(EdgeInsets(top: 8, leading: 0, bottom: 20, trailing: 0))
                
                NavigationLink {
                    ProfileHomeView()
                } label: {
                    EventzButtonView(isEnabled: $isLoginButtonEnabled,
                                     title: "Entrar")
                    .padding(EdgeInsets(top: 10, leading: 16, bottom: 16, trailing: 16))
                }
                
            }
            .alert("Atenção", isPresented: $viewModel.showAlert) {
                Button("Ok") {}
            } message: {
                Text(viewModel.alertMessage)
            }
        }
    }
}

// MARK: - Functions
private extension LoginView {
    
    func changeButtonState() {
        isLoginButtonEnabled = {
            !email.isEmpty &&
            !password.isEmpty
        }()
    }
    
}

// MARK: - Login
private extension LoginView {
    
    var forgotPasswordButton: some View {
        HStack(spacing: 3) {
            Text("Esqueceu sua senha?")
                .font(.blinker(type: .regular, size: 14))
                .foregroundStyle(.whiteLabel)
            
            Button(action: {
                // TODO: - Ação ao clicar no botão
            }) {
                Text("Clique Aqui!")
                    .font(.blinker(type: .extraBold, size: 14))
                    .foregroundStyle(.whiteLabel)
            }
            
        }
    }
    
    var registerButton: some View {
        HStack(spacing: 3) {
            Text("Ainda não possui uma conta?")
                .font(.blinker(type: .regular, size: 18))
                .foregroundStyle(.whiteLabel)
            
            NavigationLink {
                SignupView()
            } label: {
                Text("Clique Aqui!")
                    .font(.blinker(type: .extraBold, size: 18))
                    .foregroundStyle(.whiteLabel)
            }
        }
    }
    
}

#Preview {
    LoginView()
}
