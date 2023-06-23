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
<<<<<<< HEAD
        NavigationView{
            TabView(selection: $selectedTab) {
                TaskMOsView()
                    .environmentObject(AppState())
                    .tabItem {
                        Image(systemName: "chart.xyaxis.line")
                        Text("Insight")
                    }
                    .tag(0)
                
                //Focus Page
                FocusView(activityName: $activityName, timerManager: timerManager)
                    .tabItem {
                        Image(systemName: "clock")
                        Text("Focus")
                    }
                    .tag(1)
                
                //Uncompleted Task
                Text("Second Tab")
                    .tabItem {
                        Image(systemName: "circle")
                        Text("Tab 2")
                    }
                    .tag(2)
            }
=======
        
        TabView(selection: $selectedTab) {
            
            // Focus Page
            FocusView(activityName: $activityName, timerManager: timerManager)
                .tabItem {
                    Label("Focus", systemImage: "clock")
                }

            
            SummaryView()
                .tabItem {
                    Label("Insight", systemImage: "chart.xyaxis.line")
                }
            
            // Uncompleted Task
            ShopView()
                .tabItem {
                    Label("Shop", systemImage: "clock")
                }

>>>>>>> b2c49408374a3ea9f71aa41d8a89da0b4fa84e7b
        }
//        NavigationView{
//
//            // Apply tab bar appearance
//
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(activityName: "")
    }
}
