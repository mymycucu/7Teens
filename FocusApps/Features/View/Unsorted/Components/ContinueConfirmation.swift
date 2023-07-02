//
//  ContinueConfirmation.swift
//  FocusApps
//
//  Created by Ario Syahputra on 28/06/23.
//

import SwiftUI

struct ContinueConfirmation: View {
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        VStack{
            Text("Do you want to continue on")
                .font(.custom("PlusJakartaSans-Regular", size: 18))
                .padding(.top, 10)
            Text("Practice Algebra")
                .font(.custom("PlusJakartaSans-Bold", size: 20))
                .padding(.top, 3)
                .padding(.bottom, 30)
            
            //Yes Button
            Button(action: {

            }) {
                Text("Yes")
                    .font(.custom("PlusJakartaSans-SemiBold", size: 16))
                    .foregroundColor(.white)
                    .frame(width: 358, height: 50)
                    .background(Color(red: 0.97, green: 0.7, blue: 0.1))
                    .cornerRadius(40)
            }
            
            //Not Now
            Button(action: {
                dismiss()
            }) {
                Text("Not Now")
                    .font(.custom("PlusJakartaSans-SemiBold", size: 16))
                    .foregroundColor(Color(red: 0.97, green: 0.7, blue: 0.1))
                    .frame(width: 358, height: 50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(Color(red: 0.97, green: 0.7, blue: 0.1), lineWidth: 2)
                    )
                    .cornerRadius(40)
            }
            .padding(.top, 3)
            
        }
        
    }
}

struct ContinueConfirmation_Previews: PreviewProvider {
    static var previews: some View {
        ContinueConfirmation()
    }
}
