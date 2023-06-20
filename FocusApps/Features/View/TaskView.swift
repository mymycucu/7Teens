//
//  TaskView.swift
//  productivitySandbox
//
//  Created by Ario Syahputra on 19/06/23.
//

import SwiftUI

struct TaskView: View {
    @State private var items = ["Item 1", "Item 2", "Item 3"]
    var body: some View {
        VStack{
            List {
                ForEach(items, id: \.self) { item in
                    Text(item)
                        .contextMenu {
                            Button(action: {
                                // Rename action
                                // Implement your logic for renaming the item
                                print("Renaming \(item)...")
                            }) {
                                Label("Rename", systemImage: "square.and.pencil")
                            }
                            
                            Button(action: {
                                // Delete action
                                // Implement your logic for deleting the item
                                items.removeAll { $0 == item }
                                print("Deleting \(item)...")
                            }) {
                                Label("Delete", systemImage: "trash")
                            }
                            
                            Button(action: {
                                // Pin action
                                // Implement your logic for pinning the item
                                print("Pinning \(item)...")
                            }) {
                                Label("Pin", systemImage: "pin")
                            }
                        }
                }
            }
        }.navigationTitle("Uncompleted Task")
    }
}


struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
    }
}
