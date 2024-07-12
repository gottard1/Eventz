//
//  SignupViewModel.swift
//  Eventz
//
//  Created by Gabriel Olbrisch on 09/10/23.
//

import Foundation

final class SignupViewModel: ObservableObject {
    
    @Published var data: UserRegisterResponse?
    @Published var alertMessage: String = ""
    @Published var showAlert: Bool = false
    
    @MainActor func register(request: UserRegisterRequest) async {
        do {
            data = try await NetworkManager.shared.request(httpMethod: .post, endpoint: .signup, body: request, responseType: UserRegisterResponse.self)
            self.alertMessage = "\(request.name), sua conta foi cadastrada com sucesso!"
            self.showAlert = true
        } catch(let error) {
            self.alertMessage = (error as? HTTPError)?.message ?? "Erro desconhecido"
            self.showAlert = true
        }
    }
    
}
