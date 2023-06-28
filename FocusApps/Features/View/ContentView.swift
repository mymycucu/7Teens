//
//  ContentView.swift
//  FocusApps
//
//  Created by Hilmy Noerfatih on 17/06/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appState: AppState
    @State var activityName: String
    @State var selectedTab = 1
    
    var body: some View {
        
            TabView(selection: $selectedTab) {
                
                // Focus Page
                FocusView()
                    .environmentObject(appState)
                    .tabItem {
                        Label("Focus", systemImage: "target")
                    }.tag(1)
                
                UncompleteView()
                    .environmentObject(appState)
                    .tabItem {
                    Image(systemName: "note.text")
                    Text("Uncomplete")
                    }.tag(2)
                
                // Uncompleted Task
                TaskMOsView()
                    .environmentObject(appState)
                    .tabItem {
                        Image(systemName: "note.text")
                        Text("Insight")
                    }
                    .tag(3)
            
                // Shop
                ShopView()
                    .environmentObject(appState)
                    .tabItem {
                        Label("Shop", systemImage: "clock")
                    }.tag(4)
            }
            .background(.white)
            .accentColor(Color(red: 0.25, green: 0.6, blue: 0.58))
        }
    
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(activityName: "")
//            .environmentObject(AppState())
//    }
//}
