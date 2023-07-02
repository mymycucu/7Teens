//
//  Presistance.swift
//  FocusApps
//
//  Created by Hilmy Noerfatih on 17/06/23.
//

import CoreData
 
struct PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentCloudKitContainer
    
    var viewContext: NSManagedObjectContext {
        return container.viewContext
    }

    init(inMemory: Bool = false) {
        container = NSPersistentCloudKitContainer(name: "FocusData")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    func create<T: NSManagedObject>(_ type: T.Type) -> T? {
        guard let entityName = T.entity().name else {
            return nil
        }
        let object = NSEntityDescription.insertNewObject(forEntityName: entityName, into: container.viewContext) as? T
        return object
    }
    
    func save() throws {
        if container.viewContext.hasChanges {
            do {
                try container.viewContext.save()
            } catch {
                let nserror = error as NSError
                throw nserror
            }
        }
    }
    
    func delete(_ object: NSManagedObject) {
        container.viewContext.delete(object)
    }
    
    func deleteTask(_ task: TaskMO){
        container.viewContext.delete(task)
    }
    
    func createSampleData(){
        let viewContext = container.viewContext
        
        let task = TaskMO(context: viewContext)
        task.id = UUID()
        task.name = "Belajar SwiftUI"
        task.createdAt = Date()
        task.isDone = false
        
        let session1 = SessionMO(context: viewContext)
        session1.id = UUID()
        session1.createdAt = Date()
        session1.task = task
        
        let activity1 = ActivityMO(context: viewContext)
        activity1.id = UUID()
        activity1.createdAt = Date()
        activity1.type = 1
        activity1.duration = 1800
        activity1.session = session1
        
        let activity2 = ActivityMO(context: viewContext)
        activity2.id = UUID()
        activity2.createdAt = Date()
        activity2.type = 0
        activity2.duration = 300
        activity2.session = session1
        
        let activity3 = ActivityMO(context: viewContext)
        activity3.id = UUID()
        activity3.createdAt = Date()
        activity3.type = 1
        activity3.duration = 600
        activity3.session = session1
        
        let task1 = TaskMO(context: viewContext)
        task1.id = UUID()
        task1.name = "Belajar hangeul"
        task1.createdAt = Date()
        task1.isDone = true
        
        let session2 = SessionMO(context: viewContext)
        session2.id = UUID()
        session2.createdAt = Date()
        session2.task = task1
        
        let activity4 = ActivityMO(context: viewContext)
        activity4.id = UUID()
        activity4.createdAt = Date()
        activity4.type = 1
        activity4.duration = 600
        activity4.session = session2
        
        let session3 = SessionMO(context: viewContext)
        session3.id = UUID()
        session3.createdAt = Date()
        session3.task = task1
        
        let activity5 = ActivityMO(context: viewContext)
        activity5.id = UUID()
        activity5.createdAt = Date()
        activity5.type = 1
        activity5.duration = 1200
        activity5.session = session3
        
        let activity6 = ActivityMO(context: viewContext)
        activity6.id = UUID()
        activity6.createdAt = Date()
        activity6.type = 0
        activity6.duration = 300
        activity6.session = session3
        
        do {
            try viewContext.save()
        }
        catch {
            fatalError("Unable to load sample data: \(error.localizedDescription)")
        }
    }
    
    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        
        result.createSampleData()
        return result
    }()
    
}
