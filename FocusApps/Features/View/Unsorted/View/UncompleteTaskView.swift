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

class ListViewModel: ObservableObject {
    @Published var items: [TaskList] = [TaskList(title: "Item 1", isPinned: false), TaskList(title: "Item 2", isPinned: false), TaskList(title: "Item 1", isPinned: false), TaskList(title: "Item 1", isPinned: false)]

    var sortOption: SortOption = .latestFirst // Default sort option

    enum SortOption: String, CaseIterable, Identifiable {
        case oldestFirst = "Oldest"
        case latestFirst = "Latest"

        var id: SortOption { self }
    }

    func deleteItem(at index: IndexSet) {
        items.remove(atOffsets: index)
    }

    func togglePin(for item: TaskList) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            withAnimation {
                items[index].isPinned.toggle()
                sortItems()
            }
        }
    }

    func sortItems() {
        switch sortOption {
        case .oldestFirst:
            items.sort { (item1, item2) in
                if item1.isPinned == item2.isPinned {
                    return item1.title < item2.title
                } else {
                    return item1.isPinned && !item2.isPinned
                }
            }
        case .latestFirst:
            items.sort { (item1, item2) in
                if item1.isPinned == item2.isPinned {
                    return item1.title > item2.title
                } else {
                    return item1.isPinned && !item2.isPinned
                }
            }
        }
    }
}

struct UncompleteTaskView: View {
    @StateObject private var viewModel = ListViewModel()
    @State private var isContinueModalVisible = false

    var body: some View {
        NavigationView {
            VStack{
                
                //Sort Button
                // Sort Button
                HStack {
                    Spacer()
                    Menu {
                        ForEach(ListViewModel.SortOption.allCases) { option in
                            Button(action: {
                                viewModel.sortOption = option
                                viewModel.sortItems()
                            }) {
                                Text(option.rawValue)
                            }
                        }
                    } label: {
                        Image(systemName: "line.3.horizontal.decrease.circle")
                            .font(.system(size: 24))
                    }
                    .padding(.vertical, 5)
                }
                .padding(.horizontal, 30)

                
                List {
                    ForEach(viewModel.items) { item in
                        Button(action: {
                            // Handle button tap
                            isContinueModalVisible = true
                            print("Button tapped: \(item.title)")
                        }) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.title)
                                        .font(.custom("PlusJakartaSans-Bold", size: 18))
                                    Text(item.title)
                                        .font(.custom("PlusJakartaSans-Regular", size: 10))
                                }
                                .padding(.vertical, 5)

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
                        }
                        //Pop Up Modal
                        .sheet(isPresented: $isContinueModalVisible) {
                            Text("Continue Confirmation")
                                .padding(.top, 20)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .background(Color.white)
                        }
                        .listRowSeparatorTint(Color(red: 0.25, green: 0.6, blue: 0.58))

                        // Delete action
                        .swipeActions(edge: .trailing) {
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

                        // Pin action
                        .swipeActions(edge: .leading) {
                            Button(action: {
                                viewModel.togglePin(for: item)
                            }) {
                                Label("Pin", systemImage: "pin")
                            }
                            .tint(.yellow)
                        }

                        // Context menu actions (rename, delete, pin)
                        .contextMenu {
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

                            Button(role: .destructive, action: {
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
                }
                .frame(width: 370)
//                .padding(.vertical, 30)
                .listStyle(.plain)
                .offset(x: -10)
                .navigationBarTitle("Uncomplete Task")
            }


        }
    }
}

//struct ContinueConfirmation: View {
//    var body: some View {
//        Text("Continue Confirmation View")
//    }
//}

struct UncompleteTaskView_Previews: PreviewProvider {
    static var previews: some View {
        UncompleteTaskView()
    }
}


