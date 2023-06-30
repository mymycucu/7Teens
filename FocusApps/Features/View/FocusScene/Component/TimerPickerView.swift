//
//  TimerPickerView.swift
//  productivitySandbox
//
//  Created by Ario Syahputra on 20/06/23.
//

import SwiftUI

struct TimePickerView: View {
    @StateObject var viewModel: TimerViewModel
    
    var body: some View {
                HStack {
                    Picker("Minutes", selection: $viewModel.minutes) {
                        ForEach(0..<60) { minute in
                            Text("\(minute)")
                                .font(.system(size: 30)) // Adjust the font size as desired
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: 60)
                    
                    Picker("Seconds", selection: $viewModel.seconds) {
                        ForEach(0..<60) { second in
                            Text("\(second)")
                                .font(.system(size: 30)) // Adjust the font size as desired
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: 60)
                }
    }
}

//struct TimerPickerView_Previews: PreviewProvider {
//    static var previews: some View {
//        TimerPickerView()
//    }
//}
