//
//  TestView.swift
//  FocusApps
//
//  Created by Hilmy Noerfatih on 30/06/23.
//

import SwiftUI

struct TestView: View {
    @State var isFull = false
    
    var body: some View {
        VStack{
            Button(action: {
                var today = Calendar.current.startOfDay(for: .now)
                var now = Date()
                
                print(now >= today)
            }) {
                Text("Continue")
                    .foregroundColor(.white)
                    .frame(width: 358, height: 50)
                    .background(Color(red: 0.97, green: 0.7, blue: 0.1))
                    .cornerRadius(40)
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
        TestView()
    }
}
