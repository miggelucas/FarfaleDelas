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
    

    private var totalTime: Double
    private var timer: Timer?
    
    @Published var state: State = .idle
    @Published var secondsPassed: Double = 0 // Tempo inicial em segundos
    @Published var currentTaskName: String
    @Published var clockRunning: Bool = false
    @Published private var currentTime: Date = Date()
    
    var timeRemaining: Double {
        totalTime - secondsPassed
    }
    
    var timeRemainingFormatted: String {
        let minutes = Int(timeRemaining) / 60
        let seconds = Int(timeRemaining) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    var timeRatio: Float {
        Float(secondsPassed) / Float(totalTime)
    }
    
    var estimatedDoneTime: String {
        currentTimeWithAddedSeconds()
    }
    
    private var estimatedTime: Date {
        currentTime.addingTimeInterval(timeRemaining)
    }
    
    
    init(totalTime: Double = 180,
         currentTask: String = "Nome da Atividade Atual") {
        self.totalTime = totalTime
        self.currentTaskName = currentTask
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
        
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        
        return formatter.string(from: estimatedTime)
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
        clockRunning
    }
    
    func settingButtonPressed() {
        
    }
    
}
