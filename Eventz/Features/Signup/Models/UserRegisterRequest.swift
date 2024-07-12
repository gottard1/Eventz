//
//  UserRegisterRequest.swift
//  Eventz
//
//  Created by Gabriel Olbrisch on 09/10/23.
//  Changed by Marcel Felipe Gottardi Anesi on 17/10/23.
//

import Foundation

struct UserRegisterRequest: Codable {
    let name: String
    let email: String
    let password: String
    var roles: Int = 1
    
    enum CodingKeys: CodingKey {
        case name
        case email
        case password
        case roles
    }
}
