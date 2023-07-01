//
//  TimerPickerView.swift
//  productivitySandbox
//
//  Created by Ario Syahputra on 20/06/23.
//

import SwiftUI

struct TimePickerView: View {
    @StateObject var viewModel: TimerViewModel
    @State private var selectedMinute: Int = 0
    @State private var selectedSecond: Int = 0
    
    var body: some View {
        HStack {
            Picker("Minutes", selection: $viewModel.minutes) {
                ForEach(0..<60) { minute in
                    Text("\(minute)")
                        .font(.custom("PlusJakartaSans-Bold", size: 30))
                }
            }
            .pickerStyle(WheelPickerStyle())
            .frame(width: 100)
            .background(.clear)

            Text(":")
                .font(.custom("PlusJakartaSans-Bold", size: 30))

            Picker("Seconds", selection: $viewModel.seconds) {
                ForEach(0..<60) { second in
                    Text("\(second)")
                        .font(.custom("PlusJakartaSans-Bold", size: 30))
                }
            }
            .pickerStyle(WheelPickerStyle())
            .frame(width: 100)
            .background(.clear)
        }
        .frame(width: 150, height: 90)


            }
    }






//struct TimerPickerView_Previews: PreviewProvider {
//    static var previews: some View {
//        TimerPickerView()
//    }
//}


//struct TimerPickerView_Previews: PreviewProvider {
//    static var previews: some View {
//        TimerPickerView()
//    }
//}
