//
//  ContentView.swift
//  FocusApps
//
//  Created by Hilmy Noerfatih on 17/06/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appState: AppState
    @StateObject private var timerManager = TimerManager()
    @State var activityName: String
    @State var selectedTab = 1
    
    var body: some View {
        NavigationView{
            TabView(selection: $selectedTab) {
                
                // Focus Page
                FocusView(activityName: $activityName, timerManager: timerManager)
                    .tabItem {
                        Label("Focus", systemImage: "target")

                    }
                
                
                TaskMOsView()
                    .environmentObject(AppState())
                    .tabItem {
                        Image(systemName: "note.text")
                        Text("Incomplete")
                    }
                    .tag(0)
                
                // Uncompleted Task
                ShopView()
                    .tabItem {
                        Label("Shop", systemImage: "clock")
                    }
            }
            .accentColor(Color(red: 0.25, green: 0.6, blue: 0.58))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(activityName: "")
    }
}
