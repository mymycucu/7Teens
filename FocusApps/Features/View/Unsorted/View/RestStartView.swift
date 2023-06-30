//
//  RestStartView.swift
//  FocusApps
//
//  Created by Ario Syahputra on 25/06/23.
//

import SwiftUI

struct RestStartView: View {
    @State var background = "CountdownFocusBG"
    //    @ObservedObject var timerManager: TimerManager
    
    @EnvironmentObject var appState: AppState
    @StateObject var viewModel = TimerViewModel()
    @State var isShowingPopUp = false
    
    var body: some View {
        ZStack{
            // MARK: Background
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
                
                
                Text("Take a rest before continue on")
                    .font(.custom("PlusJakartaSans-Medium", size: 16))
                    .foregroundColor(.gray)
                    .padding(.top, 50)
                Text("Thesis")
                    .font(.custom("PlusJakartaSans-Bold", size: 26))
                    .foregroundColor(.gray)
                    .padding(.top,-7)
                
                //                Text("Take a rest before continue on")
                //                    .font(.system(size: 16, weight: .medium))
                //                    .padding(.top, 50)
                //                Text("Finishing Thesis")
                //                    .font(.system(size: 26, weight: .bold))
                //                    .padding(.vertical, 25)
                
                
                
                Text("05:00")
                    .font(.custom("PlusJakartaSans-Bold", size: 48))
                    .padding(.top, 50)
                //                    .padding(.bottom, 150)
                
                Text("Stretch your body and relax")
                    .font(.custom("PlusJakartaSans-SemiBold", size: 16))
                    .padding(.vertical, 10)
                
                
                Spacer()
                
                
                
            }
            
            // MARK: Pop Up Alert
            if isShowingPopUp {
                CustomAlertView()
                
            }
            
        }
    }
}

struct RestStartView_Previews: PreviewProvider {
    static var previews: some View {
        RestStartView()
    }
}
