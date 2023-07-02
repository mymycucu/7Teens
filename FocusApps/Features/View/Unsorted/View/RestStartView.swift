//
//  RestStartView.swift
//  FocusApps
//
//  Created by Ario Syahputra on 25/06/23.
//

import SwiftUI

struct RestStartView: View {
    @EnvironmentObject var appState: AppState
    @StateObject var viewModel: TimerViewModel
    
    var body: some View {
        
        ZStack{
            VStack {
                
                //Cycle
                Text("You are on rest")
                    .font(.custom("PlusJakartaSans-SemiBold", size: 11))
                    .padding(.top, 40)
                
                CycleBarView(viewModel: viewModel)
                    .padding(.bottom, 30)

                Text("Take a rest before continue on")
                    .font(.custom("PlusJakartaSans-Medium", size: 16))
                    .foregroundColor(.gray)

                //Task Name
                Text("\(viewModel.taskName)")
                    .font(.custom("PlusJakartaSans-Bold", size: 26))
                    .foregroundColor(.gray)
                    .padding(.top,-7)
                    .padding(.bottom, 40)
                      
                // Timer Countdown
                Text(viewModel.isRestConfirmationPopup ? "00:00" : viewModel.formattedTime(totalSecond: viewModel.totalSeconds))
                    .font(.custom("PlusJakartaSans-Bold", size: 48))
                
                Text("Stretch your body and relax")
                .font(.custom("PlusJakartaSans-SemiBold", size: 16))
                .padding(.top, 5)
                .padding(.bottom, 250)
                
                //Character
                switch ("\(appState.body)-\(appState.hat)"){
                case "cat-hat-blue":
                    LottieView(name: "cat-hat-blue-rest", loopMode: .loop)
                        .frame(width: 132, height: 132)
                        .offset(y: -70)
                case "cat-hat-brown":
                    LottieView(name: "cat-hat-brown-rest", loopMode: .loop)
                        .frame(width: 132, height: 132)
                        .offset(y: -70)
                case "cat-hat-lilac":
                    LottieView(name: "cat-hat-lilac-rest", loopMode: .loop)
                        .frame(width: 132, height: 132)
                        .offset(y: -70)
                case "cat-hat-navy":
                    LottieView(name: "cat-hat-navy-rest", loopMode: .loop)
                        .frame(width: 132, height: 132)
                        .offset(y: -70)
                case "cat-hat-sage":
                    LottieView(name: "cat-hat-sage-rest", loopMode: .loop)
                        .frame(width: 132, height: 132)
                        .offset(y: -70)
                default:
                    LottieView(name: "cat-hat-red-rest", loopMode: .loop)
                        .frame(width: 132, height: 132)
                        .offset(y: -70)
                }
            }
            
             // MARK: Pop Up Alert
            if viewModel.isRestConfirmationPopup {
                RestConfirmationModule(viewModel: viewModel)
                
             }
            
        }
    }
}

struct RestStartView_Previews: PreviewProvider {
    static var previews: some View {
        RestStartView(viewModel: TimerViewModel())
            .environmentObject(AppState())
    }
}
