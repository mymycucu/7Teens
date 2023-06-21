//
//  CoreDataView.swift
//  FocusApps
//
//  Created by Hilmy Noerfatih on 20/06/23.
//

import SwiftUI

struct TaskMOsView: View {
//    @Environment(\.managedObjectContext) private var viewContext
    let persistenceController = PersistenceController.shared
    let taskMOs : FetchRequest<TaskMO>
    
    init(){
        taskMOs = FetchRequest<TaskMO>(entity: TaskMO.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \TaskMO.createdAt, ascending: false)])
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Section {
                    List {
                        ForEach(taskMOs.wrappedValue) { task in
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
//    static var persistenceController = PersistenceController.shared
//    static var previews: some View {
//        TaskMOsView().environment(\.managedObjectContext,
//                                    persistenceController.container.viewContext)
//    }
//}
