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
    @StateObject var viewModel: TimerViewModel = TimerViewModel()

    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
        activityName = ""
    }
    
    var body: some View {
        //        TestView()
        //    }
        TabView(selection: $selectedTab) {
            
            // Focus Page
            FocusView()
                .environmentObject(appState)
                .tabItem {
                    Label("Focus", systemImage: "target")
                }
                .tag(1)
            
            UncompleteTaskView()
                .environmentObject(appState)
                .tabItem {
                    Image(systemName: "note.text")
                    Text("Uncomplete")
                }.tag(2)
            
            // Uncompleted Task
            SummaryView()
                .environmentObject(appState)
                .tabItem {
                    Image(systemName: "chart.bar.xaxis")
                    Text("Insight")
                }
                .tag(3)
            
            // Shop
            ShopView()
                .environmentObject(appState)
                .tabItem {
                    Label("Shop", systemImage: "basket.fill")
                }.tag(4)
        }
        .background(.white)
        .accentColor(Color("PG-400"))
    }
//    .preferredColorScheme(.light)
    


}
//}

// struct ContentView_Previews: PreviewProvider {
//     static var previews: some View {
//         ContentView(activityName: "")
//             .environmentObject(AppState())
//     }
// }
