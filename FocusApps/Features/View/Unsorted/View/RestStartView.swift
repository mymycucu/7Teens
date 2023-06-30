//
//  RestStartView.swift
//  FocusApps
//
//  Created by Ario Syahputra on 25/06/23.
//

import SwiftUI

struct RestStartView: View {
    @StateObject var viewModel: TimerViewModel
    @State var background = "CountdownFocusBG"
//    @ObservedObject var timerManager: TimerManager
    
    var body: some View {
        ZStack{
//            Image(background)
//                .resizable()
//                .scaledToFill()
//                .ignoresSafeArea(.all)
//                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Spacer()
                    .frame(height: 100)
                
                Text("You are on cycle")
                    .font(.custom("PlusJakartaSans-SemiBold", size: 11))
                
                CycleBarView(viewModel: viewModel)
                
               
                Text("Take a rest before continue on")
                    .font(.custom("PlusJakartaSans-Medium", size: 16))
                    .foregroundColor(.gray)
                    .padding(.top, 50)
                Text("\(viewModel.taskName)")
                    .font(.custom("PlusJakartaSans-Bold", size: 26))
                    .foregroundColor(.gray)
                    .padding(.top,-7)
                
//                Text("Take a rest before continue on")
//                    .font(.system(size: 16, weight: .medium))
//                    .padding(.top, 50)
//                Text("Finishing Thesis")
//                    .font(.system(size: 26, weight: .bold))
//                    .padding(.vertical, 25)
                    

                
                Text(viewModel.formattedTime(totalSecond: viewModel.totalSeconds))
                    .font(.custom("PlusJakartaSans-Bold", size: 48))
                    .padding(.top, 50)
//                    .padding(.bottom, 150)
                 
                Text("Stretch your body and relax")
                    .font(.custom("PlusJakartaSans-SemiBold", size: 16))
                    .padding(.vertical, 10)
                
                
                Spacer()
            
    
                
            }
        }
    }
}

//struct RestStartView_Previews: PreviewProvider {
//    static var previews: some View {
//        RestStartView()
//    }
//}
