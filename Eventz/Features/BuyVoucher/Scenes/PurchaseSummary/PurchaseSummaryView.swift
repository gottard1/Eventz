//
//  PurchaseSummaryView.swift
//  Eventz
//
//  Created by Marcel Felipe Gottardi Anesi on 26/01/24.
//

import SwiftUI

struct PurchaseSummaryView: View {
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject private var viewModel: PurchaseSummaryViewModel
    
    @State private var isButtonEnabled: Bool = true
    
    init(purchaseInfo: PurchaseSummaryModel) {
        viewModel = PurchaseSummaryViewModel(summary: purchaseInfo)
    }
    
    var body: some View {
        ZStack {
            Color.backgroundGray
                .ignoresSafeArea(.all)
            
            VStack {
                ScrollView {
                    headerView
                        .padding(.top, 16)
                        .padding(.bottom, 8)
                    
                    ForEach(viewModel.purchaseSummary.purchaseTickets) { purchase in
                        SummaryView(purchase: purchase)
                            .padding(.bottom, 8)
                    }
                    receivingMethod
                        .padding(.bottom, 8)
                    
                    Spacer(minLength: 250)
                }
            }
            .padding(.bottom, 16)
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
                        .foregroundColor(.whiteLabel)
                })
        )
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Functions
private extension PurchaseSummaryView {
    
    func getTicketsValue() -> Double {
        var selectedValue = 0.0
        
        viewModel.purchaseSummary.purchaseTickets.forEach { ticket in
            
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

// MARK: Layout
extension PurchaseSummaryView {
    
    var headerView: some View {
        VStack(alignment: .leading) {
            Text("resumo da compra")
                .font(.bungeeSpice(size: 20))
                .foregroundColor(.whiteLabel)
                .padding(.bottom, 4)
            
            let partyHeader = viewModel.purchaseSummary.partyInfo.local + " - " + viewModel.purchaseSummary.partyInfo.name
            
            Text(partyHeader)
                .font(.blinker(size: 20))
                .foregroundStyle(.whiteLabel)
            
            Divider()
                .background(.whiteLabel)
                .padding(.vertical, 4)
            
            Text(viewModel.purchaseSummary.partyInfo.dateTime)
                .font(.blinker(size: 20))
                .foregroundStyle(.whiteLabel)
        }
        .padding(.horizontal, 16)
    }
    
    var receivingMethod: some View {
        VStack(alignment: .leading) {
            Divider()
                .background(.whiteLabel)
                .padding(.vertical, 4)
            
            Text("Forma de entrega:")
                .font(.blinker(type: .light, size: 16))
                .foregroundStyle(.whiteLabel)
                .padding(.bottom, 8)
            
            Text("Disponível como QR code e impressão")
                .font(.blinker(type: .semiBold, size: 16))
                .foregroundStyle(.whiteLabel)
            
            Text("Voce também receberá em seu email")
                .font(.blinker(type: .light, size: 16))
                .foregroundStyle(.whiteLabel)
        }
        .padding(.horizontal, 16)
    }
    
    var footerView: some View {
        VStack(spacing: 0) {
            Spacer()
            
            LinearGradient(gradient: Gradient(colors: [Color.backgroundGray, .clear]),
                           startPoint: .bottom,
                           endPoint: .top)
            .edgesIgnoringSafeArea(.all)
            .frame(height: 65)
            
            AssuredPurchaseView(timeRemaining: 1200, isActive: true)
                .padding(.vertical, 16)
                .background(Color.backgroundGray)
            
            VStack {
                HStack {
                    Text("TOTAL")
                        .font(.blinker(type: .bold, size: 30))
                        .foregroundStyle(.whiteLabel)
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Text(getTicketsValue().formatAsCurrency())
                            .font(.blinker(type: .bold, size: 18))
                            .foregroundStyle(.whiteLabel)
                        
                        Text("em até 12x sem juros")
                            .font(.blinker(type: .light, size: 12))
                            .foregroundStyle(Color.green52FF82)
                    }
                }
                
                NavigationLink {
                    PaymentMethodsView(purchase: viewModel.purchaseSummary)
                } label: {
                    EventzButtonView(isEnabled: $isButtonEnabled,
                                     title: "Continuar",
                                     color: Color.green52FF82)
                }
            }
            .padding(.horizontal, 16)
            .background(Color.backgroundGray)
        }
    }
}

#Preview {
    NavigationView {
        PurchaseSummaryView(
            purchaseInfo: PurchaseSummaryModel(
                partyInfo: PartyInfo(
                    local: "Dalla Club",
                    name: "Festa de formandos da USP",
                    dateTime: "04/08/2024",
                    address: "Rua Fernando de noronha, N1609, Blumenau"),
                purchaseTickets: [
                    TicketType(ticketNumber: "012344",
                               name: "VIP",
                               description: "Ingresso vip de teste",
                               quantity: 3,
                               section: "2 Lote",
                               price: 180,
                               tax: 8,
                               installments: 4,
                               isSoldOff: true),
                    TicketType(ticketNumber: "018344",
                               name: "VIP PRO",
                               description: "Ingresso vip de teste",
                               quantity: 2,
                               section: "2 Lote",
                               price: 290,
                               tax: 8,
                               installments: 4,
                               isSoldOff: true),
                ]
            )
        )
    }
}
