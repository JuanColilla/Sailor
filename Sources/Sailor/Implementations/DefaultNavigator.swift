//
//  DefaultNavigator.swift
//  
//
//  Created by Juan Colilla on 1/5/23.
//

import Foundation
import UIKit
import SwiftUI

public class DefaultNavigator<Screen: Navegatable>: Navigator {
    
    public private(set) var navigationController: UINavigationController
    
    public init(rootScreen: Screen) {
        navigationController = UINavigationController(rootViewController: UIHostingController(rootView: rootScreen.view))
        navigationController.isNavigationBarHidden = true
    }
    
    public func setRootController(to screen: Screen) {
        navigationController = UINavigationController(rootViewController: UIHostingController(rootView: screen.view))
    }
    
    public func push(to screen: Screen) {
        navigationController.pushViewController(UIHostingController(rootView: screen.view), animated: true)
    }
    
    public func push(viewController: UIViewController) {
        navigationController.pushViewController(viewController, animated: true)
    }
    
    public func present(modal: Screen) {
        navigationController.topViewController?.present(UIHostingController(rootView: modal.view), animated: true)
    }
    
    public func present(viewController: UIViewController) {
        navigationController.topViewController?.present(viewController, animated: true)
    }
    
    @available(iOS 15, *)
    public func present(popup: Screen) {
        guard let window = UIApplication.shared.connectedScenes.compactMap({ ($0 as? UIWindowScene)?.keyWindow }).last else { return }
        let hostingController = UIHostingController(rootView: popup.view)
        hostingController.view.backgroundColor = UIColor.clear.withAlphaComponent(0.5)
        hostingController.modalPresentationStyle = .overFullScreen
        hostingController.modalTransitionStyle = .crossDissolve
        window.rootViewController?.present(hostingController, animated: true)
    }
    
    public func popToRoot() {
        navigationController.popToRootViewController(animated: true)
    }
    
    public func goBack() {
        navigationController.popViewController(animated: true)
    }
    
    public func dismiss() {
        navigationController.topViewController?.dismiss(animated: true)
    }
    
}
