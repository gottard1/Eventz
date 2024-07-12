//
//  LocalizationDataModel.swift
//  Eventz
//
//  Created by Gabriel Olbrisch on 08/11/23.
//

import Foundation

struct LocalizationDataModel: Codable {
    let latitude: Double
    let longitude: Double
    
    enum CodingKeys: CodingKey {
        case latitude
        case longitude
    }
}
