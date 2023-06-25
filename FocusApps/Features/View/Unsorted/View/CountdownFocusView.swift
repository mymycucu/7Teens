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
                    .font(.system(size: 12, weight: .semibold))
                
                HStack{
                    ZStack {
                        Circle()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color(red: 0.25, green: 0.6, blue: 0.58))
                        Text("1")
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundColor(.white)
                    }
                    
                    ZStack{
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundColor(Color(red: 0.25, green: 0.6, blue: 0.58))
                    }
                    
                    ZStack {
                        Circle()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color(red: 0.25, green: 0.6, blue: 0.58))
                        Text("2")
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundColor(.white)
                    }
                    
                    ZStack{
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundColor(Color(red: 0.25, green: 0.6, blue: 0.58))
                    }
                    
                    ZStack {
                        Circle()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color(red: 0.25, green: 0.6, blue: 0.58))
                        Text("3")
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundColor(.white)
                    }
                    
                    ZStack{
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundColor(Color(red: 0.25, green: 0.6, blue: 0.58))
                    }
                    
                    ZStack {
                        Circle()
                            .frame(width: 20, height: 20)
                            .foregroundColor(Color(red: 0.25, green: 0.6, blue: 0.58))
                        Text("4")
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundColor(.white)
                    }
                    
                }
                
               
                
                Text("Let’s focus on finishing your")
                    .font(.system(size: 16, weight: .medium))
                    .padding(.top, 50)
                Text("Finishing Thesis")
                    .font(.system(size: 26, weight: .bold))
                    .padding(.top, 2)
                    
                
                Spacer()
                
                Text("24 : 50")
                    .font(.system(size: 48, weight: .bold))
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
                        .foregroundColor(.white)
                        .frame(width: 170, height: 52)
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
