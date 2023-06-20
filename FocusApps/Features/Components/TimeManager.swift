//
//  TimeManager.swift
//  productivitySandbox
//
//  Created by Ario Syahputra on 20/06/23.
//

import Foundation

class TimerManager: ObservableObject {
    @Published var hours = 0
    @Published var minutes = 0
    @Published var seconds = 0
    @Published var timerIsRunning = false
    @Published var timer: Timer? = nil
    
    private var soundController = SoundController()
    
    func startTimer() {
        let totalSeconds = hours * 3600 + minutes * 60 + seconds
        timerIsRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            if self.seconds > 0 {
                self.seconds -= 1
            } else {
                if self.minutes > 0 {
                    self.minutes -= 1
                    self.seconds = 59
                } else {
                    if self.hours > 0 {
                        self.hours -= 1
                        self.minutes = 59
                        self.seconds = 59
                    } else {
                        timer.invalidate()
                        self.stopTimer()
                    }
                }
            }
        }
        soundController.playSound(fileName: "ambient")
    }
    
    func stopTimer() {
        timer?.invalidate()
        timerIsRunning = false
        soundController.player?.pause()
    }
    
    func resetTimer() {
        timer?.invalidate()
        hours = 0
        minutes = 0
        seconds = 0
        timerIsRunning = false
        soundController.player?.stop()
    }
    
    func formattedTime() -> String {
        let formattedHours = String(format: "%02d", hours)
        let formattedMinutes = String(format: "%02d", minutes)
        let formattedSeconds = String(format: "%02d", seconds)
        return "\(formattedHours):\(formattedMinutes):\(formattedSeconds)"
    }
}
