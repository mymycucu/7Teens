//
//  MusicSelection.swift
//  FocusApps
//
//  Created by Ario Syahputra on 21/06/23.
//

import SwiftUI


//struct MusicSelection: View {
//    @State private var isSelected1 = false
//    @State private var isSelected2 = false
//    @State private var isSelected3 = false
//
//    var body: some View {
//        VStack (alignment: .leading){
//
//            Text("Choose your music")
//                .multilineTextAlignment(.leading)
//                .font(.system(size: 22, weight: .bold))
//                .padding(.vertical, 10)
//
//            Button(action: {
//    //            isModalVisible = true
//            }) {
//                HStack{
//                    Text("Forest Wind")
//                        .foregroundColor(.black)
//                    Spacer()
//                    Image(systemName: "speaker.wave.2")
//                        .foregroundColor(.black)
//                }
//                .frame(width: 320, height: 20)
//                .padding()
//                .background(Color(.systemGray5))
//                .cornerRadius(8)
//            }
//            .padding(.vertical, 7)
//
//            Button(action: {
//    //            isModalVisible = true
//            }) {
//                HStack{
//                    Text("Forest Wind")
//                        .foregroundColor(.black)
//                    Spacer()
//                    Image(systemName: "speaker.wave.2")
//                        .foregroundColor(.black)
//                }
//                .frame(width: 320, height: 20)
//                .padding()
//                .background(Color(.systemGray5))
//                .cornerRadius(8)
//            }
//            .padding(.vertical, 7)
//
//            Button(action: {
//    //            isModalVisible = true
//            }) {
//                HStack{
//                    Text("Forest Wind")
//                        .foregroundColor(.black)
//                    Spacer()
//                    Image(systemName: "speaker.wave.2")
//                        .foregroundColor(.black)
//                }
//                .frame(width: 320, height: 20)
//                .padding()
//                .background(Color(.systemGray5))
//                .cornerRadius(8)
//            }
//            .padding(.vertical, 7)
//
//            //Start Button
//            Button(action: {
//
//            }) {
//                Text("Choose")
//                    .foregroundColor(.white)
//                    .frame(width: 350, height: 52)
//                    .background(Color(red: 0.97, green: 0.7, blue: 0.1))
//                    .cornerRadius(40)
//            }
//            .padding(.vertical, 20)
//        }
//        .padding(.top,40)
//
//    }
//}

struct MusicSelection: View {
    @State private var selectedOption: String? = nil
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Choose your music")
                .multilineTextAlignment(.leading)
                .font(.system(size: 22, weight: .bold))
                .padding(.vertical, 10)
            
            ToggleButton(title: "Forest Wind", option: "Forest Wind", selectedOption: $selectedOption)
            ToggleButton(title: "Ocean Waves", option: "Ocean Waves", selectedOption: $selectedOption)
            ToggleButton(title: "Rain Drop", option: "Rain Sounds", selectedOption: $selectedOption)
            
            // Start Button
            Button(action: {
                // Perform action when Start button is pressed
            }) {
                Text("Choose")
                    .foregroundColor(.white)
                    .frame(width: 350, height: 52)
                    .background(Color(red: 0.97, green: 0.7, blue: 0.1))
                    .cornerRadius(40)
            }
            .padding(.vertical, 20)
        }
        .padding(.top, 40)
    }
}

struct ToggleButton: View {
    let title: String
    let option: String
    @Binding var selectedOption: String?
    
    var body: some View {
        Button(action: {
            selectedOption = option
        }) {
            HStack {
                Text(title)
                    .foregroundColor( option == selectedOption ? .white : .black)
                Spacer()
                Image(systemName: "speaker.wave.2")
                    .foregroundColor( option == selectedOption ? .white : .black)
            }
            .frame(width: 320, height: 20)
            .padding()
            .background(option == selectedOption ? Color(red: 0.07, green: 0.34, blue: 0.35) : Color(.systemGray5))
            .cornerRadius(8)
        }
        .padding(.vertical, 7)
    }
}

struct MusicSelection_Previews: PreviewProvider {
    static var previews: some View {
        MusicSelection()
    }
}
