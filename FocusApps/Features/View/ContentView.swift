//
//  ContentView.swift
//  FocusApps
//
//  Created by Hilmy Noerfatih on 17/06/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var timerManager = TimerManager()
    @State var activityName: String
    @State var selectedTab = 1
    
    var body: some View {
        
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

        }
//        NavigationView{
//
//            // Apply tab bar appearance
//
//        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
