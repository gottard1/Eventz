//
//  Endpoint.swift
//  Eventz
//
//  Created by Gabriel Olbrisch on 09/10/23.
//

import Foundation

enum Endpoint: String {
    case signup = "api/User/Register"
    case login = "api/Person/Login"
    case getEvents = "api/Event/getAllEvents"
}
