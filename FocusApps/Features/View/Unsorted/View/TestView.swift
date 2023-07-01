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
    
    var body: some View {
        ZStack {
            LottieView(name: "bg-beach", loopMode: .loop )
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
                                 
//                    Text(viewModel.formattedTime(totalSecond: viewModel.totalSeconds))
                    Text("24:50")
                        .font(.custom("PlusJakartaSans-Bold", size: 48))
                        .padding(.bottom, 400)


                }
            }

            
            LottieView(name: "cat-hat-blue", loopMode: .loop)
                .frame(width: 200, height: 200)
                .offset(y: isFull ? 130 : 300)
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
