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
    @Published var charEquipments: String
    
    let preview: Bool
    
    init(preview: Bool = false) {
        self.preview = preview
        self.task = nil
        self.session = nil
        self.activity = nil
        self.background = ""
        self.charEquipments = ""
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
    
    func refreshData(){
        let characterFetchRequest = CharacterMO.fetchRequest()
        characterFetchRequest.predicate = NSPredicate(format: "id == %@", "123")
        let characters = try? PersistenceController.shared.viewContext.fetch(characterFetchRequest)
        
        UserDefaults.standard.set(123, forKey: "myCoin")
        let myCoin = UserDefaults.standard.integer(forKey: "myCoin")
        
        
    }

}

// TO:DO
// 1. Prepare swift data model
// 2. Transform coredata to swift model
// 3. use the swift model for the ui

