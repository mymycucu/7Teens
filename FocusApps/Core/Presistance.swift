//
//  Presistance.swift
//  FocusApps
//
//  Created by Hilmy Noerfatih on 17/06/23.
//

import CoreData
 
struct PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentContainer
 
    init() {
        container = NSPersistentContainer(name: "FocusData")
        
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Container load failed: \(error)")
            }
        }
    }
}
