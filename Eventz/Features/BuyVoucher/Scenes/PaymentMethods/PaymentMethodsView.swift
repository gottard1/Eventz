//
//  PaymentMethodsView.swift
//  Eventz
//
//  Created by Marcel Felipe Gottardi Anesi on 16/02/24.
//

import SwiftUI

struct PaymentMethodsView: View {
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject private var viewModel: PaymentMethodsViewModel
    
    @State private var isButtonEnabled: Bool = true
    @State private var isShowingModal = false
    
    init(purchase: PurchaseSummaryModel) {
        viewModel = PaymentMethodsViewModel(purchase)
    }
    
    var body: some View {
        ZStack {
            Color.backgroundGray
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(alignment: .leading) {
                    Text("FORMAS DE PAGAMENTO")
                        .font(.bungeeSpice(size: 20))
                        .foregroundStyle(.whiteLabel)
                        .padding(.bottom, 8)
                        .padding(.horizontal, 16)
                    
                    Divider()
                        .background(.whiteLabel)
                        .padding(.horizontal, 16)
                        .padding(.bottom, 30)
                    
                    ForEach(viewModel.paymentMethods.indices, id: \.self) { index in
                        Button {
                            viewModel.changeButtonState(index)
                        } label: {
                            MethodsView(image: viewModel.paymentMethods[index].image,
                                        title: viewModel.paymentMethods[index].title,
                                        isSelected: viewModel.paymentMethods[index].isSelected)
                        }
                    }
                }
                .padding(.vertical, 16)
            }
        }
        .overlay {
            footerView
        }
        .navigationBarBackButtonHidden()
        .navigationBarItems(
            leading:
                Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.whiteLabel)
                })
        )
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Layout
extension PaymentMethodsView {
    
    var footerView: some View {
        VStack(spacing: 0) {
            Spacer()
            
            LinearGradient(gradient: Gradient(colors: [Color.backgroundGray, .clear]),
                           startPoint: .bottom,
                           endPoint: .top)
            .edgesIgnoringSafeArea(.all)
            .frame(height: 65)
            
            AssuredPurchaseView(timeRemaining: 1200, isActive: true)
                .padding(.bottom, 40)
                .background(Color.backgroundGray)
            
            VStack {
                HStack {
                    
                    Text("TOTAL")
                        .font(.blinker(type: .bold, size: 30))
                        .foregroundStyle(.whiteLabel)
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Text(getTotalValue().formatAsCurrency())
                            .font(.blinker(type: .bold, size: 18))
                            .foregroundStyle(.whiteLabel)
                        
                        Text("em até 12x sem juros")
                            .font(.blinker(type: .light, size: 12))
                            .foregroundStyle(Color.green52FF82)
                    }
                }
                
                EventzButton(isEnabled: $isButtonEnabled, title: "Continuar", color: Color.green52FF82) {
                    isShowingModal = true
                }
                .fullScreenCover(isPresented: $isShowingModal) {
                    PurchaseStatusView(status: .accepted)
                        .onDisappear {
                            isShowingModal = false
                        }
                }
            }
            .padding(.horizontal, 16)
            .background(Color.backgroundGray)
        }
    }
    
}

// MARK: - Functions
private extension PaymentMethodsView {
    
    func getTotalValue() -> Double {
        var selectedValue = 0.0
        
        viewModel.purchase.purchaseTickets.forEach { ticket in
            
            if ticket.quantity == 1 {
                selectedValue += (ticket.price + ticket.tax)
            } else {
                let value = (ticket.price + ticket.tax) * Double(ticket.quantity)
                selectedValue += value
            }
        }
        
        return selectedValue
    }
    
}

#Preview {
    NavigationView {
        PaymentMethodsView(
            purchase: PurchaseSummaryModel(
                partyInfo: PartyInfo(
                    local: "Rodeio City",
                    name: "Festa de Rodeio",
                    dateTime: "01/02/2001",
                    address: "Rua de rodeio 1203"
                ), purchaseTickets: [
                    TicketType(
                        ticketNumber: "123da1",
                        name: "Name",
                        description: "Description", 
                        quantity: 2,
                        section: "1 lote",
                        price: 90.0,
                        tax: 9.0,
                        installments: 6,
                        isSoldOff: false
                    )
                ]
            )
        )
    }
}
