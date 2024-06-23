//
//  DependencyContainer.swift
//  DependencyContainer
//
//  Created by Dulio Denis on 6/23/24.
//

import Foundation

protocol DependencyContainer {
    func register<T>(type: T.Type, _ factory: @escaping () -> T)
    func registerSingleton<T>(type: T.Type, _ factory: @escaping () -> T)
    func resolve<T>(type: T.Type) -> T?
}
