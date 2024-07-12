//
//  PurchaseStatusView.swift
//  Eventz
//
//  Created by Marcel Felipe Gottardi Anesi on 21/02/24.
//

import SwiftUI

enum PurchaseStatus {
    case pending
    case accepted
    case refused
    
    var title: String {
        switch self {
            case .pending:
                return "COMPRA PENDENTE!"
            case .accepted:
                return "COMPRA REALIZADA!"
            case .refused:
                return "COMPRA RECUSADA!"
        }
    }
    
    var subtitle: String {
        switch self {
            case .pending:
                return "Estamos aguardando a confirmação do seu pagamento. Fique tranquilo, enviaremos uma notificação quando isso ocorrer."
            case .accepted:
                return "Em breve você receberá um email com o seu ingresso para impressão e também estará disponível como QR Code na sua sessão de ingressos!"
            case .refused:
                return "Sua compra foi recusada. Não desista! Verifique se há saldo ou limite em seu cartão e tente novamente."
        }
    }
    
    var color: Color {
        switch self {
            case .pending:
                return Color.yellowFFCF52
            case .accepted:
                return Color.green52FF82
            case .refused:
                return Color.redFF5252
        }
    }
    
    var image: String {
        switch self {
            case .pending:
                return "pendingIcon"
            case .accepted:
                return "successfulIcon"
            case .refused:
                return "refusedIcon"
        }
    }
}

struct PurchaseStatusView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var isButtonEnabled: Bool = true
    
    let status: PurchaseStatus
    
    var body: some View {
        ZStack {
            status.color
                .ignoresSafeArea(.all)
            
            VStack  {
                HStack {
                    Image(status.image)
                        .padding(.trailing, 16)
                        .padding(.leading, 30)
                    
                    Text(status.title)
                        .font(.bungeeSpice(size: 35))
                        .padding(.trailing, 30)
                }
                .padding(.top, 100)
                
                Text(status.subtitle)
                    .font(.blinker(size: 18))
                    .padding(.horizontal, 16)
                    .padding(.top, 48)
                    .multilineTextAlignment(.center)
                
                Spacer(minLength: 30)
                
                if status == .accepted {
                    EventzButton(
                        isEnabled: $isButtonEnabled,
                        title: "Ver ingresso",
                        titleColor: status.color,
                        color: .black
                    ) {
                        dismiss()
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 8)
                }
                
                EventzButton(
                    isEnabled: $isButtonEnabled,
                    title: "Entendi",
                    titleColor: status.color,
                    color: .black
                ) {
                    dismiss()
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 16)
            }
        }
    }
}

#Preview {
    PurchaseStatusView(status: .refused)
}
