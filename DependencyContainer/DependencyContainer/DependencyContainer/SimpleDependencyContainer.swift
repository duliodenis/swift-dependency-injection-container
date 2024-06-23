//
//  SimpleDependencyContainer.swift
//  DependencyContainer
//
//  Created by Dulio Denis on 6/23/24.
//

import Foundation

final class SimpleDependencyContainer: DependencyContainer {
    private var factories = [String: () -> Any]()
    private var singletons = [String: Any]()
    
    func register<T>(type: T.Type, _ factory: @escaping () -> T) {
        let key = String(describing: type)
        factories[key] = factory
    }
    
    func registerSingleton<T>(type: T.Type, _ factory: @escaping () -> T) {
        let key = String(describing: type)
        singletons[key] = factory()
    }
    
    func resolve<T>(type: T.Type) -> T? {
        let key = String(describing: type)
        if let singleton = singletons[key] as? T {
            return singleton
        }
        return factories[key]?() as? T
    }
    
    func setupDependencies() {
        self.register(type: MessageProvider.self) { SimpleMessageProvider() }
        self.registerSingleton(type: Counter.self) { Counter() }
        self.register(type: MessageViewModel.self) {
            MessageViewModel(messageProvider: self.resolve(type: MessageProvider.self)!)
        }
        self.register(type: CounterViewModel.self) {
            CounterViewModel(counter: self.resolve(type: Counter.self)!)
        }
    }
}
