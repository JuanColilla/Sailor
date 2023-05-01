//
//  Navigator.swift
//
//
//  Created by Juan Colilla on 1/5/23.
//

import UIKit
import SwiftUI

/// This protocol is used to create Navigators, it is expected to be able to work with both SwiftUI `Views`and `UIKit` `UIViewController`.
public protocol Navigator {
    associatedtype Screen: Navegatable
    /// Main used `UINavigationController`
    var navigationController: UINavigationController { get }
    /// Sets a Screen as the `rootController` of the `UINavigationView`.
    func setRootController(to screen: Screen)
    /// Pushes a `UIHostingViewController` that wraps your SwiftUI View.
    func push(to screen: Screen)
    /// Pushes your `UIViewController` as a modal  using the default `UINavigationController`.
    func push(viewController: UIViewController)
    /// Presents a modal inside a `UIHostingViewController` that contains your SwiftUI View.
    func present(modal view: Screen)
    /// Presents your `UIViewController` as a modal using the default `UINavigationController`.
    func present(viewController: UIViewController)
    /// Fades a shadowed fullscreen with your SwiftUI View centered and all wrapper into a `UIHostingViewController`.
    @available(iOS 15, *)
    func present(popup: Screen)
    /// Dismisses any modal presented at the top of the `UINavigationController`.
    func dismiss()
    /// Goes all the way back to the first Screen at the Navigation Stack of the `UINavigationController`.
    func popToRoot()
    /// Triggers a `goBack()` on the `UINavigationController`piushing back the last Screen at the Navigation Stack.
    func goBack()
}
