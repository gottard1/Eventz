//
//  EventzApp.swift
//  Eventz
//
//  Created by Gabriel Olbrisch on 28/09/23.
//

import SwiftUI

@main
struct EventzApp: App {
    
    init() {
        configNavigationAppearance()
        configTabBarAppearance()
    }
    
    var body: some Scene {
        WindowGroup {
            MainContentView()
        }
    }
    
    private func configNavigationAppearance() {
        let customAppearance = UINavigationBarAppearance()
        customAppearance.backgroundColor = .gray2E2E2E
        customAppearance.shadowColor = .clear
        
        customAppearance.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont(name: "BungeeSpice-Regular", size: 20) as Any
        ]
        
        customAppearance.largeTitleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont(name: "BungeeSpice-Regular", size: 30) as Any
        ]
        UINavigationBar.appearance().standardAppearance = customAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = customAppearance
    }
    
    private func configTabBarAppearance() {
        let customTabBarAppearance = UITabBarAppearance()
        customTabBarAppearance.backgroundColor = .tabBarBackground
        UITabBar.appearance().standardAppearance = customTabBarAppearance
    }
}
