//
//  TimerPickerView.swift
//  productivitySandbox
//
//  Created by Ario Syahputra on 20/06/23.
//

import SwiftUI

struct TimePickerView: View {
    @StateObject var viewModel: FocusViewModel
    
    var body: some View {
            ZStack {
                Circle()
                    .fill(ImagePaint(image: Image("CountdownFocusBG")))
//                    .overlay(Circle().stroke(Color.blue, lineWidth: 1.5))
                    .frame(width: 250, height: 250)

                
                HStack {
                    Picker("Minutes", selection: $viewModel.timerController.hours) {
                        ForEach(0..<59) { minute in
                            Text("\(minute)")
                                .font(.system(size: 30)) // Adjust the font size as desired
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: 60)
                    
                    Picker("Seconds", selection: $viewModel.timerController.minutes) {
                        ForEach(0..<59) { second in
                            Text("\(second)")
                                .font(.system(size: 30)) // Adjust the font size as desired
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: 60)
                }

            }
    }
}

//struct TimerPickerView_Previews: PreviewProvider {
//    static var previews: some View {
//        TimerPickerView()
//    }
//}
