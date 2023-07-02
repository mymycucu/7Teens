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
    
    func getTaskUncompleteData() ->[TaskMO]  {
        var taskList: [TaskMO] = []
        let fetchRequest: NSFetchRequest<TaskMO> = TaskMO.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "isDone == 0")
        
        if let taskMOs = try? PersistenceController.shared.viewContext.fetch(fetchRequest){
            taskList = taskMOs
        }
        return taskList
    }
    
    func save(){
        do {
            try PersistenceController.shared.save()
        } catch {
            print("Error saving")
        }
    }
}
