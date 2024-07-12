//
//  GetEventsRequestModel.swift
//  Eventz
//
//  Created by Gabriel Olbrisch on 14/01/24.
//

import Foundation

struct GetEventsRequestModel: Codable {
    let longitude: Float
    let latitude: Float
    let range: Double
    
    enum CodingKeys: CodingKey {
        case longitude
        case latitude
        case range
    }
}
