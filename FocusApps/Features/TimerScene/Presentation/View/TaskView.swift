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
        VStack {
            List {
                ForEach(items, id: \.self) { item in
                    Text(item)
                        .swipeActions(edge: .trailing) {
                            // Delete action
                            Button(action: {
                                items.removeAll { $0 == item }
                                print("Deleting \(item)...")
                            }) {
                                Label("Delete", systemImage: "trash")
                            }
                            .tint(.red)
                        }
                        .swipeActions(edge: .leading) {
                            // Pin action
                            Button(action: {
                                print("Pinning \(item)...")
                            }) {
                                Label("Pin", systemImage: "pin")
                            }
                            .tint(.yellow)
                        }
                        .contextMenu {
                            // Context menu actions (rename, delete, pin)
                            Button(action: {
                                print("Renaming \(item)...")
                            }) {
                                Label("Rename", systemImage: "square.and.pencil")
                            }
                            
                            Button(action: {
                                items.removeAll { $0 == item }
                                print("Deleting \(item)...")
                            }) {
                                Label("Delete", systemImage: "trash")
                            }
                            
                            Button(action: {
                                print("Pinning \(item)...")
                            }) {
                                Label("Pin", systemImage: "pin")
                            }
                        }
                }
                .onMove { indices, newOffset in
                    items.move(fromOffsets: indices, toOffset: newOffset)
                }
            }
        }
        .navigationBarTitle("Uncompleted Task")

    }

}


struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
    }
}
