//
//  SideViewModel.swift
//  FarfaleDelas
//
//  Created by Lucas Migge de Barros on 25/05/23.
//

import Foundation
import Combine
import SwiftUI



class SideViewModel: ObservableObject {
    enum State {
        case idle, playing
    }
    
    private var clockTimer: ClockTimer
    
    @Published var state: State = .idle
    @Published var currentTime: Date = .now
    @Published var timePlanExceeded: Bool = false
    
    @Published private var cardInfo: CardInformation
    
    init(cardInfo: CardInformation = CardInformation(), clock: ClockTimer = ClockTimer()) {
        self.cardInfo = cardInfo
        self.clockTimer = clock
        self.clockTimer.objectWillChange
            .sink { [weak self] _ in
            self?.currentTime = self?.clockTimer.currentTime ?? Date()
        }
            .store(in: &cancellables)

    }
    
    private var cancellables: Set<AnyCancellable> = []
    
    var currentTaskName: String {
        cardInfo.atividadeText
    }
    
    var currentTaskDescription: String {
        cardInfo.description
    }
    
    var taskTimeDuration: Double {
        Double(cardInfo.duration)!
    }
    
    var timeRatio: Float {
        clockTimer.taskTimeDoneRatio(forTaskDuration: taskTimeDuration)
    }
    
    var timeRemainingFormatted: String {
        clockTimer.timeRemainingFormatted(forTaskDuration: taskTimeDuration)
    }
    
    var taskColor: Color {
        cardInfo.setColor
    }
    
        
    var estimatedDoneTime: String {
        clockTimer.currentTimeWithAddedSeconds(forTaskDuration: taskTimeDuration)
    }
    
    
    var topCommomButtonStyle: CommonButtonView.Style {
        switch state {
        case .idle:
            return .letsBegin
        case .playing:
            if clockTimer.isRunning {
                return .pause
            } else {
                return .resume
            }
            
        }
    }
        
    var bottonCommonButtonStyle: CommonButtonView.Style {
        switch state {
        case .idle:
            return .done
            
        case .playing:
            return .letsBegin
        }
        
    }
    
    func topCommomButtonPressed() {
        switch state {
        case .idle:
            startClock()
        case .playing:
            if clockTimer.isRunning {
                pauseClock()
            } else {
                resumeClock()
            }
            
        }
    }

    func bottonCommonButtonPressed() {
        
    }
    
    
    func startClock() {
        state = .playing
        clockTimer.timerDuration = taskTimeDuration
        clockTimer.isRunning = true
    }
    
    func pauseClock() {
        clockTimer.isRunning = false
    }
    
    func resumeClock() {
        clockTimer.isRunning = true
    }
    
    func doneButtonPressed() {
        state = .idle
//        clock.isRunning = false
    }
    
    func settingButtonPressed() {
        
    }
    
}
