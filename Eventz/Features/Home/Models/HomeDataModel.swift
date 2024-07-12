//
//  HomeDataModel.swift
//  Eventz
//
//  Created by Gabriel Olbrisch on 08/11/23.
//

import Foundation

struct HomeDataModel: Decodable {
    let categories: [String]
    let sections: [HomeSectionsModel]
    
    enum CodingKeys: CodingKey {
        case categories
        case sections
    }
}
