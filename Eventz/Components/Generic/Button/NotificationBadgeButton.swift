//
//  NotificationBadgeButton.swift
//  Eventz
//
//  Created by Gabriel Olbrisch on 17/10/23.
//

import SwiftUI

struct NotificationBadgeButton: View {
    
    @StateObject private var notificationsManager: NotificationsManager = .shared
    
    var body: some View {
        ZStack {
            Image(systemName: "bell")
            if notificationsManager.notifications.count > 0 {
                Circle()
                    .fill(.red)
                    .frame(width: 10, height: 10)
                    .position(CGPoint(x: 15, y: 0))
            }
        }
        .frame(width: 20, height: 20)
    }
    
}

#Preview {
    NotificationBadgeButton()
}
