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
    
    var body: some View {
        VStack {
            TextField("Write your activity", text: $activityName)
                .multilineTextAlignment(.center)
                .padding()
            
            Text(timerManager.formattedTime())
                .font(.largeTitle)
                .padding()
            
            if !timerManager.timerIsRunning {
                TimePickerView(timerManager: timerManager)
                
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
                
                Button(action: {
                    // Handle button action here if needed
                    // For example, perform some tasks before navigating
                }) {
                    NavigationLink(destination: TaskView()) {
                        Text("You have last task uncompleted\n **Lorem Ipsum**")
                            .foregroundColor(.black)
                            .frame(width: 320, height: 50)
                            .multilineTextAlignment(.leading)
                            .padding(5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.black, lineWidth: 0.2)
                            )
                    }
                }
                .padding()
            } else {
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
