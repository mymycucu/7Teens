//
//  CountdownFocusEndView.swift
//  FocusApps
//
//  Created by Ario Syahputra on 30/06/23.
//

import SwiftUI

struct CountdownFocusEndView: View {
    @EnvironmentObject var appState: AppState
    @StateObject var viewModel: TimerViewModel
    
    var body: some View {
        ZStack{
            
            VStack {
                Text("You are on cycle")
                    .font(.custom("PlusJakartaSans-SemiBold", size: 11))
                    .padding(.top, 40)
                
                CycleBarView(viewModel: viewModel)
                    .padding(.bottom, 30)
                
                Text("Let’s focus on")
                    .font(.custom("PlusJakartaSans-Medium", size: 16))
                    .foregroundColor(.gray)
                
                Text("\(viewModel.taskName)")
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

                }) {
                    Text("Add Another Cycle")
                        .font(.custom("PlusJakartaSans-SemiBold", size: 16))
                        .foregroundColor(.white)
                        .frame(width: 358, height: 50)
                        .background(Color(red: 0.97, green: 0.7, blue: 0.1))
                        .cornerRadius(40)
                }
                .padding(.bottom, 10)
                
                Button(action: {
                    // Handle "End Focus" button action here
                }) {
                    Text("End Focus")
                        .foregroundColor(Color(red: 0.97, green: 0.7, blue: 0.1))
                        .frame(width: 358, height: 50)
                        .background(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color(red: 0.97, green: 0.7, blue: 0.1), lineWidth: 4)
                        )
                        .cornerRadius(40)
                }
                .padding(.bottom, 30)
            }
        }
    }
}

struct CountdownFocusEndView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownFocusEndView(viewModel: TimerViewModel())
            .environmentObject(AppState())
    }
}
