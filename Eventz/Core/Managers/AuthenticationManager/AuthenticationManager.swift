//
//  AuthenticationManager.swift
//  Eventz
//
//  Created by Gabriel Olbrisch on 14/01/24.
//

import Foundation

final class AuthenticationManager {
    
    static let shared = AuthenticationManager()
    
    private(set) var isLogged: Bool = true
    private(set) var currentUser: UserModel?
    private(set) var token: String?
    
    func setUserLogged(with credentials: UserCredentialsResponse) {
        //TODO: - Implement
        print("\(#function) not implemented")
    }
}
