//
//  RewardView.swift
//  FocusApps
//
//  Created by Ario Syahputra on 26/06/23.
//

import SwiftUI

struct RewardView: View {
    var body: some View {
        ZStack {
            Image("CountdownFocusBG")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea(.all)
                .edgesIgnoringSafeArea(.all)

            Color.white.opacity(0.4)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                
                //Reward Desc
                Text("Congratulations")
                    .font(.system(size: 26, weight: .bold))
                Text("on your remarkable focus and achievement 🎉")
                
                //Coin
                HStack{
                    Image("coin")
                        .resizable()
                        .frame(width: 76, height: 76)
                    Text("+50")
                        .font(.system(size: 52, weight: .bold))
                }
                .padding(.vertical, 40)
                
                //Reward Focus Container
                VStack (alignment: .leading){
                    Text("Focus Time")
                        .font(.system(size: 12, weight: .medium))
                    HStack{
                        Text("25 Minutes")
                            .font(.system(size: 16, weight: .bold))
                        
                        Spacer()
                        
                        Text("+30")
                            .font(.system(size: 16, weight: .bold))
                        
                    }
                    
                    Text("Streak")
                        .font(.system(size: 12, weight: .medium))
                        .padding(.top, 20)
                    HStack{
                        Text("Day 3")
                            .font(.system(size: 16, weight: .bold))
                        
                        Spacer()
                        
                        Text("+20")
                            .font(.system(size: 16, weight: .bold))
                        
                    }
                }
                .padding()
                .background(.white)
                .cornerRadius(8)
                .frame(width: 358, height: 122)
                
                //Confirmation Container
                VStack{
                    Text("Has this task been completed?")
                        .padding(.top, 30)
                    HStack{
                        
                        Button(action: {}) {
                            Text("No, Uncompleted")
                                .foregroundColor(Color(red: 0.97, green: 0.7, blue: 0.1))
                                .fontWeight(.semibold)
                        }
                        
                        Spacer()
                        
                        
                        Button(action: {}) {
                            Text("Yes, Completed")
                                .foregroundColor(Color(red: 0.97, green: 0.7, blue: 0.1))
                                .fontWeight(.semibold)
                        }
                    }
                    .padding(.horizontal, 30)
                    .padding(.vertical, 20)
                    .padding(.bottom, 10)
                }
                .frame(width: 358, height: 122)
                .background(.white)
                .cornerRadius(8)
                .padding(.top, 20)
                
                Button(action: {}) {
                    Text("Continue")
                        .foregroundColor(.white)
                        .frame(width: 358, height: 50)
                        .background(Color(red: 0.97, green: 0.7, blue: 0.1))
                        .cornerRadius(40)
                }
                .padding(.top, 100)
            }
            .padding(.horizontal)
        }
        
    }
}

struct RewardView_Previews: PreviewProvider {
    static var previews: some View {
        RewardView()
    }
}
