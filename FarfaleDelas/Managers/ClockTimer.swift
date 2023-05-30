//
//  Clock.swift
//  FarfaleDelas
//
//  Created by Lucas Migge de Barros on 29/05/23.
//

import Foundation

final class ClockTimer {
    
//    static var shared = ClockTimer()
    
    private var timer: Timer?
    
    @Published var isRunning: Bool = false
    @Published var secondsPassed: Double = 0
    
    var timerDuration: Double?
    
    init(timer: Timer? = nil) {
    }
    
    deinit {
        stopTimer()
    }
    
    func startTimer(forDuration duration: Double) {
        timerDuration = duration
        isRunning = true
        
        timer = Timer.init(timeInterval: 1, repeats: true) { tempTimer in
            
            if !self.isRunning { return }
            
            let timeRemaining = self.timerDuration! - self.secondsPassed
            
            if timeRemaining > 0 {
                self.secondsPassed += 1
            } else {
                self.isRunning = false
                self.timer?.invalidate()
            }
        }
    }
    
    private func stopTimer() {
        isRunning = false
        timer?.invalidate()
    }
    
    
    func timeRemainingFormatted(forTaskDuration taskDuration: Double) -> String {
        let timeRemaining = taskDuration - secondsPassed
        
        let minutes = Int(timeRemaining) / 60
        let seconds = Int(timeRemaining) % 60
        return String(format: "%02d:%02d", minutes, seconds)

    }
    
    func currentTimeWithAddedSeconds(currentTime: Date, forTaskDuration taskDuration: Double) -> String {
        let timeRemaining = taskDuration - secondsPassed
        
        let estimatedDoneTime = currentTime.addingTimeInterval(timeRemaining)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        
        print("entrou")
        return formatter.string(from: estimatedDoneTime)
    }
    
    
    func taskTimeDoneRatio(forTaskDuration taskDuration: Double) -> Float {
        return Float(secondsPassed) / Float(taskDuration)
    }
    

    
    
}

