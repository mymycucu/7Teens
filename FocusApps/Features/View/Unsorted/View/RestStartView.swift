//
//  RestStartView.swift
//  FocusApps
//
//  Created by Ario Syahputra on 25/06/23.
//

import SwiftUI

struct RestStartView: View {
    @StateObject var viewModel: TimerViewModel
    @State var isFull = false
//    @ObservedObject var timerManager: TimerManager
    
    var body: some View {
        
        ZStack{
            // Background
            LottieView(name: "bg-forest", loopMode: .loop )
                .ignoresSafeArea(.all)
            
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
                Text("Thesis")
                    .font(.custom("PlusJakartaSans-Bold", size: 26))
                    .foregroundColor(.gray)
                    .padding(.top,-7)
                    .padding(.bottom, 40)
                      
                // Timer Countdown
                //         Text(viewModel.formattedTime(totalSecond: viewModel.totalSeconds))
                Text("24:50")
                    .font(.custom("PlusJakartaSans-Bold", size: 48))
//                    .padding(.bottom, 360)
                
                Text("Stretch your body and relax")
                .font(.custom("PlusJakartaSans-SemiBold", size: 16))
                .padding(.top, 5)
                .padding(.bottom, 250)
                
                //Character
                LottieView(name: "cat-hat-blue-rest", loopMode: .loop)
                    .frame(width: 132, height: 132)
                    .offset(y: -70)
//                    .padding(.bottom, 30)
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
