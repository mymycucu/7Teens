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
    @State var taskName: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                List{
                    ForEach(viewModel.getTaskUncompleteData()){ task in
                        Text("\(task.name!) \n\(getDate(date:task.createdAt!))")
                    }
                }.listStyle(PlainListStyle())
            }
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
