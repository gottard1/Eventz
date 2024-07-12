//
//  UserCredentialsResponse.swift
//  Eventz
//
//  Created by Marcel Felipe Gottardi Anesi on 19/10/23.
//

import Foundation

struct UserCredentialsResponse: Codable {
    let user: UserDataCredentialsResponse
    let token: String
    
    enum CodingKeys: CodingKey {
        case user
        case token
    }
    
    struct UserDataCredentialsResponse: Codable {
        let name: String
        let email: String
        let createdAt: String
        
        enum CodingKeys: CodingKey {
            case name
            case email
            case createdAt
        }
        
        static func empty() -> UserDataCredentialsResponse {
            UserDataCredentialsResponse(name: "", email: "", createdAt: "")
        }
    }
    
    static func empty() -> UserCredentialsResponse {
        UserCredentialsResponse(user: UserDataCredentialsResponse.empty(), token: "")
    }
}
