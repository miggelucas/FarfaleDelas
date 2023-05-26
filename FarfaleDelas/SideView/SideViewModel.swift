//
//  SideViewModel.swift
//  FarfaleDelas
//
//  Created by Lucas Migge de Barros on 25/05/23.
//

import Foundation

class SideViewModel: ObservableObject {
    enum State {
        case idle, playing, paused
    }
    
    private var totalTime: Double
    private var timer: Timer?
    
    @Published var state: State = .idle
    @Published var secondsPassed: Double = 0 // Tempo inicial em segundos
    @Published var currentTaskName: String

    
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
    
    
    init(totalTime: Double = 180,
         currentTask: String = "Nome da Atividade Atual") {
        self.totalTime = totalTime
        self.currentTaskName = currentTask
        startTimer()
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            if self.timeRemaining > 0 {
                self.secondsPassed += 1
            } else {
                stopTimer()
            }
        }
    }
    
    private func stopTimer() {
        self.timer?.invalidate()
    }
    
    func currentTimeWithAddedSeconds() -> String {
        let estimatedTime = Date().addingTimeInterval(totalTime)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        
        return formatter.string(from: estimatedTime)
    }
    
    
    func settingButtonPressed() {
        
    }
    
}
