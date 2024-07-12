//
//  MyTicketsListViewModel.swift
//  Eventz
//
//  Created by Marcel Felipe Gottardi Anesi on 28/03/24.
//

import Foundation

class MyTicketsListViewModel: ObservableObject {
    
    let tickets: [MyTicketsModel]
    
    init(data: [MyTicketsModel]) {
        tickets = data
    }
}

