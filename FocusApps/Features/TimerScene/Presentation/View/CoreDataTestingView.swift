//
//  coreDataTesting.swift
//  FocusApps
//
//  Created by Hilmy Noerfatih on 20/06/23.
//

import SwiftUI

struct CoreDataTestingView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @State var numTask: Int = 0
    
    @FetchRequest(entity: TaskMO.entity(), sortDescriptors: [])
    private var taskMOs: FetchedResults<TaskMO>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(taskMOs) { item in
                    NavigationLink {
                        Text("\(item.createdAt!)")
                    } label: {
                        Text(item.name!)
                    }
                }
            }.toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addTaskMO) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }

        }
        .padding()
    }
    
    func addTaskMO(){
        let newTaskMO = TaskMO(context: viewContext)
        newTaskMO.name = "Task \(numTask)"
        newTaskMO.createdAt = Date()
        newTaskMO.is_done = false
        do {
            try viewContext.save()
            numTask += 1
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    func addSessionMO(task : TaskMO){
        let newSessionMO = SessionMO(context: viewContext)
        newSessionMO.createdAt = Date()
        
        do {
            try viewContext.save()
            numTask += 1
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

struct CoreDataTestingView_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataTestingView()
    }
}
