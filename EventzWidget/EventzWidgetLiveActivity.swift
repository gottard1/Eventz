//
//  EventzWidgetLiveActivity.swift
//  EventzWidget
//
//  Created by Marcel Felipe Gottardi Anesi on 18/04/24.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct EventzWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: OrderProgress.self) { context in
            VStack {
                EventzProgressView(progressValue: context.state.status.rawValue)
                
                Spacer()
                
                Text("\(context.state.status.description)")
                    .font(.system(size: 18, weight: .semibold))
                    .padding(.bottom)
                    .foregroundStyle(.whiteLabel)
            }
            .activityBackgroundTint(Color.backgroundGray)
            
        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.leading) {
                    Image(systemName: context.state.status.image)
                        .accessibilityLabel("The avatar of \(context.state.status.description).")
                }
                
                DynamicIslandExpandedRegion(.trailing) {
                    VStack {
                        Text("\(context.state.status.description)")
                            .font(.system(size: 18, weight: .semibold))
                            .padding(.bottom)
                    }
                }
                
                DynamicIslandExpandedRegion(.bottom) {
                    VStack {
                        EventzProgressView(progressValue: context.state.status.rawValue)
                    }
                }
            } compactLeading: {
                Image(systemName: context.state.status.image)
                    .accessibilityLabel("The avatar of \(context.state.status.description).")
            } compactTrailing: {
                ProgressView(value: context.state.status.rawValue, total: 3)
                    .progressViewStyle(.circular)
                    .tint(context.state.status == .ready ? Color.red : Color.green)
            } minimal: {
                //                Text("Minimal \(context.state.status.rawValue)")
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.blue)
        }
    }
}

#Preview("Notification", as: .content, using: OrderProgress.preview) {
    EventzWidgetLiveActivity()
} contentStates: {
    OrderProgress.ContentState.waitingPayment
    OrderProgress.ContentState.processing
    OrderProgress.ContentState.ready
}
