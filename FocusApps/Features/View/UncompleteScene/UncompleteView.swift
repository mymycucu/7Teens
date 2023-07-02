//
//  UncompleteView.swift
//  FocusApps
//
//  Created by Hilmy Noerfatih on 25/06/23.
//

import SwiftUI

struct UncompleteView: View {
    @EnvironmentObject var appState: AppState
    @ObservedObject var viewModel = UncompleteViewModel()
    @State var isContinueModalVisible = false
    
    var body: some View {
        NavigationView {
            VStack {
                List{
                    ForEach(viewModel.getTaskUncompleteData()){ task in
                        Button(action: {
                            // Handle button tap
                            viewModel.taskSelected = task
                            isContinueModalVisible = true
                        }) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(task.name!)
                                        .font(.custom("PlusJakartaSans-Bold", size: 18))
                                    Text(getDate(date:task.createdAt!))
                                        .font(.custom("PlusJakartaSans-Regular", size: 10))
                                }
                                .padding(.vertical, 5)
                            }
                        }
                        //Pop Up Modal
                        .listRowSeparatorTint(Color(red: 0.25, green: 0.6, blue: 0.58))

                    }
                }.listStyle(PlainListStyle())
                    .offset(x: -10)
                    .frame(width: 370)
                //Pop Up Modal
                    .sheet(isPresented: $isContinueModalVisible) {
                        ContinueConfirmation(task: viewModel.taskSelected!)
                            .environmentObject(appState)
                        .padding(.top, 20)
                        .presentationDetents([.height(277)])
                        .presentationDragIndicator(.visible)
                    }
                
            }
            .padding(.top, 30)
            .navigationTitle("Uncomplete Task")
        }
    }
}

// MARK: Struktur object TASKMO
// var id : UUID
// var createdAt : Date
// var name : String
// var isDone : Bool
// var isPinned : Bool

// Buat ngambilnya pake function di UncompleteViewModel getTaskUncompleteData
// kalo ada yang diubah jangan lupa di save pake di UncompleteViewModel
// panggil ulang function di UncompleteViewModel getTaskUncompleteData


extension UncompleteView{
    func getDate(date: Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        let dateString = dateFormatter.string(from: date)
        
        return dateString
    }
}
