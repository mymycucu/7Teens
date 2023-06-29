//
//  FocusView.swift
//  productivitySandbox
//
//  Created by Ario Syahputra on 20/06/23.
//

import SwiftUI

struct FocusView: View {
    @EnvironmentObject var appState: AppState
    @StateObject var viewModel = TimerViewModel()
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        VStack{
            switch viewModel.sceneState{
            case 1:
                CountdownFocusView(viewModel: viewModel)
                    .toolbar(.hidden, for: .tabBar)
            default:
                FocusSettingView(viewModel: viewModel)
                    .environmentObject(appState)
                
            }
        }
        
//        .background(
//            LottieView(name: "Beach_Test", loopMode: .autoReverse)
//                .edgesIgnoringSafeArea(.all)
//        )
        
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
            viewModel.showAlert = true
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)) { _ in
            viewModel.showAlert = false
        }
        .onChange(of: scenePhase) { newPhase in
            if newPhase == .active {
                print("Active")
            } else if newPhase == .inactive {
                print("Inactive")
            } else if newPhase == .background {
                print("Background")
                NotificationManager.requestNotificationPermission()
            }
        }
    }
}

//struct FocusView_Previews: PreviewProvider {
//    static var previews: some View {
//        FocusView(appState: AppState(), viewModel: FocusViewModel(), timerManager: TimerController())
//    }
//}
