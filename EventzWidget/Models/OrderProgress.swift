//
//  OrderProgress.swift
//  Eventz
//
//  Created by Marcel Felipe Gottardi Anesi on 19/04/24.
//

import ActivityKit

enum OrderStatus: Float, Codable, Hashable {
    case waitingPayment = 1
    case processing
    case ready
    
    var description: String {
        switch self {
            case .waitingPayment:
                return "Aguardando Pagamento..."
            case .processing:
                return "Processando..."
            case .ready:
                return "Pronto!"
        }
    }
    
    var image: String {
        switch self {
            case .waitingPayment:
                return "dollarsign.square.fill"
            case .processing:
                return "checkmark.circle.fill"
            case .ready:
                return "mail.stack.fill"
        }
    }
}

struct OrderProgress: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        let status: OrderStatus
    }
    
    var name: String?
}

extension OrderProgress {
    static var preview: OrderProgress {
        OrderProgress()
    }
}

extension OrderProgress.ContentState {
    static var processing: OrderProgress.ContentState {
        OrderProgress.ContentState(status: .processing)
    }
    
    static var waitingPayment: OrderProgress.ContentState {
        OrderProgress.ContentState(status: .waitingPayment)
    }
    
    static var ready: OrderProgress.ContentState {
        OrderProgress.ContentState(status: .ready)
    }
    
}
