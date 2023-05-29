//
//  SideViewModel.swift
//  FarfaleDelas
//
//  Created by Lucas Migge de Barros on 25/05/23.
//

import Foundation
import SwiftUI

protocol CardInformationProtocol {
    var taskName: String { get set }
    var taskDescription: String { get set }
    var duration: String { get set }
    var setColor: String { get set }
    
}

struct DummyCardInformation: CardInformationProtocol {
    var taskName: String = "Nome da atividade legal"
    var taskDescription: String = "Detalhe da atividade Lorem ipsum dolor sit amet consectetur."
    var duration: String = "30"
    var setColor: String = "Green"
    
}

class SideViewModel: ObservableObject {
    enum State {
        case idle, playing
    }
    
    @StateObject var clock: Clock = Clock()
    
    @Published var state: State = .idle

    @Published private var cardInfo: CardInformationProtocol
    
    
    init(cardInfo: CardInformationProtocol = DummyCardInformation()) {
        self.cardInfo = cardInfo
        self.clock.timerDuration = taskTimeDuration

    }
    
    var currentTaskName: String {
        cardInfo.taskName
    }
    
    var currentTaskDescription: String {
        cardInfo.taskDescription
    }
    
    var taskTimeDuration: Double {
        Double(cardInfo.duration) ?? Double(99)
    }
    
    var timeRatio: Float {
        clock.timeRatio
    }
    
    var timeRemainingFormatted: String {
        clock.timeRemainingFormatted
    }
    
    var taskColor: Color {
        switch cardInfo.setColor {
            
        case "Red":
            return .red
        case "Green":
            return .green
        case "Blue":
            return .blue
        case "yellow":
            return .yellow
        default:
            return .pink
        }
    }
    
        
    var estimatedDoneTime: String {
        clock.currentTimeWithAddedSeconds()
    }
    
    
    var topCommomButtonStyle: CommonButtonView.Style {
        switch state {
        case .idle:
            return .Start
        case .playing:
            if clock.isRunning {
                return .Pause
            } else {
                return .Resume
            }
            
        }
    }
        
    var bottonCommonButtonStyle: CommonButtonView.Style {
        switch state {
        case .idle:
            return .Done
            
        case .playing:
            return .Start
        }
        
    }
    
    func startButtonPressed() {
        state = .playing
        clock.isRunning = true
    }
    
    func pauseButtonPressed() {
        clock.isRunning = false
    }
    
    func resumeButtonPressed() {
        clock.isRunning = true
    }
    
    func doneButtonPressed() {
        state = .idle
        clock.isRunning = false
    }
    
    func settingButtonPressed() {
        
    }
    
}
