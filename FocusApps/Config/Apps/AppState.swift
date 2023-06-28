//
//  AppState.swift
//  FocusApps
//
//  Created by Hilmy Noerfatih on 22/06/23.
//

import Foundation
import CoreData

class AppState: ObservableObject {
    @Published var task: TaskMO?
    @Published var session: SessionMO?
    @Published var activity: ActivityMO?
    @Published var background: String
    @Published var char: String
    @Published var body: String
    @Published var hat: String
    
    var firstRun = true
    let preview: Bool
    
    init(preview: Bool = false) {
        self.preview = preview
        self.task = nil
        self.session = nil
        self.activity = nil
        self.background = ""
        self.char = ""
        self.body = ""
        self.hat = ""
        if firstRun {
            appDataInit()
            self.firstRun = false
        }
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
    
    func appDataInit(){
        let catItem = PersistenceController.shared.create(ItemTransactionMO.self)
        catItem!.id = UUID()
        catItem!.itemName = "cat"
        catItem!.createdAt = Date()
        let hatRedItem = PersistenceController.shared.create(ItemTransactionMO.self)
        hatRedItem!.id = UUID()
        hatRedItem!.itemName = "hat-red"
        hatRedItem!.createdAt = Date()
        do {
            try PersistenceController.shared.save()
            self.body = "cat"
            self.hat = "hat-red"
        } catch {
            print("Error saving")
        }
        
        
    }

}

// TO:DO
// 1. Prepare swift data model
// 2. Transform coredata to swift model
// 3. use the swift model for the ui

