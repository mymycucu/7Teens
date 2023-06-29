//import SwiftUI
//
//
//struct AccordionView: View {
//
//    @State var isAccordionExpanded: Bool = false
//    @State var isAccordionExpanded2: Bool = false
//
//    var body: some View {
//        VStack {
////            Toggle("Expand Accordion", isOn: $isAccordionExpanded.animation()) // THIS FIX the Disclosure Animation
////                .padding(.horizontal)
//
//            DisclosureGroup("The Title Of Accordion", isExpanded: $isAccordionExpanded) {
//                VStack {
//                    Image(systemName: "star")
//                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam sed mauris sit amet ex finibus suscipit. Nullam dapibus pulvinar eros, eget fringilla enim finibus ac. Nunc tempor sem in vehicula placerat. Nam vitae fermentum nisl. Proin dictum ligula vel interdum hendrerit. ")
//                        .onTapGesture { isAccordionExpanded.toggle() }
//                }
//            }.padding()
//
//            DisclosureGroup("The Title Of Accordion", isExpanded: $isAccordionExpanded2) {
//                VStack {
//                    Image(systemName: "star")
//                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam sed mauris sit amet ex finibus suscipit. Nullam dapibus pulvinar eros, eget fringilla enim finibus ac. Nunc tempor sem in vehicula placerat. Nam vitae fermentum nisl. Proin dictum ligula vel interdum hendrerit. ")
//                        .onTapGesture { isAccordionExpanded2.toggle() }
//                }
//            }.padding()
//
//        }
//    }
//}
//
//struct CircleTest_Previews: PreviewProvider {
//    static var previews: some View {
//        AccordionView()
//    }
//}

import SwiftUI

struct ListItem: Identifiable {
    let id = UUID()
    let title: String
    var isPinned: Bool
}

class ListViewModel: ObservableObject {
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

struct ListView: View {
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
            }
            .padding(.vertical, 30)
            .listStyle(.plain)
            .offset(x: -10)
            .navigationTitle("Uncomplete Task")
        }
    }
}


struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}








