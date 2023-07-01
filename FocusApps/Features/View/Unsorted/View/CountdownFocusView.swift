//
//  CountdownFocusView.swift
//  FocusApps
//
//  Created by Ario Syahputra on 23/06/23.
//

import SwiftUI

struct CountdownFocusView: View {
    @EnvironmentObject var appState: AppState
    @StateObject var viewModel: TimerViewModel
    
    var body: some View {
        ZStack{
            // Background
//            LottieView(name: "bg-forest", loopMode: .loop )
//                .ignoresSafeArea(.all)
//                .mask {
//                    Circle()
//                        .frame(width: isFull ? 2000 : 300, height: isFull ? 2000 : 300)
//                        .ignoresSafeArea(.all)
//                        .animation(.interpolatingSpring(stiffness: 200, damping: 20).speed(1))
//                }
            
            
                VStack {
                    Text("You are on cycle")
                        .font(.custom("PlusJakartaSans-SemiBold", size: 11))
                        .padding(.top, 40)
                    
                    CycleBarView(viewModel: viewModel)
                        .padding(.bottom, 30)

                    Text("Let’s focus on")
                        .font(.custom("PlusJakartaSans-Medium", size: 16))
                        .foregroundColor(.gray)

                    Text("Thesis")
                        .font(.custom("PlusJakartaSans-Bold", size: 26))
                        .foregroundColor(.gray)
                        .padding(.top,-7)
                        .padding(.bottom, 40)
                          
                    // Timer Countdown
                    Text(viewModel.formattedTime(totalSecond: viewModel.totalSeconds))
                        .font(.custom("PlusJakartaSans-Bold", size: 48))
                        .padding(.bottom, 360)
                    
                    // Stop Button
                    Button(action: {
                        viewModel.stopSession()
                    }) {
                        Text("Stop")
                            .font(.custom("PlusJakartaSans-SemiBold", size: 16))
                            .foregroundColor(.white)
                            .frame(width: 358, height: 50)
                            .background(Color(red: 0.97, green: 0.7, blue: 0.1))
                            .cornerRadius(40)
                    }
                    .padding(.bottom, 30)


                }
            }
    }
}

struct CountdownFocusView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownFocusView( viewModel: TimerViewModel())
    }
}


