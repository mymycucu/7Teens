//
//  FocusAppsApp.swift
//  FocusApps
//
//  Created by Hilmy Noerfatih on 17/06/23.
//

import SwiftUI

@main
struct FocusAppsApp: App {
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView(activityName: "")
                .environment(\.managedObjectContext,
                             persistenceController.container.viewContext)
        }
    }
}
