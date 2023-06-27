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
    @State private var isMusicModalVisible = false
    @State private var isFaqModalVisible = false
    @State private var selectedOption = 0
    let options = ["One", "Two", "Three"]
    
    var body: some View {
        VStack {
            
            HStack{
                
                //FAQ
                Button(action: {
                    isFaqModalVisible = true
                }) {
                    HStack {
                        Image(systemName: "questionmark.circle.fill")
                            .font(.system(size: 20))
                            .foregroundColor(Color(red: 0.7, green: 0.45, blue: 0.05))
                    }
                }
//                .padding()
                .frame(width: 44, height: 44)
//                .padding(8)
                .background(.yellow)
                .cornerRadius(8)
                .sheet(isPresented: $isFaqModalVisible) {
                    FaqAccordion()
                        .padding(.top, 20)
//                        .presentationDetents([.medium, .large])
                        .presentationDetents([.height(400)])
                        .presentationDragIndicator(.visible)
                    }
                
                Spacer()
                
                //Streak
                HStack {
                    Image(systemName: "flame.fill")
                        .foregroundColor(Color(red: 0.97, green: 0.7, blue: 0.1))
                    
                    Text("2")
                        .font(.custom("PlusJakartaSans-Bold", size: 20))
                        .foregroundColor(Color(red: 0.7, green: 0.45, blue: 0.05))

                    
                }
                .frame(width: 40, height: 20)
                .padding(8)
                .cornerRadius(6)
                
                Spacer()
                
                //Music
                Button(action: {
                    isMusicModalVisible = true
                }) {
                    HStack {
                        Image(systemName: "music.note")
                            .font(.system(size: 20))
                            .foregroundColor(Color(red: 0.7, green: 0.45, blue: 0.05))
                    }
                }
                .frame(width: 44, height: 44)
                .background(.yellow)
                .cornerRadius(8)
                .sheet(isPresented: $isMusicModalVisible) {
                        MusicSelection()
                        .presentationDetents([.height(380)])
                        .presentationDragIndicator(.visible)
                    }
            }
            .padding()

            
            TextField("Write your activity", text: $activityName)
                .overlay(
                    VStack {
                        Rectangle()
                            .fill(Color(red: 0.07, green: 0.34, blue: 0.35))
                            .frame(width: 200, height: 2) // Adjust the line width here
                            .offset(x: 0, y: 25)
                    }
                )
                .font(.custom("PlusJakartaSans-Regular", size: 22))
                .multilineTextAlignment(.center)
                .padding(.vertical, 50)

            
            
            
            //Timer
            if !timerManager.timerIsRunning {
                TimePickerView(timerManager: timerManager)
                
                //Cycle
                HStack {
                    Text("Cycle: ")
                        .font(.custom("PlusJakartaSans-Medium", size: 16))
                    Picker("One", selection: $selectedOption) {
                        ForEach(0..<options.count) { index in
                            Text(options[index])
                        }
                    }
                    .pickerStyle(.menu)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.black, lineWidth: 0.5)
                    )
                    
                }
                .padding(.vertical, 20)

               
                //Start Button
                Button(action: {
                    timerManager.startTimer()
                    // Play sound when start button clicked
                    SoundController.instance.playSound(fileName: "ambient")
                }) {
                    Text("Start")
                        .font(.custom("PlusJakartaSans-SemiBold", size: 16))
                        .foregroundColor(.white)
                        .frame(width: 119, height: 50)
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
