//
//  MyTicketsDetailViewModel.swift
//  Eventz
//
//  Created by Marcel Felipe Gottardi Anesi on 28/03/24.
//

import Foundation

class MyTicketsDetailViewModel: ObservableObject {
    
    let ticket: MyTicketsModel
    let qrCode: String?
    
    init(data: MyTicketsModel, qrCodeString: String?) {
        ticket = data
        qrCode = qrCodeString
    }
}
