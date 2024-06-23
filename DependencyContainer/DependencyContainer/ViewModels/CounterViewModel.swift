//
//  CounterViewModel.swift
//  DependencyContainer
//
//  Created by Dulio Denis on 6/23/24.
//

import Foundation

class CounterViewModel: ObservableObject {
    @Published var count: Int = 0
    private let counter: Counter
    
    init(counter: Counter) {
        self.counter = counter
    }
    
    func increment() {
        counter.increment()
        count = counter.value
    }
}

