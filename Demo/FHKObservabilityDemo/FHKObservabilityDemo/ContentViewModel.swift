//
//  ContentViewModel.swift
//  FHKObservabilityDemo
//
//  Created by Fredy Leon on 6/2/26.
//

import Foundation
import Combine
import FHKObservability

class ContentViewModel: ObservableObject {
    var analytics: AnalyticsProtocol
    
    init(analytics: AnalyticsProtocol = FHKAnalytics()) {
        self.analytics = analytics
    }
    
    func logEventDummy() {
        analytics.track(.screenView(Screens.contentView))
        analytics.track(.tapButton(Buttons.btnSendTrack))
    }
}
