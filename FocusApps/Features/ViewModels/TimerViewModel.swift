//
//  TimerViewModel.swift
//  FocusApps
//
//  Created by Hilmy Noerfatih on 23/06/23.
//

import Foundation

@MainActor
class TimerViewModel: ObservableObject {
    @Published var task: TaskMO
    @Published var timerManager: TimerManager
    
    let character: CharacterMO?
    
    init(character: CharacterMO?){
        self.character = character
        task = TaskMO()
        timerManager = TimerManager()
    }
    
    func startTimer(){
        timerManager.startTimer()
    }
    
    func stopTimer(){
        timerManager.stopTimer()
    }
    
}

