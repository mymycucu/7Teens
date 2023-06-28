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
                    Text("+50")
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
                        Text("25 Minutes")
                            .font(.custom("PlusJakartaSans-Bold", size: 16))
                            .foregroundColor(Color(red: 0.05, green: 0.27, blue: 0.29))
                            .padding(.bottom, 10)
                        
                        Spacer()
                        
                        Text("+30")
                            .font(.custom("PlusJakartaSans-Bold", size: 16))
                            .foregroundColor(Color(red: 0.05, green: 0.27, blue: 0.29))
                        
                    }
                    
                    Text("Streak")
                        .font(.custom("PlusJakartaSans-Medium", size: 14))
                        .foregroundColor(.gray)
                        .padding(.bottom, 2)
                    HStack{
                        Text("Day 3")
                            .font(.custom("PlusJakartaSans-Bold", size: 16))
                            .foregroundColor(Color(red: 0.05, green: 0.27, blue: 0.29))
                        
                        Spacer()
                        
                        Text("+20")
                            .font(.custom("PlusJakartaSans-Bold", size: 16))
                            .foregroundColor(Color(red: 0.05, green: 0.27, blue: 0.29))
                        
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
                        
                        Button(action: {}) {
                            Text("No, Uncompleted")
                                .font(.custom("PlusJakartaSans-SemiBold", size: 16))
                                .foregroundColor(Color(red: 0.97, green: 0.7, blue: 0.1))
                        }
                        
                        Spacer()
                        
                        
                        Button(action: {}) {
                            Text("Yes, Completed")
                                .font(.custom("PlusJakartaSans-SemiBold", size: 16))
                                .foregroundColor(Color(red: 0.97, green: 0.7, blue: 0.1))
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
                    Text("OK")
                        .font(.custom("PlusJakartaSans-SemiBold", size: 16))
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
