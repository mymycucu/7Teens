//
//  StreakStamp.swift
//  FocusApps
//
//  Created by Ario Syahputra on 26/06/23.
//

import SwiftUI

struct StreakStamp: View {
    var body: some View {
        
        VStack{
            HStack{
                ForEach(0..<6) { index in
                    VStack {
                        Image(index >= 2 ? "fire_disable" : "fire_enable")
                            .resizable()
                            .frame(width: 50, height: 50)
//                            .padding(5)
                        
                        Text("Day \(index + 1)")
                            .font(.system(size: 10, weight: .bold))
                    }
                }
            }
            
            Divider()
            
            Text("Focus for 25 minutes tomorrow to keep your streak!")
                .multilineTextAlignment(.center)
                .font(.system(size: 12,weight: .semibold))
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
        StreakStamp()
    }
}
