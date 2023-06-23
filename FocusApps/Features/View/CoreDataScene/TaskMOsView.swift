//
//  CoreDataView.swift
//  FocusApps
//
//  Created by Hilmy Noerfatih on 20/06/23.
//

import SwiftUI

struct TaskMOsView: View {
    let persistenceController = PersistenceController.shared
    @EnvironmentObject var appState: AppState

    var body: some View {
        NavigationView {
            VStack {
                Section {
                    List {
                        ForEach(appState.taskMOList ?? []) { task in
                            NavigationLink {
                                SessionView(taskMO: task)
                                    .navigationTitle("\(task.name!) Session")
                            } label: {
                                Text(task.name!)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Task")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Add Sample Data") {
                        
                        persistenceController.createSampleData()
                    }
                }
            }
        }
    }
}
//struct TaskMOsView_Previews: PreviewProvider {
//    static var previews: some View {
//        TaskMOsView()
//            .environmentObject(AppState())
//            .environment(\.managedObjectContext,
//                          PersistenceController.shared.container.viewContext)
//    }
//}