//
//  MessageViewModel.swift
//  DependencyContainer
//
//  Created by Dulio Denis on 6/23/24.
//

import Foundation

class MessageViewModel: ObservableObject {
    @Published var message: String = ""
    
    init(messageProvider: MessageProvider) {
        self.message = messageProvider.message
    }
}
