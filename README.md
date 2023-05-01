# Sailor: Navigation for SwiftUI the original way.

![Swift 5.7](https://img.shields.io/badge/Swift-5.7-orange.svg)

Sailor is a navigation library for Swift, designed to simplify the management of view transitions in SwiftUI and UIKit applications. Sailor provides an easy-to-use Navigator protocol, a default implementation (`DefaultNavigator`), and a `NavigationLogger` for testing and logging navigation actions (if desired and implemented).

## Features

- Simple navigation handling for both SwiftUI and UIKit
- Customizable with Navigator protocol and Navegatable protocol
- Navigation logging for easy debugging and testing (not by default).

## Usage

### 1. Create a Screen enum

Implement the `Navegatable` protocol in an enum where you define all your app's destination screens:

```swift
import Sailor

enum Screen: Navegatable {
    case login(params: LoginParams)

    var view: AnyView {
        switch self {
        case .login(let params):
            return Screen.loginView(params: params)
        }
    }
}

### 2. Extend Screen for each SwiftUI View

For every SwiftUI View that represents a screen in your app, create an extension of Screen. This example is for a LoginView:

```swift
extension Screen {
    static func loginView(params: LoginParams) -> AnyView {
        return LoginView(params: params)
            .eraseToAnyView()
    }
}
```

### 3. Use DefaultNavigator or create a custom Navigator

Instantiate the DefaultNavigator with the initial root screen or create a custom Navigator by implementing the Navigator protocol (using an environment class as a singleton is recommended here to avoid passing the Navigator and to have access across the Module):

```swift
let navigator = DefaultNavigator(rootScreen: .login(params: LoginParams()))

navigator.push(to: .login(params: LoginParams()))
navigator.present(modal: .login(params: LoginParams()))
```

## Installation

### Swift Package Manager

Add Sailor as a dependency to your Package.swift file:
```swift
dependencies: [
    .package(url: "https://github.com/juancolilla/Sailor.git", from: "1.0.0")
]
```

## License

Sailor is available under the MIT license. See the [LICENSE](https://mit-license.org) file for more information.
