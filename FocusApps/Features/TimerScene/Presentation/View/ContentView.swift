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
        NavigationView{
            TabView(selection: $selectedTab) {
                Text("Second Tab")
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(activityName: "")
    }
}
