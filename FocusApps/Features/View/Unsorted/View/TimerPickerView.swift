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
            ZStack {
                Circle()
                    .stroke(Color.blue, lineWidth: 1.5)
                    .frame(width: 250, height: 250)
                
                HStack{
                    Picker("Hours", selection: $timerManager.hours) {
                        ForEach(0..<24) { hour in
                            Text("\(hour)h")
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: 60)
                    
                    Picker("Minutes", selection: $timerManager.minutes) {
                        ForEach(0..<24) { minute in
                            Text("\(minute)m")
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: 60)
                    
//                    Picker("Seconds", selection: $timerManager.seconds) {
//                        ForEach(0..<24) { hour in
//                            Text("\(hour)h")
//                        }
//                    }
//                    .pickerStyle(WheelPickerStyle())
//                    .frame(width: 60)
                }
            }
    }
}

//struct TimerPickerView_Previews: PreviewProvider {
//    static var previews: some View {
//        TimerPickerView()
//    }
//}
