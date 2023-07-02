//
//  CustomAlert.swift
//  FocusApps
//
//  Created by Ario Syahputra on 25/06/23.
//

import SwiftUI

struct CustomAlertView: View {
    var body: some View {
        VStack(spacing:18) {
            // MARK: Title
            Text("Rest time's up!")
                .font(.system(size: 24, weight: .bold))
            
            // MARK: Desc
            Text("Are you there? Get ready to refocus and dive back into your tasks.")
                .font(.system(size: 14, weight: .medium))
                .multilineTextAlignment(.center)
                .frame(width: 264)
            
            // MARK: Warning
            Text("Automatically end task in 20 secs")
                .font(.system(size: 12))
                .foregroundColor(.red)
            
            HStack {
                // MARK: End Focus Button
                Button(action: {
                    // Handle "End Focus" button action here
                }) {
                    Text("End Focus")
                        .foregroundColor(Color(red: 0.97, green: 0.7, blue: 0.1))
                        .frame(width: 138, height: 32)
                        .background(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color(red: 0.97, green: 0.7, blue: 0.1), lineWidth: 2)
                        )
                        .cornerRadius(22)
                }
                // MARK: Continue Focus Button
                Button(action: {
                    // Handle "Continue Focus" button action here
                }) {
                    Text("Continue Focus")
                        .foregroundColor(.white)
                        .frame(width: 138, height: 32)
                        .background(Color(red: 0.97, green: 0.7, blue: 0.1))
                        .cornerRadius(22)
                }
            }
            
        }
        .padding()
        .background(Color("GreyL-6"))
        .cornerRadius(12)
    }
}

struct CustomAlertView_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlertView()
    }
}

