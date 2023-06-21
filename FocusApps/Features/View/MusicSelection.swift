//
//  MusicSelection.swift
//  FocusApps
//
//  Created by Ario Syahputra on 21/06/23.
//

import SwiftUI

struct MusicSelection: View {
    var body: some View {
        VStack{
            Button(action: {
    //            isModalVisible = true
            }) {
                HStack{
                    Text("Forest Wind")
                        .foregroundColor(.black)
                    Spacer()
                    Image(systemName: "speaker.wave.2")
                        .foregroundColor(.blue)
                }
                .frame(width: 320, height: 25)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.black, lineWidth: 0.2)
                )
            }
            .padding(.vertical, 10)
            
            Button(action: {
    //            isModalVisible = true
            }) {
                HStack{
                    Text("Forest Wind")
                        .foregroundColor(.black)
                    Spacer()
                    Image(systemName: "speaker.wave.2")
                        .foregroundColor(.blue)
                }
                .frame(width: 320, height: 25)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.black, lineWidth: 0.2)
                )
            }
            .padding(.vertical, 10)
            
            Button(action: {
    //            isModalVisible = true
            }) {
                HStack{
                    Text("Forest Wind")
                        .foregroundColor(.black)
                    Spacer()
                    Image(systemName: "speaker.wave.2")
                        .foregroundColor(.blue)
                }
                .frame(width: 320, height: 25)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.black, lineWidth: 0.2)
                )
            }
            .padding(.vertical, 10)
        }
        
        
        
        
    }
}

struct MusicSelection_Previews: PreviewProvider {
    static var previews: some View {
        MusicSelection()
    }
}
