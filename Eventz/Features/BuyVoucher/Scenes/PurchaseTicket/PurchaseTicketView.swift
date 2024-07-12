//
//  PurchaseTicketView.swift
//  Eventz
//
//  Created by Marcel Felipe Gottardi Anesi on 19/01/24.
//

import SwiftUI

struct PurchaseTicketView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var isEnabled: Bool = false
    
    @ObservedObject private var viewModel: PurchaseTicketViewModel = .init()
    
    private var isButtonEnabled: Bool = true
    
    var body: some View {
        ZStack {
            Color.backgroundGray
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(alignment: .leading) {
                    PartyHeaderView(infos: viewModel.partyInfo)
                        .padding()
                    
                    ForEach(viewModel.ticketLot) { lot in
                        VStack(alignment: .leading) {
                            Text(lot.section)
                                .font(.blinker(type: .extraBold, size: 20))
                                .foregroundColor(.whiteLabel)
                                .padding(.leading, 16)
                            
                            ForEach(lot.tickets) { ticket in
                                TicketInfoView(ticket: ticket) { row in
                                    viewModel.addSelectedTicket(row)
                                    changeButtonState()
                                } minusAction: { row in
                                    viewModel.removeSelectedTicket(row)
                                    changeButtonState()
                                }
                                
                            }
                        }
                    }
                    .padding(.top, 16)
                    
                    serviceTaxText
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    Spacer(minLength: 200)
                }
            }
            .overlay {
                VStack {
                    Spacer()
                    
                    gradientTotalView
                }
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
            .navigationBarTitleDisplayMode(.large)
            .navigationTitle("INGRESSOS")
        }
    }
}

extension PurchaseTicketView {
    
    var serviceTaxText: some View {
        Text("*Taxa de serviço: ")
            .font(Font.blinker(type: .bold, size: 12))
            .foregroundColor(.white) +
        
        Text("A taxa de serviço permite a manutenção de nossa plataforma e a continuidade dos serviços prestados pela Eventz")
            .font(Font.blinker(type: .light, size: 12))
            .foregroundColor(.white)
    }
    
    var totalValueText: some View {
        Text("TOTAL: ")
            .font(Font.blinker(type: .regular, size: 20))
            .foregroundColor(.white) +
        
        Text(getTicketsValue().formatAsCurrency())
            .font(Font.blinker(type: .bold, size: 20))
            .foregroundColor(.white)
    }
    
    var gradientTotalView: some View {
        VStack(spacing: 0) {
            LinearGradient(gradient: Gradient(colors: [Color.backgroundGray, .clear]),
                           startPoint: .bottom,
                           endPoint: .top)
            .edgesIgnoringSafeArea(.all)
            .frame(height: 65)
            
            VStack(alignment: .leading) {
                totalValueText
                    .padding()
                
                NavigationLink {
                    let summary = PurchaseSummaryModel(partyInfo: viewModel.partyInfo,
                                                       purchaseTickets: viewModel.selectedTickets)
                    PurchaseSummaryView(purchaseInfo: summary)
                } label: {
                    EventzButtonView(isEnabled: $isEnabled,
                                     title: "Finalizar compra")
                        .padding([.bottom, .leading, .trailing], 16)
                }
            }
            .background(Color.backgroundGray)
        }
    }
    
}

extension PurchaseTicketView {
    
    private func getTicketsValue() -> Double {
        var selectedValue = 0.0
        
        viewModel.selectedTickets.forEach { ticket in
            
            if ticket.quantity == 1 {
                selectedValue += ticket.price
            } else {
                let value = ticket.price * Double(ticket.quantity)
                selectedValue += value
            }
        }
        
        return selectedValue
    }
    
    private func changeButtonState() {
        isEnabled = (getTicketsValue() > 0.0)
    }
    
}

#Preview {
    NavigationView {
        PurchaseTicketView()
    }
}
