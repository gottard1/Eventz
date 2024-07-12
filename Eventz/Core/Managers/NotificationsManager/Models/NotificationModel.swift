//
//  NotificationModel.swift
//  Eventz
//
//  Created by Gabriel Olbrisch on 11/11/23.
//

import Foundation

struct NotificationModel: Codable, Hashable {
    let title: String
    let description: String
    let date: String
    
    enum CodingKeys: CodingKey {
        case title
        case description
        case date
    }
}
