//
//  AppState.swift
//  FocusApps
//
//  Created by Hilmy Noerfatih on 22/06/23.
//

import Foundation
import CoreData

class AppState: ObservableObject {
    @Published var taskMOList: [TaskMO]?
    
    let preview: Bool
    
    init(preview: Bool = false) {
        self.preview = preview
        refreshData()
    }
    
    func refreshData(){
        getTaskData()
    }
    
    func getTaskData() {
        let fetchRequest: NSFetchRequest<TaskMO> = TaskMO.fetchRequest()
        if let taskMOs = try? PersistenceController.shared.viewContext.fetch(fetchRequest) {
            self.taskMOList = taskMOs
        }
    }
}

// TO:DO
// 1. Prepare swift data model
// 2. Transform coredata to swift model
// 3. use the swift model for the ui

