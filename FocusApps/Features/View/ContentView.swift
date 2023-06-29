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
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
        activityName = ""
    }
    var body: some View {
        NavigationView{
            TabView(selection: $selectedTab) {
                
                // Focus Page
                FocusView()
                    .environmentObject(appState)
                    .tabItem {
                        Label("Focus", systemImage: "target")
                    }
                
                UncompleteTaskView()
                    .environmentObject(appState)
                    .tabItem {
                        Image(systemName: "note.text")
                        Text("Uncomplete")
                    }
                
                // Uncompleted Task
                SummaryView()
                    .environmentObject(appState)
                    .tabItem {
                        Image(systemName: "note.text")
                        Text("Insight")
                    }
                    .tag(0)
                
                // Shop
                ShopView()
                    .environmentObject(appState)
                    .tabItem {
                        Label("Shop", systemImage: "clock")
                    }
            }
            .background(.white)
            .accentColor(Color("PG-400"))
        }
        .preferredColorScheme(.light)

    }
}

// struct ContentView_Previews: PreviewProvider {
//     static var previews: some View {
//         ContentView(activityName: "")
//             .environmentObject(AppState())
//     }
// }
