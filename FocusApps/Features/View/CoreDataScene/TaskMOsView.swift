//
//  CoreDataView.swift
//  FocusApps
//
//  Created by Hilmy Noerfatih on 20/06/23.
//

//import SwiftUI
//
//struct TaskMOsView: View {
//    let persistenceController = PersistenceController.shared
//    @EnvironmentObject var appState: AppState
//    @ObservedObject var viewmodel: InsightViewModel
//    
//    init() {
//        viewmodel = InsightViewModel()
//    }
//
//    var body: some View {
//        NavigationView {
//            VStack {
//                Section {
//                    List {
//                        ForEach(viewmodel.taskMOList) { task in
//                            NavigationLink {
//                                SessionView(taskMO: task)
//                                    .navigationTitle("\(task.name!) Session")
//                            } label: {
//                                Text(task.name ?? "failed to load")
//                            }
//                        }
//                    }
//                }
//            }
//            .navigationTitle("Task")
//            .toolbar {
//                ToolbarItem(placement: .navigationBarLeading) {
//                    Button("Add Sample Data") {
//                        
//                        persistenceController.createSampleData()
//                    }
//                }
//            }
//        }
//    }
//}
//struct TaskMOsView_Previews: PreviewProvider {
//    static var previews: some View {
//        TaskMOsView()
//            .environmentObject(AppState())
//            .environment(\.managedObjectContext,
//                          PersistenceController.shared.container.viewContext)
//    }
//}
