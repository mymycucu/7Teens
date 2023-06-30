//
//  MusicSelection.swift
//  FocusApps
//
//  Created by Ario Syahputra on 21/06/23.
//

import SwiftUI

struct MusicSelection: View {
    @EnvironmentObject var appState: AppState
    @State private var selectedOption: String? = nil
    @State private var selectedBg: String? = nil
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Choose your music")
                .font(.custom("PlusJakartaSans-Bold", size: 22))
                .multilineTextAlignment(.leading)
                .padding(.vertical, 10)
            
            //Music Selection Choice
            ToggleButton(title: "Forest Wind", option: "forest-wind", background: "bg-forest",  selectedOption: $selectedOption, selectedBg: $selectedBg)
                .environmentObject(appState)
            ToggleButton(title: "Ocean Waves", option: "beach-wave",background: "bg-forest", selectedOption: $selectedOption, selectedBg: $selectedBg)
                .environmentObject(appState)
            ToggleButton(title: "Rain Drop", option: "raindrop", background: "bg-forest", selectedOption: $selectedOption, selectedBg: $selectedBg)
                .environmentObject(appState)
            
            //Choose Button
            Button(action: {
                // Perform action when Start button is pressed
                appState.background
            }) {
                Text("Choose")
                    .font(.custom("PlusJakartaSans-SemiBold", size: 16))
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

//Choose Music Button
struct ToggleButton: View {
    let title: String
    let option: String
    let background: String
    @Binding var selectedOption: String?
    @Binding var selectedBg: String?
    @EnvironmentObject var appState: AppState
    @StateObject var viewModel = TimerViewModel()

    
    var body: some View {
        Button(action: {
            
            viewModel.playSound(fileName: option)
        }) {
            HStack {
                Text(title)
                    .font(.custom("PlusJakartaSans-Regular", size: 18))
                    .foregroundColor( option == appState.song ? .white : .black)
                Spacer()
                Image(systemName: "speaker.wave.2")
                    .foregroundColor( option == appState.song ? .white : .black)
            }
            .frame(width: 320, height: 20)
            .padding()
            .background(option == appState.song ? Color(red: 0.07, green: 0.34, blue: 0.35) : Color(.systemGray5))
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
