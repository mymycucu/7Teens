//
//  TimeManager.swift
//  productivitySandbox
//
//  Created by Ario Syahputra on 20/06/23.
//

import Foundation

protocol TimerDelegate {
    func getTime(time: String)
}

class TimerController {
    var hours = 0
    var minutes = 0
    var seconds = 0
    var timerIsRunning = false
    var timer: Timer? = nil
    var delegate: TimerDelegate? = nil
    
//    private var soundController = SoundController()
    
    
    func startTimer() {
//        let totalSeconds = hours * 3600 + minutes * 60 + seconds
        self.timerIsRunning = true
//        soundController.playSound(fileName: "ambient")
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            print("\(self.minutes) min - \(self.seconds) sec")
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
            self.delegate?.getTime(time: self.formattedTime())
        }
//        soundController.player?.stop()
    }
    
    func stopTimer() {
        timer?.invalidate()
        timerIsRunning = false
//        soundController.player?.pause()
    }
    
    func resetTimer() {
        timer?.invalidate()
        hours = 0
        minutes = 0
        seconds = 0
        timerIsRunning = false
//        soundController.player?.stop()
    }
    
    func formattedTime() -> String {
        let formattedHours = String(format: "%02d", hours)
        let formattedMinutes = String(format: "%02d", minutes)
        let formattedSeconds = String(format: "%02d", seconds)
        return "\(formattedHours):\(formattedMinutes):\(formattedSeconds)"
    }
}
