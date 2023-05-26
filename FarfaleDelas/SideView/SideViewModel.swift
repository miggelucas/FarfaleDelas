//
//  SideViewModel.swift
//  FarfaleDelas
//
//  Created by Lucas Migge de Barros on 25/05/23.
//

import Foundation

class SideViewModel: ObservableObject {
    enum State {
        case idle, playing
    }
    
    private var timer: Timer?
    
    @Published var state: State = .idle
    @Published var secondsPassed: Double = 0 // Tempo inicial em segundos
    @Published var clockRunning: Bool = false
    @Published private var currentTime: Date = Date()
    
    @Published private var cardInfo: CardInformation
    
    var currentTaskName: String {
        cardInfo.atividadeText
    }
    
    var taskTimeDuration: Double {
        Double(cardInfo.duration) ?? Double(99)
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
    
    
    init(totalTime: Double = 180,
         currentTask: String = "Nome da Atividade Atual",
         cardInfo: CardInformation = CardInformation()) {
        self.cardInfo = CardInformation()
        startTimer()
    }
    
    
    
    private func startTimer() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            
            currentTime = Date()
            
            if clockRunning {
                if self.timeRemaining > 0 {
                    self.secondsPassed += 1
                } else {
                    
                    clockRunning = false
                }
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
