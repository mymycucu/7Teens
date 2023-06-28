//
//  TimerViewModel.swift
//  FocusApps
//
//  Created by Hilmy Noerfatih on 27/06/23.
//

import Foundation
import AVFoundation

class TimerViewModel: ObservableObject {
    // Data Var
    @Published var task: TaskMO?
    @Published var session: SessionMO?
    @Published var activity: ActivityMO?
    
    @Published var taskName = ""
    @Published var isNewTask = true
    
    // TimerController Var
    var hours = 0
    var minutes = 0
    var seconds = 0
    @Published var totalSeconds = 0
    @Published var timerIsRunning = false
    var timer: Timer? = nil
    
    // SoundController Var
    var player: AVAudioPlayer?
    
    // MARK: ViewModel Func
    func startSession(){
        playSound(fileName: "ambient")
        startTimer(sec: hours * 3600 + minutes * 60 + seconds)
    }
    
    func stopSession(){
        stopSound()
        stopTimer()
    }

    
    
    // MARK: TimerController Func
    func startTimer(sec : Int) {
        self.totalSeconds = sec
        self.timerIsRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [self] timer in
            if self.totalSeconds > 0 {
                self.totalSeconds -= 1
            } else {
                self.stopSession()
                self.timerIsRunning = false
            }
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        resetTimer()
        timerIsRunning = false
    }
    
    func resetTimer() {
        timer?.invalidate()
        hours = 0
        minutes = 0
        seconds = 0
        timerIsRunning = false
    }
    
    func updateHourMinuteSec(){
        self.hours = totalSeconds / 3600
        self.minutes = (totalSeconds % 3600) / 60
        self.seconds = (totalSeconds % 3600) % 60
    }
    
    func formattedTime(totalSecond: Int) -> String {
        let formattedHours = String(format: "%02d", (totalSeconds / 3600))
        let formattedMinutes = String(format: "%02d", ((totalSeconds % 3600) / 60))
        let formattedSeconds = String(format: "%02d", ((totalSeconds % 3600) % 60))
        return "\(formattedHours):\(formattedMinutes):\(formattedSeconds)"
    }
    
    
    // MARK: SoundController Func
    func playSound(fileName: String) {
        guard let url = Bundle.main.url(forResource: fileName, withExtension: ".mp3") else {
            print("Sound file not found: \(fileName)")
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error playing sound \(error.localizedDescription)")
        }
        
//        player?.numberOfLoops = -1
    }
    
    func stopSound(){
        player?.stop()
    }
    
    func setVolume(_ volume: Float) {
        player?.volume = volume
    }
    
}
