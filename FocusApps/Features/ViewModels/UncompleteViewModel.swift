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
    
    func refreshData(){
        self.taskMOList = getTaskUncompleteData()
    }
    
    func getTaskUncompleteData() ->[TaskMO]  {
        var taskList: [TaskMO] = []
        let fetchRequest: NSFetchRequest<TaskMO> = TaskMO.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "isDone == 0")
        let sort = NSSortDescriptor(key: #keyPath(SessionMO.createdAt), ascending: false)
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
    
    var sortOption: SortOption = .latestFirst // Default sort option

    enum SortOption: String, CaseIterable, Identifiable {
        case oldestFirst = "Oldest"
        case latestFirst = "Latest"

        var id: SortOption { self }
    }

//    func deleteItem(at index: IndexSet) {
//        .remove(atOffsets: index)
//    }

    func togglePin(for item: TaskList) {
        if let index = taskMOList.firstIndex(where: { $0.id == item.id }) {
            withAnimation {
                taskMOList[index].isPinned.toggle()
//                sortItems()
            }
        }
    }

//    func sortItems() {
//        switch sortOption {
//        case .oldestFirst:
//            taskMOList.sort { (item1, item2) in
//                if item1.isPinned == item2.isPinned {
//                    return item1.title < item2.title
//                } else {
//                    return item1.isPinned && !item2.isPinned
//                }
//            }
//        case .latestFirst:
//            taskMOList.sort { (item1, item2) in
//                if item1.isPinned == item2.isPinned {
//                    return item1.title > item2.title
//                } else {
//                    return item1.isPinned && !item2.isPinned
//                }
//            }
//        }
//    }
}
