//
//  UncompleteView.swift
//  FocusApps
//
//  Created by Hilmy Noerfatih on 25/06/23.
//

import SwiftUI

struct UncompleteView: View {
    @EnvironmentObject var appState: AppState
    @ObservedObject var viewModel: UncompleteViewModel
    @State var taskName: String = ""
    
    init() {
        viewModel = UncompleteViewModel()
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Write your activity", text: $taskName)
                    .overlay(
                        VStack {
                            Divider()
                                .background(Color(red: 0.07, green: 0.34, blue: 0.35))
                                .offset(x: 0, y: 25)
                                .frame(width: 200)
                                // Adjust the color here
                        }
                    )
                    .font(.system(size: 22))
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 50)
                
                List{
                    ForEach(viewModel.taskMOList){ task in
                        NavigationLink {
                            SessionView(taskMO: task)
                                .navigationTitle("\(task.name!) Session")
                        } label: {
                            Text("\(task.name!) \n\(getDate(date:task.createdAt!))")
                        }
                    }
                }.listStyle(PlainListStyle())
            }
            .navigationTitle("Uncomplete Task")
        }.onAppear(perform: viewModel.refreshData)
    }
}

struct UncompleteView_Previews: PreviewProvider {
    static var previews: some View {
        UncompleteView()
    }
}

extension UncompleteView{
    func getDate(date: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let dateString = dateFormatter.string(from: date)
        
        return dateString
    }
}
