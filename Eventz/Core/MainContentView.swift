//
//  ContentView.swift
//  Eventz
//
//  Created by Gabriel Olbrisch on 28/09/23.
//

import SwiftUI

struct MainContentView: View {
    
    var body: some View {
        TabView {
            homeViewNavigation
            loginViewNavigation
        }
        .onAppear {
            UITabBar.appearance().backgroundColor = .tabBarBackground
        }
        .tint(.whiteLabel)
    }
    
}

private extension MainContentView {
    
    var homeViewNavigation: some View {
        NavigationStack {
            HomeView()
                .tint(.whiteLabel)
                .navigationTitle("Eventz")
                .toolbar {
                    NavigationLink {
                        NotificationsView()
                    } label: {
                        NotificationBadgeButton()
                    }
                }
        }
        .tabItem {
            Image("homeIcon")
        }
    }
    
    var loginViewNavigation: some View {
        NavigationStack {
            LoginView()
                .tint(.whiteLabel)
                .navigationTitle("Login")
        }
        .tabItem {
            Image("personIcon")
        }
    }
    
}

#Preview {
    MainContentView()
}
