//
//  NotificationsView.swift
//  Eventz
//
//  Created by Gabriel Olbrisch on 11/11/23.
//

import SwiftUI

struct NotificationsView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @StateObject private var notificationsManager: NotificationsManager = .shared
    
    var body: some View {
        ZStack {
            Color.backgroundGray
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(notificationsManager.notifications, id: \.self) { notification in
                        NotificationCellView(title: notification.title, description: notification.description, date: notification.date)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
        .navigationBarItems(
            leading:
                Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.whiteLabel)
                }),
            
            trailing:
                Button(action: {
                    
                }, label: {
                    Image(systemName: "slider.horizontal.3")
                        .foregroundStyle(.whiteLabel)
                })
        )
        .navigationTitle("Notificações")
    }
    
}

#Preview {
    NotificationsView()
}
