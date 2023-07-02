//
//  UncompleteViewModel.swift
//  FocusApps
//
//  Created by Hilmy Noerfatih on 25/06/23.
//

import Foundation
import CoreData
import SwiftUI

@MainActor
class UncompleteViewModel: ObservableObject {
    @Published var taskMOList: [TaskMO] = []
    @Published var taskSelected: TaskMO? = nil
    @Published var deletedPointer = false
    
    func refreshData() -> Void{
        taskMOList = getTaskUncompleteData()
    }
    
    func initData() -> Void {
        taskMOList = getTaskUncompleteData()
    }
    
    func getTaskUncompleteData() ->[TaskMO]  {
        var taskList: [TaskMO] = []
        let fetchRequest: NSFetchRequest<TaskMO> = TaskMO.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "isDone == 0 && isRemoved == 0")
        let sort = NSSortDescriptor(key: #keyPath(TaskMO.createdAt), ascending: false)
        fetchRequest.sortDescriptors = [sort]
        
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
    
    func deleteTask(task: TaskMO){
        task.isRemoved = true
        self.save()
    }
    
    
    var sortOption: SortOption = .latestFirst // Default sort option

    enum SortOption: String, CaseIterable, Identifiable {
        case oldestFirst = "Oldest"
        case latestFirst = "Latest"

        var id: SortOption { self }
    }

    func togglePin(for item: TaskList) {
        if let index = taskMOList.firstIndex(where: { $0.id == item.id }) {
            withAnimation {
                taskMOList[index].isPinned.toggle()
//                sortItems()
            }
        }
    }

}
