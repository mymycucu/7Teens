//
//  TimerPickerView.swift
//  productivitySandbox
//
//  Created by Ario Syahputra on 20/06/23.
//

import SwiftUI

struct TimePickerView: View {
    @ObservedObject var timerManager: TimerManager
    
    var body: some View {
        HStack {
            Picker("Hours", selection: $timerManager.hours) {
                ForEach(0..<24) { hour in
                    Text("\(hour)h")
                }
            }
            .pickerStyle(WheelPickerStyle())
            .frame(width: 80)
            
            Picker("Minutes", selection: $timerManager.minutes) {
                ForEach(0..<60) { minute in
                    Text("\(minute)m")
                }
            }
            .pickerStyle(WheelPickerStyle())
            .frame(width: 80)
            
            Picker("Seconds", selection: $timerManager.seconds) {
                ForEach(0..<60) { second in
                    Text("\(second)s")
                }
            }
            .pickerStyle(WheelPickerStyle())
            .frame(width: 80)
        }
        .padding()
    }
}

//struct TimerPickerView_Previews: PreviewProvider {
//    static var previews: some View {
//        TimerPickerView()
//    }
//}
