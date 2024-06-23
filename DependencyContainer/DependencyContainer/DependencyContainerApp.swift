//
//  DependencyContainerApp.swift
//  DependencyContainer
//
//  Created by Dulio Denis on 6/23/24.
//

import SwiftUI

@main
struct DependencyInjectionApp: App {
    let container = SimpleDependencyContainer()
    
    init() {
        container.setupDependencies()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(container.resolve(type: MessageViewModel.self)!)
                .environmentObject(container.resolve(type: CounterViewModel.self)!)
        }
    }
}
