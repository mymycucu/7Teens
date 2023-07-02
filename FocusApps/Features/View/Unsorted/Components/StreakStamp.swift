//
//  StreakStamp.swift
//  FocusApps
//
//  Created by Ario Syahputra on 26/06/23.
//

import SwiftUI

struct StreakStamp: View {
    @StateObject var viewModel: TimerViewModel
    var body: some View {
        VStack{
            HStack{
                ForEach(0..<6) { index in
                    VStack {
                        Image(index >= viewModel.streak ? "fire_disable" : "fire_enable")
                            .resizable()
                            .frame(width: 50, height: 50)
//                            .padding(5)
                        
                        Text("Day \(index + 1)")
                            .font(.custom("PlusJakartaSans-SemiBold", size: 11))
                    }
                }
            }
            
            Divider()
            
            Text("Focus for 25 minutes tomorrow to keep your streak!")
                .multilineTextAlignment(.center)
                .font(.custom("PlusJakartaSans-SemiBold", size: 12))
                .padding(7)
        }
        .padding(.vertical, 15)
        .background(.white)
        .cornerRadius(12)
        .padding()
        
    }
}

struct StreakStamp_Previews: PreviewProvider {
    static var previews: some View {
        StreakStamp(viewModel: TimerViewModel())
    }
}
