//
//  LoginViewModel.swift
//  Eventz
//
//  Created by Marcel Felipe Gottardi Anesi on 19/10/23.
//

import Foundation

final class LoginViewModel: ObservableObject {

    @Published var alertMessage: String = ""
    @Published var showAlert: Bool = false
    
    @MainActor func login(request: UserCredentialsRequest) async {
        do {
            let data = try await NetworkManager.shared.request(
                httpMethod: .post,
                endpoint: .login,
                body: request,
                responseType: UserCredentialsResponse.self
            )
            
            if let data {
                AuthenticationManager.shared.setUserLogged(with: data)
            }
        } catch(let error) {
            alertMessage = (error as? HTTPError)?.message ?? "Erro desconhecido"
            showAlert = true
        }
    }
    
}
