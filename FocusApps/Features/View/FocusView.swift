//
//  FocusView.swift
//  productivitySandbox
//
//  Created by Ario Syahputra on 20/06/23.
//

import SwiftUI

struct FocusView: View {
    @Binding var activityName: String
    @ObservedObject var timerManager: TimerManager
    @State private var isModalVisible = false
    @State private var selectedOption = 0
    let options = ["Option 1", "Option 2", "Option 3"]
    
    var body: some View {
        VStack {
            
            HStack{
                //Streak
                HStack {
                    Image(systemName: "flame.fill")
                        .foregroundColor(.white)
                    
                    Text("3")
                        .foregroundColor(.white)
                }
                .frame(width: 40, height: 20)
                .padding(8)
                .background(.blue)
                .cornerRadius(6)
                
                Spacer()
                
                //Music
                Button(action: {
                    isModalVisible = true
                }) {
                    HStack {
                        Image(systemName: "music.note")
                            .foregroundColor(.white)
                    }
                }
                .padding()
                .frame(width: 20, height: 20)
                .padding(8)
                .background(.blue)
                .cornerRadius(6)
                .sheet(isPresented: $isModalVisible) {
                        // Your modal content view here
                        MusicSelection()
                        .fixedSize()
                        .presentationDetents([.medium, .large])
                    }
            }
            .padding()
            
            
            TextField("Write your activity", text: $activityName)
                .multilineTextAlignment(.center)
                .padding()
            
            
            
            //Timer
            if !timerManager.timerIsRunning {
                TimePickerView(timerManager: timerManager)
                
                //Cycle
                Text("Cycle:")
                    .padding()
                Picker("Options", selection: $selectedOption) {
                    ForEach(0..<options.count) { index in
                        Text(options[index])
                    }
                }
                .pickerStyle(MenuPickerStyle()) // Apply a dropdown style
               
                //Start Button
                Button(action: {
                    timerManager.startTimer()
                    // Play sound when start button clicked
                    SoundController.instance.playSound(fileName: "ambient")
                }) {
                    Text("Start")
                        .foregroundColor(.white)
                        .frame(width: 170, height: 52)
                        .background(.primary)
                        .cornerRadius(40)
                }
                .padding()
                
            } else {
                
                Text(timerManager.formattedTime())
                .font(.largeTitle)
                .padding()
                
                Button(action: {
                    SoundController.instance.player?.stop()
                    timerManager.stopTimer()
                }) {
                    Text("Stop")
                }
                .padding()
            }
        }
    }
}

//struct FocusView_Previews: PreviewProvider {
//    static var previews: some View {
//        FocusView()
//    }
//}
