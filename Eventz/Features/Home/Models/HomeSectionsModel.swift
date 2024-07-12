//
//  HomeSectionsModel.swift
//  Eventz
//
//  Created by Gabriel Olbrisch on 08/11/23.
//

import Foundation

struct HomeSectionsModel: Decodable {
    let sectionName: String
    let events: [EventModel]
    
    enum CodingKeys: CodingKey {
        case sectionName
        case events
    }
}
