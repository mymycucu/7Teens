//
//  FocusView.swift
//  productivitySandbox
//
//  Created by Ario Syahputra on 20/06/23.
//

import SwiftUI

struct FocusView: View {
    @EnvironmentObject var appState: AppState
    @StateObject var viewModel = FocusViewModel()
    @State var taskName = ""
    @State var timerIsActive = false
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
                        .foregroundColor(Color(red: 0.7, green: 0.45, blue: 0.05))
                        .font(.system(size: 20, weight: .bold))
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

            
            TextField("Write your activity", text: $taskName)
                .overlay(
                    VStack {
                        Rectangle()
                            .fill(Color(red: 0.07, green: 0.34, blue: 0.35))
                            .frame(width: 200, height: 2) // Adjust the line width here
                            .offset(x: 0, y: 25)
                    }
                )
                .font(.system(size: 22))
                .multilineTextAlignment(.center)
                .padding(.vertical, 50)

            
            
            
            //Timer
            if !viewModel.focusUI.timerIsActive {
                TimePickerView(viewModel: viewModel)
                
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
                    viewModel.startTimer()
                    timerIsActive = true
                    print("\(viewModel.timerController.minutes)")
                    // Play sound when start button clicked
//                    SoundController.instance.playSound(fileName: "ambient")
                }) {
                    Text("Start")
                        .foregroundColor(.white)
                        .frame(width: 170, height: 52)
                        .background(Color(red: 0.97, green: 0.7, blue: 0.1))
                        .cornerRadius(40)
                }
                .padding()
                
            } else {
                
                Text(viewModel.focusUI.formattedTime)
                .font(.largeTitle)
                .padding()
                
                Button(action: {
                    SoundController.instance.player?.stop()
                    viewModel.timerController.stopTimer()
                    timerIsActive = false
                }) {
                    Text("Stop")
                }
                .padding()
            }
            
            Spacer()
        }
    }
}

//struct FocusView_Previews: PreviewProvider {
//    static var previews: some View {
//        FocusView(appState: AppState(), viewModel: FocusViewModel(), timerManager: TimerController())
//    }
//}
