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
    let options = ["One", "Two", "Three"]
    
    var body: some View {
        VStack {
            
            HStack{
                //Streak
                HStack {
                    Image(systemName: "flame.fill")
                        .foregroundColor(.red)
                    
                    Text("3")
                        .foregroundColor(.white)
                }
                .frame(width: 40, height: 20)
                .padding(8)
                .background(.yellow)
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
                .background(.yellow)
                .cornerRadius(6)
                .sheet(isPresented: $isModalVisible) {
                        // Your modal content view here
                        MusicSelection()
//                        .presentationDetents([.medium, .large])
                        .presentationDetents([.height(400)])
                        .presentationDragIndicator(.visible)
                    }
            }
            .padding()
            
//            Spacer()
            
            
            TextField("Write your activity", text: $activityName)
                .overlay(
                    VStack {
                        Divider()
                            .background(Color(red: 0.07, green: 0.34, blue: 0.35))
                            .offset(x: 0, y: 25)
                            .frame(width: 200)
                            // Adjust the color here
                    }
                )
                .font(.system(size: 22))
                .multilineTextAlignment(.center)
                .padding(.vertical, 50)
            
            
            
            //Timer
            if !timerManager.timerIsRunning {
                TimePickerView(timerManager: timerManager)
                
                //Cycle
                HStack {
                    Text("Cycle: ")
                    Picker("One", selection: $selectedOption) {
                        ForEach(0..<options.count) { index in
                            Text(options[index])
                            
                        }
                    }
                    .pickerStyle(.menu)
                }
                .padding(.vertical, 20)

               
                //Start Button
                Button(action: {
                    timerManager.startTimer()
                    // Play sound when start button clicked
                    SoundController.instance.playSound(fileName: "ambient")
                }) {
                    Text("Start")
                        .foregroundColor(.white)
                        .frame(width: 170, height: 52)
                        .background(Color(red: 0.97, green: 0.7, blue: 0.1))
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
            
            Spacer()
        }
    }
}

struct FocusView_Previews: PreviewProvider {
    static var previews: some View {
        FocusView(activityName: .constant(""), timerManager: TimerManager())
    }
}
