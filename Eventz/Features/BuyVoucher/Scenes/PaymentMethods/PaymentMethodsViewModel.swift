//
//  PaymentMethodsViewModel.swift
//  Eventz
//
//  Created by Marcel Felipe Gottardi Anesi on 16/02/24.
//

import Foundation

class PaymentMethodsViewModel: ObservableObject {
    
    var purchase: PurchaseSummaryModel
    
    @Published var paymentMethods: [PaymentMethod] = [
        PaymentMethod(image: "pix-icon", title: "Pix", isSelected: true),
        PaymentMethod(image: "picpay-icon", title: "PicPay", isSelected: false),
        PaymentMethod(image: "paypal-icon", title: "PayPal", isSelected: false),
        PaymentMethod(image: "apple-pay-icon", title: "Apple pay", isSelected: false),
        PaymentMethod(image: "giftcard-icon", title: "Gift card", isSelected: false),
        PaymentMethod(image: "billet-icon", title: "Boleto", isSelected: false),
        PaymentMethod(image: "card-icon", title: "Cartão de crédito ou débito", isSelected: false),
    ]
        
    init(_ purchase: PurchaseSummaryModel) {
        self.purchase = purchase
    }
    
    func changeButtonState(_ index: Int) {
        paymentMethods.indices.forEach { indexSelected in
            paymentMethods[indexSelected].isSelected = (index == indexSelected)
        }
    }
}
