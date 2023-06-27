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
                    .fill(.blue)
                    .frame(width: 250, height: 250)
                
                HStack {
                    Picker("Hours", selection: $viewModel.timerController.hours) {
                        ForEach(0..<23) { hour in
                            Text("\(hour)h")
                                .font(.system(size: 20)) // Adjust the font size as desired
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: 60)
                    
                    Picker("Minutes", selection: $viewModel.timerController.minutes) {
                        ForEach(0..<60) { minute in
                            Text("\(minute)m")
                                .font(.system(size: 20)) // Adjust the font size as desired
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
