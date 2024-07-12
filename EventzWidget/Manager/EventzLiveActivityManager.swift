//
//  EventzLiveActivityManager.swift
//  Eventz
//
//  Created by Marcel Felipe Gottardi Anesi on 19/04/24.
//

import Foundation
import ActivityKit

enum EventzLiveActivityError: Error {
    case failedToGetId
    
    var description: String {
        switch self {
            case .failedToGetId:
                return "Algo inesperado aconteceu"
        }
    }
}

@available(iOS 16.2, *)
class EventzLiveActivityManager {
    
    @discardableResult
    static func startActivity(status: OrderStatus) -> String {
        if ActivityAuthorizationInfo().areActivitiesEnabled {
            do {
                let initialState = OrderProgress.ContentState(status: status)
                
                let content = ActivityContent(state: initialState, staleDate: nil)
                
                let activity = try Activity.request(
                    attributes: OrderProgress(),
                    content: content,
                    pushType: nil
                )
                
                return activity.id
            } catch {
                return error.localizedDescription
            }
        }
        
        return EventzLiveActivityError.failedToGetId.description
    }
    
    static func updateActivity(id: String, status: OrderStatus) async {
        let contentState = OrderProgress.ContentState(status: status)
        
        for activity in Activity<OrderProgress>.activities {
            await activity.update(
                ActivityContent<OrderProgress.ContentState>(
                    state: contentState,
                    staleDate: Date.now + 15
                )
            )
        }
    }
    
    static func observeActivity(activity: Activity<OrderProgress>) {
        Task {
            for await activityState in activity.activityStateUpdates {
                if activityState == .dismissed {
//                    self.cleanUpdismissedActivity()
                }
            }
        }
    }
    
    
    static func listAllActivities() -> [[String: String]] {
        let sortedActivities = Activity<OrderProgress>.activities.sorted { $0.id > $1.id }
        return sortedActivities.map {
            ["id": $0.id,
             "status": "\($0.content.state.status.rawValue)"]
        }
    }
    
    static func endActivities() async {
        for activity in Activity<OrderProgress>.activities {
            let status = activity.content.state.status
            
            let finalContent = OrderProgress.ContentState(status: status)
            
            let dismissalPolicy: ActivityUIDismissalPolicy = .default
            
            await activity.end(
                ActivityContent(state: finalContent, staleDate: nil),
                dismissalPolicy: dismissalPolicy
            )
        }
    }
}
