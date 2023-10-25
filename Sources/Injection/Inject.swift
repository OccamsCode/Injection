/// A property wrapper for reading injected values
///
/// ```swift
/// struct ViewModel {
///     @Injected(\.client) var client
/// }
/// ```
///
@propertyWrapper
public struct Injected<Value> {
    private let keyPath: WritableKeyPath<InjectedValues, Value>
    
    public var wrappedValue: Value {
        get { InjectedValues[keyPath] }
        set { InjectedValues[keyPath] = newValue }
    }
    
    public init(keyPath: WritableKeyPath<InjectedValues, Value>) {
        self.keyPath = keyPath
    }
}
