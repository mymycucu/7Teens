//
//  RewardView.swift
//  FocusApps
//
//  Created by Ario Syahputra on 26/06/23.
//

import SwiftUI

struct RewardView: View {
    @EnvironmentObject var appState: AppState
    @StateObject var viewModel: TimerViewModel
    @State var isDone = 2
    
    var body: some View {
        ZStack {
//            Image("CountdownFocusBG")
//                .resizable()
//                .scaledToFill()
//                .ignoresSafeArea(.all)
//                .edgesIgnoringSafeArea(.all)

            Color.white.opacity(0.4)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                //Reward Desc
                Text("Congratulations")
                    .font(.custom("PlusJakartaSans-Bold", size: 26))
                    .foregroundColor(Color(red: 0.05, green: 0.27, blue: 0.29))

                Text("on your remarkable focus and achievement 🎉")
                    .font(.custom("PlusJakartaSans-SemiBold", size: 14))
                    .foregroundColor(Color(red: 0.05, green: 0.27, blue: 0.29))

                
                //Coin
                HStack{
                    Image("coin")
                        .resizable()
                        .frame(width: 76, height: 76)
                    Text("+\(viewModel.reward.totalCoin)")
                        .font(.custom("PlusJakartaSans-Bold", size: 52))
                        .foregroundColor(Color(red: 0.05, green: 0.27, blue: 0.29))

                }
                .padding(.vertical, 40)
                
                //Reward Focus Container
                VStack (alignment: .leading){
                    Text("Focus Time")
                        .font(.custom("PlusJakartaSans-Medium", size: 14))
                        .foregroundColor(.gray)
                        .padding(.bottom, 2)
                    HStack{
                        Text("\(viewModel.getTotalFocusSession()/60) Minutes")
                            .font(.custom("PlusJakartaSans-Bold", size: 16))
                            .foregroundColor(Color(red: 0.05, green: 0.27, blue: 0.29))
                            .padding(.bottom, 10)
                        
                        Spacer()
                        
                        Text("+\(viewModel.reward.taskCoin)")
                            .font(.custom("PlusJakartaSans-Bold", size: 16))
                            .foregroundColor(Color(red: 0.05, green: 0.27, blue: 0.29))
                        
                    }
                    if (viewModel.bonusStreak){
                        Text("Streak")
                            .font(.custom("PlusJakartaSans-Medium", size: 14))
                            .foregroundColor(.gray)
                            .padding(.bottom, 2)
                        HStack{
                            Text("Day \(viewModel.streak)")
                                .font(.custom("PlusJakartaSans-Bold", size: 16))
                                .foregroundColor(Color(red: 0.05, green: 0.27, blue: 0.29))
                            
                            Spacer()
                            
                            Text("+25")
                                .font(.custom("PlusJakartaSans-Bold", size: 16))
                                .foregroundColor(Color(red: 0.05, green: 0.27, blue: 0.29))
                            
                        }
                    }
                }
                .padding()
                .background(.white)
                .cornerRadius(8)
                .frame(width: 358, height: 122)
                
                //Confirmation Container
                VStack{
                    Text("Has this task been completed?")
                        .font(.custom("PlusJakartaSans-Medium", size: 18))
                        .foregroundColor(Color(red: 0.05, green: 0.27, blue: 0.29))
                        .padding(.top, 30)
                    HStack{
                        
                        Button(action: {
                            isDone = 0
                            viewModel.task!.isDone = false
                            viewModel.save()
                        }) {
                            Text("No, Uncompleted")
                                .font(.custom("PlusJakartaSans-SemiBold", size: 16))
                                .foregroundColor(Color(red: 0.97, green: 0.7, blue: 0.1))
                                .padding(EdgeInsets(top: 5, leading: 8, bottom: 5, trailing: 8))
                                .overlay(
                                    isDone == 0 ?
                                        RoundedRectangle(cornerRadius: 40)
                                        .stroke(Color(red: 0.97, green: 0.7, blue: 0.1), lineWidth: 2) : nil
                                )
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            isDone = 1
                            viewModel.task!.isDone = true
                            viewModel.save()
                        }) {
                            Text("Yes, Completed")
                                .font(.custom("PlusJakartaSans-SemiBold", size: 16))
                                .foregroundColor(Color(red: 0.97, green: 0.7, blue: 0.1))
                                .padding(EdgeInsets(top: 5, leading: 8, bottom: 5, trailing: 8))
                                .overlay(
                                    isDone == 1 ?
                                        RoundedRectangle(cornerRadius: 40)
                                        .stroke(Color(red: 0.97, green: 0.7, blue: 0.1), lineWidth: 2) : nil
                                )
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .padding(.bottom, 10)
                }
                .frame(width: 358, height: 122)
                .background(.white)
                .cornerRadius(8)
                .padding(.top, 20)
                
                Button(action: {
                    appState.refreshData()
                    viewModel.bonusStreak = false
                    viewModel.sceneState = 0
                    viewModel.isTimer = false
                }) {
                    Text("OK")
                        .font(.custom("PlusJakartaSans-SemiBold", size: 16))
                        .foregroundColor(.white)
                        .frame(width: 358, height: 50)
                        .background(isDone == 2 ? Color(red: 1, green: 0.92, blue: 0.64) : Color(red: 0.97, green: 0.7, blue: 0.1))
                        .cornerRadius(40)
                        
                }
                .disabled(isDone == 2)
                .padding(.top, 100)
            }
            .padding(.horizontal)
        }
        
    }
}

//struct RewardView_Previews: PreviewProvider {
//    static var previews: some View {
//        RewardView(viewModel: TimerViewModel())
//            .environmentObject(AppState())
//    }
//}
