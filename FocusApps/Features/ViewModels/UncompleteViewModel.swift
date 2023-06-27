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
    
    init() {
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
