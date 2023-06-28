//
//  CountdownFocusView.swift
//  FocusApps
//
//  Created by Ario Syahputra on 23/06/23.
//

import SwiftUI

struct CountdownFocusView: View {
    @State var background = "CountdownFocusBG"
//    @ObservedObject var timerManager: TimerManager
    
    var body: some View {
        ZStack{
            Image(background)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea(.all)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Spacer()
                    .frame(height: 100)
                
                Text("You are on cycle")
                    .font(.custom("PlusJakartaSans-SemiBold", size: 11))
                
                HStack{
                    ZStack {
                        Circle()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color(red: 0.25, green: 0.6, blue: 0.58))
                        Text("1")
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal, -2)
                    
                    ZStack{
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundColor(Color(red: 0.25, green: 0.6, blue: 0.58))
                    }
                    .padding(.horizontal, -2)
                    
                    ZStack {
                        Circle()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color(red: 0.25, green: 0.6, blue: 0.58))
                        Text("2")
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal, -2)
                    
                    ZStack{
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundColor(Color(red: 0.25, green: 0.6, blue: 0.58))
                    }
                    .padding(.horizontal, -2)
                    
                    ZStack {
                        Circle()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color(red: 0.25, green: 0.6, blue: 0.58))
                        Text("3")
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal, -2)
                    
                    ZStack{
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundColor(Color(red: 0.25, green: 0.6, blue: 0.58))
                    }
                    .padding(.horizontal, -2)
                    
                    ZStack {
                        Circle()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color(red: 0.25, green: 0.6, blue: 0.58))
                        Text("4")
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal, -2)
                    
                }
                
               
                
                Text("Let’s focus on")
                    .font(.custom("PlusJakartaSans-Medium", size: 16))
                    .foregroundColor(.gray)
                    .padding(.top, 50)
                Text("Thesis")
                    .font(.custom("PlusJakartaSans-Bold", size: 26))
                    .foregroundColor(.gray)
                    .padding(.top,-7)
                    
                
                Spacer()
                
                Text("24:50")
                    .font(.custom("PlusJakartaSans-Bold", size: 48))
//                    .padding(.bottom, 150)
                
                Image("kucingTerbang")
                    .resizable()
                    .frame(width: 132, height: 132)
                    .padding(.vertical, 70)
                
                Spacer()
            
                
                //Start Button
                Button(action: {

                }) {
                    Text("Stop")
                        .font(.custom("PlusJakartaSans-SemiBold", size: 16))
                        .foregroundColor(.white)
                        .frame(width: 358, height: 50)
                        .background(Color(red: 0.97, green: 0.7, blue: 0.1))
                        .cornerRadius(40)
                }
                .padding(.bottom, 100)
                
            }
        }
    }
}

struct CountdownFocusView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownFocusView()
    }
}
