//
//  TimerViewModel.swift
//  FocusApps
//
//  Created by Hilmy Noerfatih on 23/06/23.
//

import Foundation
import CoreData

@MainActor
class FocusViewModel: ObservableObject {
    @Published var task: TaskMO?
    @Published var session: SessionMO?
    @Published var activity: ActivityMO?
    
    @Published var focusUI: FocusUI = FocusUI()
    
    var timerController: TimerController
    @Published var soundController: SoundController
    
    struct FocusUI {
        var timerIsActive = false
        var formattedTime = ""
    }
    
    let preview: Bool
    
    init(preview: Bool = false) {
        self.preview = preview
        self.timerController = TimerController()
        self.soundController = SoundController()
        self.timerController.delegate = self
        //
        self.task = nil
        self.session = nil
        self.activity = nil
    }
    
    func createTask(name: String){
        let newTask = PersistenceController.shared.create(TaskMO.self)
        newTask!.id = UUID()
        newTask!.name = name
        newTask!.isDone = false
        newTask!.createdAt = Date()
        do {
            try PersistenceController.shared.save()
            self.task = newTask!
        } catch {
            print("Error saving")
        }
    }
    
    func startFocus(){
        
    }
    
    func createSession(){
        let newSession = PersistenceController.shared.create(SessionMO.self)
        newSession!.id = UUID()
        newSession!.task = self.task
        newSession!.createdAt = Date()
    }

    
    func startTimer(){
        timerController.startTimer()
        focusUI.timerIsActive = timerController.timerIsRunning
        
    }
    
    func stopTimer(){
        
    }
    
    
    func startSound(){
        
    }
    
    func stopSound(){
        
    }
    
    
    
    func refreshData(){
        
    }

}

extension FocusViewModel: TimerDelegate {
    func getTime(time: String) {
        focusUI.formattedTime = time
    }
}


