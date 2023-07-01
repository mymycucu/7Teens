//
//  UncompleteViewModel.swift
//  FocusApps
//
//  Created by Hilmy Noerfatih on 25/06/23.
//

import Foundation
import CoreData

@MainActor
class UncompleteViewModel: ObservableObject {
    @Published var taskMOList: [TaskMO] = []
    
    func getTaskData() ->[TaskMO]  {
        let fetchRequest: NSFetchRequest<TaskMO> = TaskMO.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "isDone == 0")
        
        if let taskMOs = try? PersistenceController.shared.viewContext.fetch(fetchRequest) {
            self.taskMOList = taskMOs
        }
        return taskMOList
    }
}
