//
//  NavigationLogger.swift
//  
//
//  Created by Juan Colilla on 1/5/23.
//

import Foundation

public struct NavigationLogger<Screen: Navegatable> {
    public enum NavigationAction: Equatable {
        case push(Screen)
        case presentModal(Screen)
        case presentPopup(Screen)
        case goBack(Screen)
        case dismiss(Screen)
        case none
    }
    
    public var navigations: [NavigationAction] = []
    
    public var lastNavigation: NavigationAction {
        navigations.last ?? .none
    }
}


