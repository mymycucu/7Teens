//
//  AppState.swift
//  FocusApps
//
//  Created by Hilmy Noerfatih on 22/06/23.
//

import Foundation
import CoreData

class AppState: ObservableObject {
    @Published var selectedTab = 1
    
    @Published var background: String = UserDefaults.standard.string(forKey: "background") ??  "bg-forest"
    @Published var song: String = UserDefaults.standard.string(forKey: "song") ??  "forest-wind"
    @Published var body: String = UserDefaults.standard.string(forKey: "body") ??  "cat"
    @Published var hat: String = UserDefaults.standard.string(forKey: "hat") ??  "hat-red"
    @Published var coins: Int = UserDefaults.standard.integer(forKey: "coins")
    @Published var streak: Int = UserDefaults.standard.integer(forKey: "streak")
    @Published var lastStreak: Date = (UserDefaults.standard.object(forKey: "lastStreak") as? Date ?? Calendar.current.startOfDay(for: .distantPast))

    @Published var task: TaskMO? = nil
    
    @Published var allTaskChange = true
    
    var firstRun = true
    let preview: Bool
    
    init(preview: Bool = false) {
        self.preview = preview
        if firstRun {
            appDataInit()
            self.firstRun = false
        }
        refreshData()
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
//        
//        let defaultDate = Calendar.current.startOfDay(for: .distantPast)
//        
//        UserDefaults.standard.set("bg-forest", forKey: "background")
//        UserDefaults.standard.set("forest-wind", forKey: "song")
//        UserDefaults.standard.set("cat", forKey: "body")
//        UserDefaults.standard.set("hat-red", forKey: "hat")
//        UserDefaults.standard.set(0, forKey: "coins")
//        UserDefaults.standard.set(0, forKey: "streak")
//        UserDefaults.standard.set(defaultDate, forKey: "lastStreak")
    }
    
    func refreshData(){
        self.background = UserDefaults.standard.string(forKey: "background") ??  "bg-forest"
        self.song = UserDefaults.standard.string(forKey: "song") ??  "forest-wind"
        self.body = UserDefaults.standard.string(forKey: "body") ??  "cat"
        self.hat = UserDefaults.standard.string(forKey: "hat") ??  "hat-red"
        self.coins = UserDefaults.standard.integer(forKey: "coins")
        self.streak = UserDefaults.standard.integer(forKey: "streak")
        self.lastStreak = UserDefaults.standard.object(forKey: "lastStreak") as? Date ?? Calendar.current.startOfDay(for: .distantPast)
    }
    
    func getBg() -> String{
        return UserDefaults.standard.string(forKey: "background") ??  "bg-forest"
    }

}


