//
//  SummaryView.swift
//  FocusApps
//
//  Created by Ario Syahputra on 20/06/23.
//

import SwiftUI


struct SummaryView: View {
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(red: 0.97, green: 0.7, blue: 0.1, alpha: 1.0)
        UISegmentedControl.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
    }

    @State private var selectedSegment = 0
    @State private var selectedTimeSegment = 0
    var body: some View {
        NavigationView {
            VStack {
                Picker(selection: $selectedSegment, label: Text("Select a segment")) {
                    Text("Focus History").tag(0)
                    Text("Achievements").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()

                // Focus History
                if selectedSegment == 0 {
                    
                    VStack {
                        // Statistic Container
                        Statistics(selectedTimeSegment: $selectedTimeSegment)
                        
                        Text("Task Data")
                            .font(.custom("PlusJakartaSans-Bold", size: 14))
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, 10)
                            .padding(.horizontal)
                        
                        // Task Data
                        if selectedTimeSegment == 2 {
                            ScrollView {
                                Task(selectedTimeSegment: $selectedTimeSegment)
                            }
                        } else {
                            Task(selectedTimeSegment: $selectedTimeSegment)
                        }
                    }

    
                // Achievement
                } else {
                    
                    BadgesGrid()
                }
                Spacer()
            }
            .navigationBarTitle("Summary")
        }


    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView()
    }
}
