//
//  StopFocusConfirmation.swift
//  FocusApps
//
//  Created by Sarah Uli Octavia on 30/06/23.
//

import SwiftUI

struct StopFocusConfirmation: View {
    var body: some View {
        VStack(spacing:18) {
            // MARK: Title
            Text("Stop Focus?")
                .font(.system(size: 24, weight: .bold))
            
            // MARK: Desc
            Text("Are you sure to stop focus timer?")
                .font(.system(size: 14, weight: .medium))
                .multilineTextAlignment(.center)
                .frame(width: 264)
            
            HStack {
                // MARK: Yes Button
                Button(action: {
                    // Handle "Yes" button action here
                }) {
                    Text("Yes")
                        .foregroundColor(Color(red: 0.97, green: 0.7, blue: 0.1))
                        .frame(width: 138, height: 32)
                        .background(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color(red: 0.97, green: 0.7, blue: 0.1), lineWidth: 2)
                        )
                        .cornerRadius(22)
                }
                // MARK: Cancel Button
                Button(action: {
                    // Handle "Cancel" button action here
                }) {
                    Text("Cancel")
                        .foregroundColor(.white)
                        .frame(width: 138, height: 32)
                        .background(Color(red: 0.97, green: 0.7, blue: 0.1))
                        .cornerRadius(22)
                }
            }
            
        }
        .padding(20)
        .background(Color(red: 0.95, green: 0.95, blue: 0.97))
        .cornerRadius(12)
    }
}

struct StopFocusConfirmation_Previews: PreviewProvider {
    static var previews: some View {
        StopFocusConfirmation()
    }
}
