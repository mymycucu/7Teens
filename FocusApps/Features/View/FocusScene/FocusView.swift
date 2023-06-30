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
        ZStack{
            LottieView(name: appState.background, loopMode: .autoReverse)
                .ignoresSafeArea(.all)
                .mask {
                        Circle()
                            .frame(
                                width: viewModel.isTimer ? 2000 : 300,
                                height: viewModel.isTimer ? 2000 : 300)
                            .ignoresSafeArea(.all)
                            .animation(
                                .interpolatingSpring(stiffness: 200, damping: 20)
                                .speed(0.2))
                }
            
            switch viewModel.sceneState{
            case 1:
                CountdownFocusView(viewModel: viewModel)
                    .toolbar(.hidden, for: .tabBar)
            case 2:
                RestStartView(viewModel: viewModel)
                    .toolbar(.hidden, for: .tabBar)
            default:
                FocusSettingView(viewModel: viewModel)
                    .environmentObject(appState)
                
            }
        }
        
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
                if (viewModel.sceneState == 1){
                    NotificationManager.requestNotificationPermission()
                }
                
            }
        }
    }
}

extension View {
  @inlinable
  public func reverseMask<Mask: View>(
    alignment: Alignment = .center,
    @ViewBuilder _ mask: () -> Mask
  ) -> some View {
    self.mask {
      Rectangle()
        .overlay(alignment: alignment) {
          mask()
            .blendMode(.destinationOut)
        }
    }
  }
}

//struct FocusView_Previews: PreviewProvider {
//    static var previews: some View {
//        FocusView(appState: AppState(), viewModel: FocusViewModel(), timerManager: TimerController())
//    }
//}
