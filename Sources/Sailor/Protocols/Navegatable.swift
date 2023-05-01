//
//  Navegatable.swift
//
//  Created by Juan Colilla on 1/5/23.
//

import Foundation
import SwiftUI

/// The idea behind `Navegatable` is to be implemented into an enum where you can set all the destination screens of your app like this:
/// ```
///enum Screen: Navegatable {
///     case login(params:)
///
///     var view: AnyView {
///         switch self {
///             case login(let params):
///                 Screen.loginView(params: params)
///         }
///     }
///  }
///```
///  An extension of Screen is recommended on every SwiftUI View that represents a Screen in your app, like this extension that would be located inside the LoginView.swift file:
///```
///  extension Screen {
///     static func loginView(params: ) -> AnyView {
///         return LoginView(params: params)
///             .eraseToAnyView()
///     }
///```
public protocol Navegatable: Equatable {
    /// `view` property will be used by the navigator to be hosted by the `UIHostingViewController`.
    var view: AnyView { get }
}

public extension View {
    /// Returns an `AnyView` type element from `View`.
    func eraseToanyView() -> AnyView {
        AnyView(self)
    }
}
