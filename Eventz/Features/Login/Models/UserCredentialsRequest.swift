//
//  UserCredentialsRequest.swift
//  Eventz
//
//  Created by Marcel Felipe Gottardi Anesi on 19/10/23.
//

import Foundation

struct UserCredentialsRequest: Codable {
    var email: String
    var password: String
    
    enum CodingKeys: String, CodingKey {
        case email
        case password
    }
}
