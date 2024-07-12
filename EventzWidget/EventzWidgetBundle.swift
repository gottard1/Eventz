//
//  EventzWidgetBundle.swift
//  EventzWidget
//
//  Created by Marcel Felipe Gottardi Anesi on 18/04/24.
//

import WidgetKit
import SwiftUI

@main
struct EventzWidgetBundle: WidgetBundle {
    var body: some Widget {
        EventzWidget()
        EventzWidgetLiveActivity()
    }
}
