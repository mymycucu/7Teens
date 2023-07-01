//
//  FocusSettingView.swift
//  FocusApps
//
//  Created by Hilmy Noerfatih on 30/06/23.
//

import SwiftUI

struct FocusSettingView: View {
    @EnvironmentObject var appState: AppState
    @StateObject var viewModel: TimerViewModel
    
    var body: some View {
//        VStack{
//            HStack{
//                //FAQ
//                Button(action: {
//                    viewModel.isFaqModalVisible = true
//                }) {
//                    HStack {
//                        Image(systemName: "questionmark.circle.fill")
//                            .font(.system(size: 20))
//                            .foregroundColor(Color(red: 0.7, green: 0.45, blue: 0.05))
//                    }
//                }
//                .frame(width: 44, height: 44)
//                .background(.yellow)
//                .cornerRadius(8)
//                .sheet(isPresented: $viewModel.isFaqModalVisible) {
//                    FaqAccordion()
//                        .padding(.top, 20)
////                        .presentationDetents([.medium, .large])
//                        .presentationDetents([.height(400)])
//                        .presentationDragIndicator(.visible)
//                    }
//
//                Spacer()
//
//                //Streak
//                HStack {
//                    Image(systemName: "flame.fill")
//                        .foregroundColor(Color(red: 0.97, green: 0.7, blue: 0.1))
//
//                    Text("\(appState.streak)")
//                        .font(.custom("PlusJakartaSans-Bold", size: 20))
//                        .foregroundColor(Color(red: 0.7, green: 0.45, blue: 0.05))
//
//
//                }
//                .frame(width: 40, height: 20)
//                .padding(8)
//                .cornerRadius(6)
//
//                Spacer()
//
//                //Music
//                Button(action: {
//                    viewModel.isMusicModalVisible = true
//                }) {
//                    HStack {
//                        Image(systemName: "music.note")
//                            .font(.system(size: 20))
//                            .foregroundColor(Color(red: 0.7, green: 0.45, blue: 0.05))
//                    }
//                }
//                .frame(width: 44, height: 44)
//                .background(.yellow)
//                .cornerRadius(8)
//                .sheet(isPresented: $viewModel.isMusicModalVisible) {
//                        MusicSelection(viewModel: viewModel)
//                        .environmentObject(appState)
//                        .presentationDetents([.height(380)])
//                        .presentationDragIndicator(.visible)
//                    }
//            }
//            .padding()
//
//
//            TextField("Write your activity", text: $viewModel.taskName)
//                .overlay(
//                    VStack {
//                        Rectangle()
//                            .fill(Color(red: 0.07, green: 0.34, blue: 0.35))
//                            .frame(width: 200, height: 2) // Adjust the line width here
//                            .offset(x: 0, y: 25)
//                    }
//                )
//                .font(.custom("PlusJakartaSans-Regular", size: 22))
//                .multilineTextAlignment(.center)
//                .padding(.top, 40)
//
//
//            //Timer
////            if !viewModel.timerIsRunning {
//                TimePickerView(viewModel: viewModel)
//                .padding(.vertical, 140)
//                //Cycle
//                HStack {
//                    Text("Cycle: ")
//                        .font(.custom("PlusJakartaSans-Medium", size: 16))
//                    Picker("One", selection: $viewModel.cycle) {
//                        ForEach(0..<4) { index in
//                            Text(Constant.cycleOptions[index])
//                        }
//                    }
//                    .pickerStyle(.menu)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 8)
//                            .stroke(Color.black, lineWidth: 0.5)
//                    )
//
//                }
//                .padding(.vertical, 20)
//
//                //Start Button
//                Button(action: {
//                    viewModel.startSession(song: appState.song)
//                }) {
//                    Text("Start")
//                        .font(.custom("PlusJakartaSans-SemiBold", size: 16))
//                        .foregroundColor(.white)
//                        .frame(width: 119, height: 50)
//                        .background(Color(red: 0.97, green: 0.7, blue: 0.1))
//                        .cornerRadius(40)
//                }
//                .padding()
//
//            Spacer()
//        }
//    }
                VStack{
                    HStack{
                        //FAQ
                        Button(action: {
                            viewModel.isFaqModalVisible = true
                        }) {
                            HStack {
                                Image(systemName: "questionmark.circle.fill")
                                    .font(.system(size: 20))
                                    .foregroundColor(Color(red: 0.7, green: 0.45, blue: 0.05))
                            }
                        }
                        .frame(width: 44, height: 44)
                        .background(.yellow)
                        .cornerRadius(8)
                        .sheet(isPresented: $viewModel.isFaqModalVisible) {
                            FaqAccordion()
                                .padding(.top, 20)
        //                        .presentationDetents([.medium, .large])
                                .presentationDetents([.height(400)])
                                .presentationDragIndicator(.visible)
                            }
                        
                        Spacer()
                        
                        //Streak
                        HStack {
                            Image(systemName: "flame.fill")
                                .foregroundColor(Color(red: 0.97, green: 0.7, blue: 0.1))
                            
                            Text("\(appState.streak)")
                                .font(.custom("PlusJakartaSans-Bold", size: 20))
                                .foregroundColor(Color(red: 0.7, green: 0.45, blue: 0.05))

                            
                        }
                        .frame(width: 40, height: 20)
                        .padding(8)
                        .cornerRadius(6)
                        
                        Spacer()
                        
                        //Music
                        Button(action: {
                            viewModel.isMusicModalVisible = true
                        }) {
                            HStack {
                                Image(systemName: "music.note")
                                    .font(.system(size: 20))
                                    .foregroundColor(Color(red: 0.7, green: 0.45, blue: 0.05))
                            }
                        }
                        .frame(width: 44, height: 44)
                        .background(.yellow)
                        .cornerRadius(8)
                        .sheet(isPresented: $viewModel.isMusicModalVisible) {
                            MusicSelection(viewModel: viewModel)
                                .environmentObject(appState)
                                .presentationDetents([.height(380)])
                                .presentationDragIndicator(.visible)
                            }
                    }
                    .padding()

                    
                    TextField("Write your activity", text: $viewModel.taskName)
                        .overlay(
                            VStack {
                                Rectangle()
                                    .fill(Color(red: 0.07, green: 0.34, blue: 0.35))
                                    .frame(width: 200, height: 2) // Adjust the line width here
                                    .offset(x: 0, y: 25)
                            }
                        )
                        .font(.custom("PlusJakartaSans-Regular", size: 22))
                        .multilineTextAlignment(.center)
                        .padding(.top, 20)

                    
                    //Timer
        //            if !viewModel.timerIsRunning {
                        TimePickerView(viewModel: viewModel)
                        .padding(.top, 140)
                        .padding(.bottom, 120)
                        //Cycle
                        HStack {
                            Text("Cycle: ")
                                .font(.custom("PlusJakartaSans-Medium", size: 16))
                            Picker("One", selection: $viewModel.cycle) {
                                ForEach(0..<4) { index in
                                    Text(Constant.cycleOptions[index])
                                }
                            }
                            .pickerStyle(.menu)
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.black, lineWidth: 0.5)
                            )
                            
                        }
                        .padding(.bottom, 20)
                       
                        //Start Button
                        Button(action: {
                            viewModel.startSession(song: appState.song)
                        }) {
                            Text("Start")
                                .font(.custom("PlusJakartaSans-SemiBold", size: 16))
                                .foregroundColor(.white)
                                .frame(width: 119, height: 50)
                                .background(Color(red: 0.97, green: 0.7, blue: 0.1))
                                .cornerRadius(40)
                        }
                        .padding()
                    
                    Spacer()
                }
            }
}

struct FocusSettingView_Previews: PreviewProvider {
    static var previews: some View {
        FocusSettingView(viewModel: TimerViewModel())
            .environmentObject(AppState())
    }
}
