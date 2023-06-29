//
//  CustomAlert.swift
//  FocusApps
//
//  Created by Ario Syahputra on 25/06/23.
//

import SwiftUI

struct CustomAlertView: View {
    var body: some View {
        VStack {
            Text("Rest time's up!")
                .font(.system(size: 24, weight: .bold))
                .padding()
            Text("Are you there? Get ready to refocus and dive back into your tasks.")
                .font(.system(size: 14, weight: .medium))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 50)
            Text("Automatically end task in 20 secs")
                .font(.system(size: 12))
                .foregroundColor(.red)
                .padding()

            HStack {
                Button(action: {
                    // Handle "End Focus" button action here
                }) {
                    Text("End Focus")
                        .foregroundColor(Color(red: 0.97, green: 0.7, blue: 0.1))
                        .frame(width: 138, height: 32)
                        .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color(red: 0.97, green: 0.7, blue: 0.1), lineWidth: 2)
                        )
                        .cornerRadius(22)
                }

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
            .padding(.horizontal, 20)
            .padding(.bottom, 5)
        }
        .padding()
        .background(Color("GreyL-6"))
        .cornerRadius(12)
    }
}

struct CustomAlert_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlertView()
    }
}

