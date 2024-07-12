//
//  HomeViewModel.swift
//  Eventz
//
//  Created by Gabriel Olbrisch on 29/09/23.
//

import SwiftUI

final class HomeViewModel: ObservableObject {
    
    @Published var categories: [String] = ["Todos"]
    @Published var events: [EventModel] = []
    @Published var isLoading: Bool = false
    @Published var alertMessage: String = ""
    @Published var showAlert: Bool = false
    
    @Published var isMocked: Bool = true
    
    @MainActor func getEvents(request: GetEventsRequestModel) {
        self.events = EventModel.getMock()
        
///             Connection with API
//        Task {
//            do {
//                isLoading = true
//                let events = try await NetworkManager.shared.request(
//                    httpMethod: .post,
//                    endpoint: .getEvents,
//                    body: request,
//                    responseType: [EventModel].self
//                )
//                
//                if let events {
//                    for event in events {
//                        if !categories.contains(where: { $0 == event.type }), !event.type.isEmpty {
//                            categories.append(event.type)
//                        }
//                    }
//                    
//                    self.events = events
//                }
//                
//                isLoading = false
//            } catch(let error) {
//                alertMessage = (error as? HTTPError)?.message ?? "Erro desconhecido"
//                isLoading = false
//                showAlert = true
//            }
//        }
    }
    
    func nearEventsFiltered(by category: String) -> [EventModel] {
        category.isEmpty || category == "Todos" ? events : events.filter { $0.type == category }
    }
    
}
