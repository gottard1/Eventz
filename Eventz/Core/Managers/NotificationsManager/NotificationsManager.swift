//
//  NotificationsManager.swift
//  Eventz
//
//  Created by Gabriel Olbrisch on 17/10/23.
//

import Foundation

final class NotificationsManager: ObservableObject {
    
    static let shared: NotificationsManager = .init()
    
    private init() { }
    
    @Published var notifications: [NotificationModel] = [
        NotificationModel(title: "Notificação", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut dui nec quam rutrum luctus. Sed leo nulla, iaculis et mauris nec, maximus ", date: "Hoje"),
        NotificationModel(title: "Notificação", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut dui nec quam rutrum luctus. Sed leo nulla, iaculis et mauris nec, maximus ", date: "Hoje"),
        NotificationModel(title: "Notificação", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ut dui nec quam rutrum luctus. Sed leo nulla, iaculis et mauris nec, maximus ", date: "Hoje")
    ]
    
}
