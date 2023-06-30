//
//  TimerPickerView.swift
//  productivitySandbox
//
//  Created by Ario Syahputra on 20/06/23.
//

//import SwiftUI
//
//struct TimePickerView: View {
//    @StateObject var viewModel: TimerViewModel
//
//    var body: some View {
//            ZStack {
//                Circle()
//                    .fill(ImagePaint(image: Image("CountdownFocusBG")))
////                    .overlay(Circle().stroke(Color.blue, lineWidth: 1.5))
//                    .frame(width: 250, height: 250)
//
//
//                HStack {
//                    Picker("Minutes", selection: $viewModel.minutes) {
//                        ForEach(0..<60) { minute in
//                            Text("\(minute)")
//                                .font(.system(size: 30)) // Adjust the font size as desired
//                        }
//                    }
//                    .pickerStyle(WheelPickerStyle())
//                    .frame(width: 60)
//
//                    Picker("Seconds", selection: $viewModel.seconds) {
//                        ForEach(0..<60) { second in
//                            Text("\(second)")
//                                .font(.system(size: 30)) // Adjust the font size as desired
//                        }
//                    }
//                    .pickerStyle(WheelPickerStyle())
//                    .frame(width: 60)
//                }
//            }
//    }
//}

import SwiftUI

struct TimePickerView: View {
    @StateObject var viewModel: TimerViewModel
    @State private var selectedMinute: Int = 0
    @State private var selectedSecond: Int = 0
    
    var body: some View {
            ZStack {
                Circle()
                    .fill(ImagePaint(image: Image("CountdownFocusBG")))
//                    .overlay(Circle().stroke(Color.blue, lineWidth: 1.5))
                    .frame(width: 250, height: 250)

                
                HStack {
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 0) {
                            ForEach(0..<60) { minute in
                                Button(action: {
                                    selectedMinute = viewModel.minutes
                                }) {
                                    Text("\(minute)")
                                        .font(.custom("PlusJakartaSans-Bold", size: 48))
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        .padding(.vertical, 8)
                    }
                    
                    Text(":")
                        .font(.custom("PlusJakartaSans-Bold", size: 48))
                    
                    ScrollView(showsIndicators: false) {
                        VStack(spacing: 0) {
                            ForEach(0..<60) { second in
                                Button(action: {
                                    selectedSecond = viewModel.seconds
                                }) {
                                    Text("\(second)")
                                        .font(.custom("PlusJakartaSans-Bold", size: 48))
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        .padding(.vertical, 8)
                    }
                }
                .frame(width: 150, height: 70)
                
//                HStack {
//                    Picker("Minutes", selection: $viewModel.minutes) {
//                        ForEach(0..<60) { minute in
//                            Text("\(minute)")
//                                .font(.custom("PlusJakartaSans-Bold", size: 30))
//                                .background(EmptyView())
//                        }
//                    }
//                    .pickerStyle(WheelPickerStyle())
//                    .frame(width: 100)
//                    .background(.clear)
//
//                    Text(":")
//                        .font(.custom("PlusJakartaSans-Bold", size: 30))
//
//                    Picker("Seconds", selection: $viewModel.seconds) {
//                        ForEach(0..<60) { second in
//                            Text("\(second)")
//                                .font(.custom("PlusJakartaSans-Bold", size: 30))
//                                .background(EmptyView())
//                        }
//                    }
//                    .pickerStyle(WheelPickerStyle())
//                    .frame(width: 100)
//                    .background(.clear)
//                }
                

            }
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
