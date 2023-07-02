//
//  TestView.swift
//  FocusApps
//
//  Created by Hilmy Noerfatih on 30/06/23.
//

import SwiftUI

struct TestView: View {
    @State var isFull = false
    @StateObject var viewModel: TimerViewModel
    @State var task_test = "Finishing Thesis"
    
    var body: some View {
        
        
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
                    
                    Text("Halo")
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
              
            }
            .padding()

            
            HStack {
                Spacer()
                TextField("Write your activity", text: $task_test)
                    .overlay(
                        VStack {
                            if task_test == nil {
                                Rectangle()
                                    .fill(Color(red: 0.07, green: 0.34, blue: 0.35))
                                    .frame(width: 200, height: 2) // Adjust the line width here
                                    .offset(x: 0, y: 25)
                            }
                        }
                        
                    )
                    .disabled(task_test != nil)
                    .font(.custom("PlusJakartaSans-Regular", size: 22))
                    .multilineTextAlignment(.center)
                    .padding(.top, 20)
                
                if task_test != nil {
                    Button(action: {
                        viewModel.task = nil
                        viewModel.taskName = ""
                        viewModel.isNewTask = true
                        print("clicked")
                    }) {
//                                Text("clear task")
//                                    .font(.custom("PlusJakartaSans-SemiBold", size: 12))
//                                Spacer()
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.secondary)
                            .padding(.top, 20)
                            .padding(.leading, -100)
                            .offset(y: -20)
                    }
                }
                Spacer()
            }

            
            
            
            //Timer
//            if !viewModel.timerIsRunning {
                TimePickerView(viewModel: viewModel)
                .padding(.top, 135)
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

                }) {
                    Text("Start")
                        .font(.custom("PlusJakartaSans-SemiBold", size: 16))
                        .foregroundColor(.white)
                        .frame(width: 119, height: 50)
                        .background(viewModel.taskName.isEmpty ? Constant.colorDisabled : Constant.cororEnabled )
                        .cornerRadius(40)
                }
                .disabled(viewModel.taskName.isEmpty)
                .padding()
            
            Spacer()
        }
        
//        ZStack {
//            LottieView(name: "bg-beach", loopMode: .loop )
//                .ignoresSafeArea(.all)
//                .mask {
//                    Circle()
//                        .frame(width: isFull ? 2000 : 300, height: isFull ? 2000 : 300)
//                        .ignoresSafeArea(.all)
//                        .animation(.interpolatingSpring(stiffness: 200, damping: 20).speed(1))
//                }
//
//            if isFull {
//                VStack {
//                    Text("You are on cycle")
//                        .font(.custom("PlusJakartaSans-SemiBold", size: 11))
//
//                    CycleBarView(viewModel: viewModel)
//                        .padding(.bottom, 30)
//
//                    Text("Let’s focus on")
//                        .font(.custom("PlusJakartaSans-Medium", size: 16))
//                        .foregroundColor(.gray)
//
//                    Text("Thesis")
//                        .font(.custom("PlusJakartaSans-Bold", size: 26))
//                        .foregroundColor(.gray)
//                        .padding(.top,-7)
//                        .padding(.bottom, 40)
//
////                    Text(viewModel.formattedTime(totalSecond: viewModel.totalSeconds))
//                    Text("24:50")
//                        .font(.custom("PlusJakartaSans-Bold", size: 48))
//                        .padding(.bottom, 400)
//
//
//                }
//            }
//
//
//            LottieView(name: "cat-hat-blue", loopMode: .loop)
//                .frame(width: 200, height: 200)
//                .offset(y: isFull ? 130 : 300)
//                .animation(.interpolatingSpring(stiffness: 200, damping: 20).speed(0.4))
//                .mask {
//                    Circle()
//                        .frame(width: isFull ? 2000 : 0, height: isFull ? 2000 : 0)
//                        .ignoresSafeArea(.all)
//                        .animation(.interpolatingSpring(stiffness: 200, damping: 20).speed(1))
//                }
//
//
//            VStack {
//                Button("start") {
//                    isFull.toggle()
//                }
//            }
//        }
        
//        ZStack {
//
//            LottieView(name: "bg-beach", loopMode: .autoReverse)
//                .ignoresSafeArea(.all)
//                .mask {
//                        Circle()
//                            .frame(
//                                width: isFull ? 2000 : 300,
//                                height: isFull ? 2000 : 300)
//                            .ignoresSafeArea(.all)
//                            .animation(
//                                .interpolatingSpring(stiffness: 200, damping: 20)
//                                .speed(1))
//
//                }
//            LottieView(name: "cat-hat-blue", loopMode: .autoReverse)
//                .frame(width: 200, height: 200)
//                .offset(y: isFull ? 0 : 300)
//                .animation(.interpolatingSpring(stiffness: 200, damping: 20).speed(0.4))
//                .mask {
//                        Circle()
//                            .frame(
//                                width: isFull ? 2000 : 0,
//                                height: isFull ? 2000 : 0)
//                            .ignoresSafeArea(.all)
//                            .animation(
//                                .interpolatingSpring(stiffness: 200, damping: 20)
//                                .speed(1))
//                }
//            VStack{
//                Button("start"){
//                    withAnimation{
//
//                        isFull.toggle()
//                    }
//
//                }
//            }
//
//
//        }
//        .edgesIgnoringSafeArea(.all)
    }
}


struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView(viewModel: TimerViewModel())
    }
}
