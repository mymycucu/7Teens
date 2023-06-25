//
//  MusicSelection.swift
//  FocusApps
//
//  Created by Ario Syahputra on 21/06/23.
//

import SwiftUI

struct MusicSelection: View {
    var body: some View {
        VStack (alignment: .leading){
            
            Text("Choose your music")
                .multilineTextAlignment(.leading)
                .font(.system(size: 22, weight: .bold))
                .padding(.vertical, 10)
            
            Button(action: {
    //            isModalVisible = true
            }) {
                HStack{
                    Text("Forest Wind")
                        .foregroundColor(.black)
                    Spacer()
                    Image(systemName: "speaker.wave.2")
                        .foregroundColor(.black)
                }
                .frame(width: 320, height: 20)
                .padding()
                .background(Color(.systemGray5))
                .cornerRadius(8)
            }
            .padding(.vertical, 7)
            
            Button(action: {
    //            isModalVisible = true
            }) {
                HStack{
                    Text("Forest Wind")
                        .foregroundColor(.black)
                    Spacer()
                    Image(systemName: "speaker.wave.2")
                        .foregroundColor(.black)
                }
                .frame(width: 320, height: 20)
                .padding()
                .background(Color(.systemGray5))
                .cornerRadius(8)
            }
            .padding(.vertical, 7)
            
            Button(action: {
    //            isModalVisible = true
            }) {
                HStack{
                    Text("Forest Wind")
                        .foregroundColor(.black)
                    Spacer()
                    Image(systemName: "speaker.wave.2")
                        .foregroundColor(.black)
                }
                .frame(width: 320, height: 20)
                .padding()
                .background(Color(.systemGray5))
                .cornerRadius(8)
            }
            .padding(.vertical, 7)
            
            //Start Button
            Button(action: {

            }) {
                Text("Choose")
                    .foregroundColor(.white)
                    .frame(width: 350, height: 52)
                    .background(Color(red: 0.97, green: 0.7, blue: 0.1))
                    .cornerRadius(40)
            }
            .padding(.vertical, 20)
        }
        .padding(.top,40)
        
    }
}

struct MusicSelection_Previews: PreviewProvider {
    static var previews: some View {
        MusicSelection()
    }
}
