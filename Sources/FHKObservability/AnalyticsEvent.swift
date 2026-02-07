//
//  AnalyticsEvent.swift
//  FHKObservability
//
//  Created by Fredy Leon on 6/2/26.
//

import Foundation

public enum AnalyticsEvent {
    case screenView(Screen)
    case tapButton(Button)
    
    public struct Screen: Equatable {
        public let name: String
        public let screenClass: String
        
        public init(name: String, screenClass: String) {
            self.name = name
            self.screenClass = screenClass
        }
    }
    
    public struct Button: Equatable {
        public let name: String
        
        public init(name: String) {
            self.name = name
        }
    }
}

public extension AnalyticsEvent {
    var name: String {
        switch self {
        case .screenView:
            return "screen_view"
            
        case .tapButton:
            return "tap_button"
        }
    }
    
    var parameters: [String: Any] {
        switch self {
            
        case .screenView(let screen):
            return [
                "screen_name": screen.name,
                "screen_class": screen.screenClass
            ]
            
        case .tapButton(let button):
            return [
                "button_name": button.name
            ]
        }
    }
}
