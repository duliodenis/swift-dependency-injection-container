//
//  ContentView.swift
//  DependencyContainer
//
//  Created by Dulio Denis on 6/23/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var messageViewModel: MessageViewModel
    @EnvironmentObject var counterViewModel: CounterViewModel
    
    var body: some View {
        VStack {
            Text(messageViewModel.message)
                .padding()
            
            Text("Counter: \(counterViewModel.count)")
                .padding()
            
            Button(action: {
                counterViewModel.increment()
            }) {
                Text("Increment Counter")
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // Setting up a preview container
        let container = SimpleDependencyContainer()
        container.setupDependencies()
        
        return ContentView()
            .environmentObject(container.resolve(type: MessageViewModel.self)!)
            .environmentObject(container.resolve(type: CounterViewModel.self)!)
    }
}
