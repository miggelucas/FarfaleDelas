//
//  TaskManager.swift
//  FarfaleDelas
//
//  Created by Lucas Migge de Barros on 29/05/23.
//

import Foundation

class TaskManager: ObservableObject {
    @Published var currentTask: CardInformationProtocol
    
//    @Published var clock: Clock = Clock()
    
    init(currentTask: CardInformationProtocol = DummyCardInformation()) {
        self.currentTask = currentTask
    }
    
}
