//
//  AppState.swift
//  FocusApps
//
//  Created by Hilmy Noerfatih on 22/06/23.
//

import Foundation
import CoreData

class AppState: ObservableObject {
    @Published var timerManager: TimerManager
    @Published var task: TaskMO
    @Published var session: SessionMO
    
    
    let preview: Bool
    
    init(preview: Bool = false) {
        self.preview = preview
        self.timerManager = TimerManager()
        self.task = TaskMO()
        self.session = SessionMO()
    }
    
    func createTask(){
        
    }
    
    func getTaskData() -> [TaskMO] {
        let fetchRequest: NSFetchRequest<TaskMO> = TaskMO.fetchRequest()
        if let taskMOs = try? PersistenceController.shared.viewContext.fetch(fetchRequest) {
            return taskMOs
        }
        return []
    }
    
    func refreshData(){
        
    }

}

// TO:DO
// 1. Prepare swift data model
// 2. Transform coredata to swift model
// 3. use the swift model for the ui

