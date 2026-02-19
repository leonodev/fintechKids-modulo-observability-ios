//
//  AnalyticsEvent.swift
//  FHKObservability
//
//  Created by Fredy Leon on 6/2/26.
//

import Foundation
import FHKCore

public enum AnalyticsEvent {
    case screenView(Screen)
    case tapButton(Button)
    case error(ErrorDetail)
    
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
    
    public struct ErrorDetail: Equatable {
        public let type: String
        public let message: String
        
        public init(type: String, message: String) {
            self.type = type
            self.message = message
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
            
        case .error:
            return "app_error"
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
            
        case .error(let detail):
            return [
                "error_type": detail.type,
                "error_message": detail.message
            ]
        }
    }
}


public extension AnalyticsEvent.ErrorDetail {
    public init(from fhkError: any FHKError) {
        // Extraemos el nombre del tipo de error
        let errorType = String(describing: Swift.type(of: fhkError))
        // Extraemos el caso específico
        let errorMessage = String(describing: fhkError)
        
        self.init(type: errorType, message: errorMessage)
    }
}
