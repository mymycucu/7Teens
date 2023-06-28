//
//  UncompleteTaskView.swift
//  FocusApps
//
//  Created by Ario Syahputra on 28/06/23.
//

import SwiftUI

struct TaskList: Identifiable {
    let id = UUID()
    let title: String
    var isPinned: Bool
}

class UncompleteTaskViewModel: ObservableObject {
    @Published var items: [ListItem] = [ListItem(title: "Item 1", isPinned: false), ListItem(title: "Item 2", isPinned: false),ListItem(title: "Item 1", isPinned: false),ListItem(title: "Item 1", isPinned: false),] // Dynamic array of ListItem
    
    func deleteItem(at index: IndexSet) {
        items.remove(atOffsets: index)
    }
    
    func togglePin(for item: ListItem) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            withAnimation {
                items[index].isPinned.toggle()
                sortItems()
            }
        }
    }
    
    private func sortItems() {
        items.sort { (item1, item2) in
            if item1.isPinned == item2.isPinned {
                return item1.title < item2.title
            } else {
                return item1.isPinned && !item2.isPinned
            }
        }
    }
}

struct UncompleteTaskView: View {
    @StateObject private var viewModel = ListViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.items) { item in
                    HStack {
                        VStack (alignment: .leading){
                            Text(item.title)
                                .font(.custom("PlusJakartaSans-Bold", size: 18))
                            Text(item.title)
                                .font(.custom("PlusJakartaSans-Regular", size: 10))
                        }
                        .padding(.vertical, 5)
//                        .padding()
                        
                        Spacer()
                        
                        if item.isPinned {
                            Button(action: {
                                viewModel.togglePin(for: item)
                            }) {
                                Image(systemName: "pin.fill")
                                    .foregroundColor(Color(red: 0.97, green: 0.7, blue: 0.1))
                            }
                            .animation(.default)
                        }
                    }
                    .swipeActions(edge: .trailing) {
                        // Delete action
                        Button(action: {
                            guard let index = viewModel.items.firstIndex(where: { $0.id == item.id }) else {
                                return
                            }
                            viewModel.items.remove(at: index)
                        }) {
                            Label("Delete", systemImage: "trash")
                        }
                        .tint(.red)
                    }
                    .swipeActions(edge: .leading) {
                        // Pin action
                        Button(action: {
                            viewModel.togglePin(for: item)
                        }) {
                            Label("Pin", systemImage: "pin")
                        }
                        .tint(.yellow)
                    }
                    .contextMenu {
                        // Context menu actions (rename, delete, pin)
                        Button(action: {
                            print("Renaming \(item.title)...")
                        }) {
                            Label("Rename", systemImage: "square.and.pencil")
                        }
                        
                        Button(action: {
                            viewModel.togglePin(for: item)
                        }) {
                            Label(item.isPinned ? "Unpin" : "Pin", systemImage: "pin")
                        }
                        
                        Button(action: {
                            guard let index = viewModel.items.firstIndex(where: { $0.id == item.id }) else {
                                return
                            }
                            viewModel.items.remove(at: index)
                        }) {
                            Label("Delete", systemImage: "trash")
                        }
                        
                    }
                }
                .onDelete(perform: viewModel.deleteItem)
//                .padding(.vertical, 2)
            }
            .frame(width: 358)
            .padding(.vertical, 30)
            .listStyle(.plain)
            .offset(x: -10)
            .navigationTitle("Uncomplete Task")
        }
    }
}

//struct UncompleteTaskView: View {
//    @State private var items = ["Item 1", "Item 2", "Item 3"]
//    var body: some View {
//        NavigationView{
//            VStack {
//
//
////                VStack {
////                    Text("Memorize Alphabet")
////                        .font(.custom("PlusJakartaSans-Bold", size: 18))
////                        .frame(maxWidth: .infinity, alignment: .leading)
////
////                    Text("10/05/23")
////                        .font(.custom("PlusJakartaSans-Regular", size: 10))
////                        .frame(maxWidth: .infinity, alignment: .leading)
////                }
////                .padding()
////                .overlay(
////                    VStack {
////                        Rectangle()
////                            .fill(Color(red: 0.07, green: 0.34, blue: 0.35))
////                            .frame(width: 358, height: 0.5) // Adjust the line width here
////                            .offset(x: 0, y: 25)
////                    }
////                )
////
//
//
//
//            }
//            .navigationBarTitle("Uncompleted Task")
//        }
//
//    }}

struct UncompleteTaskView_Previews: PreviewProvider {
    static var previews: some View {
        UncompleteTaskView()
    }
}
