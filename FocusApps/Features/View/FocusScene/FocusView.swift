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
    @State var lottieName = "bg-forest"
    
    var body: some View {
        ZStack{
            
            switch appState.background {
            case "bg-beach":
                LottieView(name: "bg-beach", loopMode: .autoReverse)
                    .ignoresSafeArea(.all)
                    .mask {
                        Circle()
                            .frame(
                                width: viewModel.isTimer ? 2000 : 240,
                                height: viewModel.isTimer ? 2000 : 240)
                            .ignoresSafeArea(.all)
                            .animation(.interpolatingSpring(stiffness: 200, damping: 80).speed(0.2), value: viewModel.isTimer)
                        Spacer().frame(height: 80)
                    }
            case "bg-rain":
                LottieView(name: "bg-rain", loopMode: .autoReverse)
                    .ignoresSafeArea(.all)
                    .mask {
                        Circle()
                            .frame(
                                width: viewModel.isTimer ? 2000 : 240,
                                height: viewModel.isTimer ? 2000 : 240)
                            .ignoresSafeArea(.all)
                            .animation(.interpolatingSpring(stiffness: 200, damping: 80).speed(0.2), value: viewModel.isTimer)
                        Spacer().frame(height: 80)
                    }
            default:
                LottieView(name: "bg-forest", loopMode: .autoReverse)
                    .ignoresSafeArea(.all)
                    .mask {
                        Circle()
                            .frame(
                                width: viewModel.isTimer ? 2000 : 240,
                                height: viewModel.isTimer ? 2000 : 240)
                            .ignoresSafeArea(.all)
                            .animation(.interpolatingSpring(stiffness: 200, damping: 80).speed(0.2), value: viewModel.isTimer)
                        Spacer().frame(height: 80)
                    }
            }
            
            if viewModel.sceneState != 2{
                switch ("\(appState.body)-\(appState.hat)"){
                case "cat-hat-blue":
                    LottieView(name: "cat-hat-blue", loopMode: .loop)
                        .frame(width: 132, height: 132)
                        .offset(y: viewModel.isTimer ? 90 : 300)
                        .animation(.interpolatingSpring(stiffness: 200, damping: 20).speed(0.4),value: viewModel.isTimer)
                        .mask {
                            Circle()
                                .frame(width: viewModel.isTimer ? 2000 : 0, height: viewModel.isTimer ? 2000 : 0)
                                .ignoresSafeArea(.all)
                                .animation(.interpolatingSpring(stiffness: 200, damping: 20).speed(1), value: viewModel.isTimer)
                        }
                case "cat-hat-brown":
                    LottieView(name: "cat-hat-brown", loopMode: .loop)
                        .frame(width: 132, height: 132)
                        .offset(y: viewModel.isTimer ? 90 : 300)
                        .animation(.interpolatingSpring(stiffness: 200, damping: 20).speed(0.4),value: viewModel.isTimer)
                        .mask {
                            Circle()
                                .frame(width: viewModel.isTimer ? 2000 : 0, height: viewModel.isTimer ? 2000 : 0)
                                .ignoresSafeArea(.all)
                                .animation(.interpolatingSpring(stiffness: 200, damping: 20).speed(1), value: viewModel.isTimer)
                        }
                case "cat-hat-lilac":
                    LottieView(name: "cat-hat-lilac", loopMode: .loop)
                        .frame(width: 132, height: 132)
                        .offset(y: viewModel.isTimer ? 90 : 300)
                        .animation(.interpolatingSpring(stiffness: 200, damping: 20).speed(0.4),value: viewModel.isTimer)
                        .mask {
                            Circle()
                                .frame(width: viewModel.isTimer ? 2000 : 0, height: viewModel.isTimer ? 2000 : 0)
                                .ignoresSafeArea(.all)
                                .animation(.interpolatingSpring(stiffness: 200, damping: 20).speed(1), value: viewModel.isTimer)
                        }
                case "cat-hat-navy":
                    LottieView(name: "cat-hat-navy", loopMode: .loop)
                        .frame(width: 132, height: 132)
                        .offset(y: viewModel.isTimer ? 90 : 300)
                        .animation(.interpolatingSpring(stiffness: 200, damping: 20).speed(0.4),value: viewModel.isTimer)
                        .mask {
                            Circle()
                                .frame(width: viewModel.isTimer ? 2000 : 0, height: viewModel.isTimer ? 2000 : 0)
                                .ignoresSafeArea(.all)
                                .animation(.interpolatingSpring(stiffness: 200, damping: 20).speed(1), value: viewModel.isTimer)
                        }
                case "cat-hat-sage":
                    LottieView(name: "cat-hat-sage", loopMode: .loop)
                        .frame(width: 132, height: 132)
                        .offset(y: viewModel.isTimer ? 90 : 300)
                        .animation(.interpolatingSpring(stiffness: 200, damping: 20).speed(0.4),value: viewModel.isTimer)
                        .mask {
                            Circle()
                                .frame(width: viewModel.isTimer ? 2000 : 0, height: viewModel.isTimer ? 2000 : 0)
                                .ignoresSafeArea(.all)
                                .animation(.interpolatingSpring(stiffness: 200, damping: 20).speed(1), value: viewModel.isTimer)
                        }
                   
                default:
                    LottieView(name: "cat-hat-red", loopMode: .loop)
                        .frame(width: 132, height: 132)
                        .offset(y: viewModel.isTimer ? 90 : 300)
                        .animation(.interpolatingSpring(stiffness: 200, damping: 20).speed(0.4),value: viewModel.isTimer)
                        .mask {
                            Circle()
                                .frame(width: viewModel.isTimer ? 2000 : 0, height: viewModel.isTimer ? 2000 : 0)
                                .ignoresSafeArea(.all)
                                .animation(.interpolatingSpring(stiffness: 200, damping: 20).speed(1), value: viewModel.isTimer)
                        }
                }
            }
            
            
            switch viewModel.sceneState{
            case 1:
                CountdownFocusView(viewModel: viewModel)
                    .toolbar(.hidden, for: .tabBar)
            case 2:
                RestStartView(viewModel: viewModel)
                    .toolbar(.hidden, for: .tabBar)
            case 3:
                StreakView(viewModel: viewModel)
                    .environmentObject(appState)
                    .toolbar(.hidden, for: .tabBar)
            case 4:
                RewardView(viewModel: viewModel)
                    .environmentObject(appState)
                    .toolbar(.hidden, for: .tabBar)
                    .onAppear(perform: appState.refreshData)
            default:
                FocusSettingView(viewModel: viewModel)
                    .environmentObject(appState)
                    .onAppear(perform: appState.refreshData)
                    .onChange(of: appState.task) { newTask in
                        if newTask != nil{
                            viewModel.task = newTask
                            viewModel.taskName = newTask!.name!
                            viewModel.isNewTask = false
                        } else {
                            viewModel.task = nil
                            viewModel.taskName = ""
                            viewModel.isNewTask = true
                        }
                        
                    }

                
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

struct FocusView_Previews: PreviewProvider {
    static var previews: some View {
        FocusView(viewModel: TimerViewModel())
            .environmentObject(AppState())
    }
}
