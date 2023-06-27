//
//  StreakView.swift
//  FocusApps
//
//  Created by Ario Syahputra on 26/06/23.
//

import SwiftUI

struct StreakView: View {
    var body: some View {
        ZStack {
            Image("CountdownFocusBG")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea(.all)
                .edgesIgnoringSafeArea(.all)

            Color.white.opacity(0.4)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("fire_streak")
                    .resizable()
                    .frame(width: 240, height: 240)
                
                Text("day 3 streak!")
                    .font(.system(size: 30, weight: .bold))
                    .offset(y: -40)
                
                StreakStamp()
                
                Button(action: {}) {
                    Text("Continue")
                        .foregroundColor(.white)
                        .frame(width: 358, height: 50)
                        .background(Color(red: 0.97, green: 0.7, blue: 0.1))
                        .cornerRadius(40)
                }
                .padding(.top, 100)
            }
        }

    }
}

struct StreakView_Previews: PreviewProvider {
    static var previews: some View {
        StreakView()
    }
}
