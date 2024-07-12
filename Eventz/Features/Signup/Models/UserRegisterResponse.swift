//
//  UserRegisterResponse.swift
//  Eventz
//
//  Created by Gabriel Olbrisch on 10/10/23.
//

import Foundation

struct UserRegisterResponse: Codable {
    let token: String
    let refreshToken: String
    
    enum CodingKeys: CodingKey {
        case token
        case refreshToken
    }
}
