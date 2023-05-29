//
//  Clock.swift
//  FarfaleDelas
//
//  Created by Lucas Migge de Barros on 29/05/23.
//

import Foundation

final class Clock: ObservableObject {
    
    private var timer: Timer?
    
    @Published var currentTime: Date
    @Published var isRunning: Bool = false
    @Published var secondsPassed: Double = 0 // Tempo inicial em segundos
    @Published var timerDuration: Double

    init(timer: Timer? = nil, currentTime: Date = Date(), taskDuration: Double = 50) {
        self.timer = timer
        self.currentTime = currentTime
        self.timerDuration = taskDuration
        
        startTimer()
    }
    
    deinit {
        stopTimer()
    }
    
    private func startTimer() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            
            // updates time
            self.currentTime = Date()
            print(currentTime)
            
            if !isRunning { return }
            
            if self.timeRemaining > 0 {
                self.secondsPassed += 1
            } else {
                isRunning = false
            }
            
        }
    }
    
    
    private func stopTimer() {
        self.timer?.invalidate()
    }
    
    
    var timeRemaining: Double {
        timerDuration - secondsPassed
    }
    
    var timeRemainingFormatted: String {
        let minutes = Int(timeRemaining) / 60
        let seconds = Int(timeRemaining) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    var timeRatio: Float {
        Float(secondsPassed) / Float(timerDuration)
    }
    
    func currentTimeWithAddedSeconds() -> String {
        
        let estimatedDoneTime = currentTime.addingTimeInterval(timeRemaining)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        
        return formatter.string(from: estimatedDoneTime)
    }
    
    
}

