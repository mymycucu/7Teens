//
//  CountdownFocusEndView.swift
//  FocusApps
//
//  Created by Ario Syahputra on 30/06/23.
//

import SwiftUI

struct CountdownFocusEndView: View {
    @State var background = "CountdownFocusBG"
    @StateObject var viewModel: TimerViewModel
    var body: some View {
        ZStack{
            Image(background)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea(.all)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Spacer()
                    .frame(height: 30)
                
                Text("You are on cycle")
                    .font(.custom("PlusJakartaSans-SemiBold", size: 11))
                
                HStack {
                    ForEach(1...4, id: \.self) { index in
                        ZStack {
                            Circle()
                                .frame(width: 20, height: 20)
                                .foregroundColor(index > 3 ? .gray : Color(red: 0.25, green: 0.6, blue: 0.58))
                            
                            Text("\(index)")
                                .font(.system(size: 12, weight: .semibold))
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal, -2)
                        
                        if index != 4 {
                            ZStack {
                                Circle()
                                    .frame(width: 10, height: 10)
                                    .foregroundColor(index > 3 ? .gray : Color(red: 0.25, green: 0.6, blue: 0.58))
                            }
                            .padding(.horizontal, -2)
                        }
                    }
                }
                
                Text("Let’s focus on")
                    .font(.custom("PlusJakartaSans-Medium", size: 16))
                    .foregroundColor(.gray)
                    .padding(.top, 50)
                Text("Thesis")
                    .font(.custom("PlusJakartaSans-Bold", size: 26))
                    .foregroundColor(.gray)
                    .padding(.top,-7)
                
                    
                
//                Spacer()
//
                Text(viewModel.formattedTime(totalSecond: viewModel.totalSeconds))
                    .font(.custom("PlusJakartaSans-Bold", size: 48))
                    .padding(.top, 5)
                
                
                Image("kucingTerbang")
                    .resizable()
                    .frame(width: 132, height: 132)
                    .padding(.vertical, 70)
//                
                Spacer()
                    .frame(height: 20)
            
                
                //Add Another Cycle Button
                Button(action: {

                }) {
                    Text("Add Another Cycle")
                        .font(.custom("PlusJakartaSans-SemiBold", size: 16))
                        .foregroundColor(.white)
                        .frame(width: 358, height: 50)
                        .background(Color(red: 0.97, green: 0.7, blue: 0.1))
                        .cornerRadius(40)
                }
                .padding(.bottom, 10)
                
                Button(action: {
                    // Handle "End Focus" button action here
                }) {
                    Text("End Focus")
                        .foregroundColor(Color(red: 0.97, green: 0.7, blue: 0.1))
                        .frame(width: 358, height: 50)
                        .background(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color(red: 0.97, green: 0.7, blue: 0.1), lineWidth: 4)
                        )
                        .cornerRadius(40)
                }
                
                
                
                
                
//                Button(action: {
//                    // Handle "End Focus" button action here
//                }) {
//                    Text("End Focus")
//                        .foregroundColor(Color(red: 0.97, green: 0.7, blue: 0.1))
//                        .frame(width: 138, height: 32)
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 40)
//                                .stroke(Color(red: 0.97, green: 0.7, blue: 0.1), lineWidth: 2)
//                        )
//                        .cornerRadius(22)
//                }
                
            }
            
        }
    }
}

struct CountdownFocusEndView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownFocusEndView( viewModel: TimerViewModel())
    }
}
