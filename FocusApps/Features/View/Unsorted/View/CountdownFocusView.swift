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
    @State var isFull = false
    
    var body: some View {
        ZStack{
            // Background
            LottieView(name: "bg-forest", loopMode: .loop )
                .ignoresSafeArea(.all)
                .mask {
                    Circle()
                        .frame(width: isFull ? 2000 : 300, height: isFull ? 2000 : 300)
                        .ignoresSafeArea(.all)
                        .animation(.interpolatingSpring(stiffness: 200, damping: 20).speed(1))
                }
            
            if isFull {
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
                    //               Text(viewModel.formattedTime(totalSecond: viewModel.totalSeconds))
                    Text("24:50")
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
            
            //Character
            LottieView(name: "cat-hat-blue", loopMode: .loop)
                .frame(width: 132, height: 132)
                .offset(y: isFull ? 90 : 300)
                .animation(.interpolatingSpring(stiffness: 200, damping: 20).speed(0.4))
                .mask {
                    Circle()
                        .frame(width: isFull ? 2000 : 0, height: isFull ? 2000 : 0)
                        .ignoresSafeArea(.all)
                        .animation(.interpolatingSpring(stiffness: 200, damping: 20).speed(1))
                }
            
            VStack {
                Button("start") {
                    isFull.toggle()
                }
            }
 
        }
    }
}

struct CountdownFocusView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownFocusView( viewModel: TimerViewModel())
    }
}

struct CycleBarView: View {
    @StateObject var viewModel: TimerViewModel
    var body: some View {
        HStack {
            ForEach(1...(viewModel.cycle+1), id: \.self) { index in
                
                ZStack {
                    Circle()
                        .frame(width: 20, height: 20)
                        .foregroundColor(index > viewModel.focusStep ? .gray : Color(red: 0.25, green: 0.6, blue: 0.58))
                    
                    Text("\(index)")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(.white)
                }
                .padding(.horizontal, -2)
                
                if index != (viewModel.cycle+1) {
                    ZStack {
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundColor(index > viewModel.restStep ? .gray : Color(red: 0.25, green: 0.6, blue: 0.58))
                    }
                    .padding(.horizontal, -2)
                }
            }
        }
    }
}

struct ExtractedView_Previews: PreviewProvider {
    static var previews: some View {
        CycleBarView(viewModel: TimerViewModel())
    }
}
