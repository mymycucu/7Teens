//
//  TimerViewModel.swift
//  FocusApps
//
//  Created by Hilmy Noerfatih on 27/06/23.
//

import Foundation
import AVFoundation
import CoreData

class TimerViewModel: ObservableObject {
    // Data Var
    @Published var task: TaskMO?
    @Published var session: SessionMO?
    @Published var activity: ActivityMO?
    
    @Published var taskName = ""
    @Published var isNewTask = true
    
    @Published var cycle = 0
    @Published var focusStep = 0
    @Published var restStep = 0
    
    @Published var isMusicModalVisible = false
    @Published var isFaqModalVisible = false
    @Published var selectedOption = 0
    @Published var showAlert = false
    
    @Published var sceneState = 0
    @Published var isTimer = false
    
    @Published var streak = UserDefaults.standard.integer(forKey: "streak")
    @Published var bonusStreak = false
    var minStreakMinutes = 1
    
    @Published var reward = RewardModel()
    
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
    func startSession(song: String){
        if isNewTask {
            self.createTask()
        }
        self.createSession()
        playSound(fileName: song)
        self.cycleController()
    }
    
    func cycleController(){
        if (focusStep <= cycle){
            if (focusStep == restStep){
                self.startFocus()
            }else{
                self.startRest()
            }
        } else {
            self.stopSession()
            if (isNewStreak()){
                self.sceneState = 3
            }else{
                self.reward = calculateReward()
                self.sceneState = 4
            }
        }
    }
    
    func stopSession(){
        stopSound()
        stopTimer()
        cycle = 0
        focusStep = 0
        restStep = 0
        sceneState = 0
    }
    
    func startFocus(){
        print("focus")
        self.createFocus()
        startTimer(sec: hours * 3600 + minutes * 60 + seconds)
        self.focusStep += 1
        self.sceneState = 1
        self.isTimer = true
    }
    
    func startRest(){
        print("rest")
        self.createRest()
        startTimer(sec: 10)
        self.restStep += 1
        self.sceneState = 2
        self.isTimer = true
    }
    
    
    func forceStopSession(){
        stopSound()
        stopTimer()
        self.activity!.duration = self.activity!.duration - Int32(totalSeconds)
        self.save()
        self.cycle = 0
        self.focusStep = 1
        self.restStep = 0
        cycleController()
    }

    func createTask(){
        let newTask = PersistenceController.shared.create(TaskMO.self)
        newTask!.id = UUID()
        newTask!.name = self.taskName
        newTask!.isDone = false
        newTask!.createdAt = Date()
        do {
            try PersistenceController.shared.save()
            self.task = newTask
        } catch {
            print("Error saving")
        }
    }
    
    func createSession(){
        let newSession = PersistenceController.shared.create(SessionMO.self)
        newSession!.id = UUID()
        newSession!.createdAt = Date()
        newSession!.task = self.task
        do {
            try PersistenceController.shared.save()
            self.session = newSession
        } catch {
            print("Error saving")
        }
    }
    
    func createFocus(){
        let newFocus = PersistenceController.shared.create(ActivityMO.self)
        newFocus!.id = UUID()
        newFocus!.createdAt = Date()
        newFocus!.type = 0
        newFocus!.duration = Int32(hours * 3600 + minutes * 60 + seconds)
        newFocus!.session = session
        do {
            try PersistenceController.shared.save()
            self.activity = newFocus
        } catch {
            print("Error saving")
        }
    }
    
    func createRest(){
        let newRest = PersistenceController.shared.create(ActivityMO.self)
        newRest!.id = UUID()
        newRest!.createdAt = Date()
        newRest!.type = 1
        newRest!.duration = Int32(0.2*60)
        newRest!.session = session
        do {
            try PersistenceController.shared.save()
            self.activity = newRest
        } catch {
            print("Error saving")
        }
    }
    
    func save(){
        do {
            try PersistenceController.shared.save()
        } catch {
            print("Error saving")
        }
    }
    
    func getTotalTimeSet() -> Int{
        return hours * 3600 + minutes * 60 + seconds
    }
    
    // MARK: Reward
    func getTotalFocusDay() -> Int {
        var totalFocusTime = 0
        let today = Calendar.current.startOfDay(for: .now)
        
        let fetchRequest: NSFetchRequest<ActivityMO> = ActivityMO.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "createdAt >= %@ AND type == 0", today as NSDate)
            
            do {
                let results = try PersistenceController.shared.viewContext.fetch(fetchRequest)
                // Handle the activities that have a relationship to a session
                for activity in results {
                    totalFocusTime += Int(activity.duration)
                }
            } catch {
                // Handle the error
                print("Error fetching activities: \(error)")
            }
        
        return totalFocusTime
    }
    
    func getTotalFocusSession() -> Int{
        var totalFocusTime = 0
        
        let fetchRequest: NSFetchRequest<ActivityMO> = ActivityMO.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "session == %@ AND type == 0", session!)
            
            do {
                let results = try PersistenceController.shared.viewContext.fetch(fetchRequest)
                // Handle the activities that have a relationship to a session
                print("count \(results.count)")
                for activity in results {
                    totalFocusTime += Int(activity.duration)
                }
            } catch {
                // Handle the error
                print("Error fetching activities: \(error)")
            }
        
        return totalFocusTime
    }
    
    func isNewStreak() -> Bool{
        var lastStreak = UserDefaults.standard.object(forKey: "lastStreak") as? Date ?? Calendar.current.startOfDay(for: .distantPast)
        var streak = UserDefaults.standard.integer(forKey: "streak")
        if (getTotalFocusDay() >= minStreakMinutes*60){
            if (lastStreak <= Calendar.current.startOfDay(for: .now)){
                
                // cek apakah kemarin
                UserDefaults.standard.setValue(Date(), forKey: "lastStreak")
                UserDefaults.standard.setValue((streak + 1), forKey: "streak")
                self.streak = UserDefaults.standard.integer(forKey: "streak")
                self.bonusStreak = true
                return true
            }
        }
        return false
    }
    
    func calculateReward() -> RewardModel{
        var totalCoin = 0
        var taskCoin = 0
        var streakCoin = 0
        
        var totalFocusTime = getTotalFocusSession()
        if totalFocusTime >= 25*60{
            totalCoin = 25
            taskCoin = 25
        }else if totalFocusTime >= 20*60{
            totalCoin = 20
            taskCoin = 20
        }else if totalFocusTime >= 15*60{
            totalCoin = 15
            taskCoin = 15
        }else if totalFocusTime >= 10*60{
            totalCoin = 10
            taskCoin = 10
        }else if totalFocusTime >= 5*60{
            totalCoin = 5
            taskCoin = 5
        }
        
        if isNewStreak(){
            totalCoin += 25
            streakCoin = 25
        }
        var oldCoin = UserDefaults.standard.integer(forKey: "coins")
        UserDefaults.standard.setValue((oldCoin+totalCoin), forKey: "coins")
        
        session!.coin = Int32(totalCoin)
        self.save()
        
        return RewardModel(totalCoin: totalCoin, taskCoin: taskCoin, streakCoin: streakCoin)
    }
    
    // MARK: TimerController Func
    func startTimer(sec : Int) {
        self.totalSeconds = sec
        self.timerIsRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [self] timer in
            print("\(totalSeconds)")
            if self.totalSeconds > 0 {
                self.totalSeconds -= 1
            } else {
                self.timerIsRunning = false
                self.stopTimer()
                self.cycleController()
            }
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
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
        return "\(formattedMinutes):\(formattedSeconds)"
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
        
        player?.numberOfLoops = -1
    }
    
    func stopSound(){
        player?.stop()
    }
    
    func setVolume(_ volume: Float) {
        player?.volume = volume
    }
    
}
