# Injection

A simple library for injecting dependency in [Swift](https://developer.apple.com/swift/) programming language.

## Installing Injection

### Swift Package Manager

To install Poppify using [Swift Package Manager](https://github.com/apple/swift-package-manager) you can follow the [tutorial published by Apple](https://developer.apple.com/documentation/xcode/adding_package_dependencies_to_your_app) using the URL for the Injection repo with the current version:

1. In Xcode, select “File” → “Add Packages...”
1. Enter https://github.com/OccamsCode/Injection

or you can add the following dependency to your `Package.swift`:

```swift
.package(url: "https://github.com/OccamsCode/Injection/", from: "0.1.0")
```

## Usage
1. [Create the Key](create-the-key)
2. [Register Value](register-value)
3. [Usng Injected Value](using-injected-value)

### Create The Key

A key is an object which conforms to the `InjectionKey` protocol.
The protocol contains a single property `currentValue`

```swift
struct User {
    var name: String = "Steve Jobs"
}

private struct UserKey: InjectionKey {
    static var currentValue: User = User()
}
```

### Register Value

To register the value, extend the `InjectedValues` type to define the computed property which will access `InjectedValues` which ultimately stores the value 

```swift
extension InjectedValues {
    var user: User {
        get { Self[UserKey.self] }
        set { Self[UserKey.self] = newValue }
    }
}
```

### Usng Injected Value

Create a varible using the `@Injected` property wrapper along with the key path (`\.user`) for the value

```swift
struct ViewModel {
    @Injected(\.user) var user
    
    var greeting: String {
        return "Hello, \(user.name)" // "Hello, Steve Jobs"
    }
}
```
