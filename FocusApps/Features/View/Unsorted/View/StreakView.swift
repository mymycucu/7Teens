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
                
                StrokeText(text: "day 3 streak!", width: 2,  color: .white)
                    .foregroundColor(Color(red: 0.07, green: 0.34, blue: 0.35))
                    .font(.custom("PlusJakartaSans-Bold", size: 30))
                    .offset(y: -40)
                
//                Text("day 3 streak!")
//                    .font(.custom("PlusJakartaSans-Bold", size: 30))
//                    .offset(y: -40)
                
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

struct StrokeText: View {
    let text: String
    let width: CGFloat
    let color: Color

    var body: some View {
        ZStack{
            ZStack{
                Text(text).offset(x:  width, y:  width)
                Text(text).offset(x: -width, y: -width)
                Text(text).offset(x: -width, y:  width)
                Text(text).offset(x:  width, y: -width)
            }
            .foregroundColor(color)
            Text(text)
        }
    }
}


struct StreakView_Previews: PreviewProvider {
    static var previews: some View {
        StreakView()
    }
}
