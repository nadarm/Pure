/// A module that can be configurated with an existing instance.
public protocol ConfiguratorModule: class, Module {

  /// A configurator for `Self`.
  associatedtype Configurator = Pure.Configurator<Self>

  /// Configures an existing module with a dependency and a payload.
  func configure(dependency: Dependency, payload: Payload)
}

public extension ConfiguratorModule where Dependency == Void {
  public func configure(payload: Payload) {
    self.configure(dependency: Void(), payload: payload)
  }
}

public extension ConfiguratorModule where Payload == Void {
  public func configure(dependency: Dependency) {
    self.configure(dependency: dependency, payload: Void())
  }
}

public extension ConfiguratorModule where Dependency == Void, Payload == Void {
  public func configure() {
    self.configure(dependency: Void(), payload: Void())
  }
}
