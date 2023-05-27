//
//  SideViewModel.swift
//  FarfaleDelas
//
//  Created by Lucas Migge de Barros on 25/05/23.
//

import Foundation
import SwiftUI

protocol CardInformationProtocol {
    var atividadeText: String { get set }
    var duration: String { get set }
    var setColor: String { get set }
    
}

struct DummyCardInformation: CardInformationProtocol {
    var atividadeText: String = "Nome da atividade"
    
    var duration: String = "30"
    
    var setColor: String = "Green"
    
    
}

class SideViewModel: ObservableObject {
    enum State {
        case idle, playing
    }
    
    private var timer: Timer?
    
    @Published var state: State = .idle
    @Published var secondsPassed: Double = 0 // Tempo inicial em segundos
    @Published var clockRunning: Bool = false
    @Published private var currentTime: Date = Date()
    
    @Published private var cardInfo: CardInformationProtocol
    
    var currentTaskName: String {
        cardInfo.atividadeText
    }
    
    var taskTimeDuration: Double {
        Double(cardInfo.duration) ?? Double(99)
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
    
    var timeRemaining: Double {
        taskTimeDuration - secondsPassed
    }
    
    var timeRemainingFormatted: String {
        let minutes = Int(timeRemaining) / 60
        let seconds = Int(timeRemaining) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    var timeRatio: Float {
        Float(secondsPassed) / Float(taskTimeDuration)
    }
    
    var estimatedDoneTime: String {
        currentTimeWithAddedSeconds()
    }
    
    
    init(cardInfo: CardInformationProtocol = DummyCardInformation()) {
        self.cardInfo = cardInfo
        startTimer()
    }
    
    
    private func startTimer() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            
            // updates time
            currentTime = Date()
            
            
            if !clockRunning { return }
            
            if self.timeRemaining > 0 {
                self.secondsPassed += 1
            } else {
                clockRunning = false
            }
            
        }
    }
    
    private func stopTimer() {
        self.timer?.invalidate()
    }
    
    
    private func currentTimeWithAddedSeconds() -> String {
        
        let estimatedDoneTime = currentTime.addingTimeInterval(timeRemaining)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        
        return formatter.string(from: estimatedDoneTime)
    }
    
    
    func startButtonPressed() {
        state = .playing
        clockRunning = true
    }
    
    func pauseButtonPressed() {
        clockRunning = false
    }
    
    func resumeButtonPressed() {
        clockRunning = true
    }
    
    func doneButtonPressed() {
        state = .idle
        clockRunning = false
    }
    
    func settingButtonPressed() {
        
    }
    
}
