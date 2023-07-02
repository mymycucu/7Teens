//
//  SummaryView.swift
//  FocusApps
//
//  Created by Ario Syahputra on 20/06/23.
//

import SwiftUI


struct SummaryView: View {
    @StateObject var viewModel = InsightViewModel()
    
    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColor(red: 0.97, green: 0.7, blue: 0.1, alpha: 1.0)
        UISegmentedControl.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
    }

    var body: some View {
        NavigationView {
            VStack {
                Picker(selection: $viewModel.selectedSegment, label: Text("Select a segment")) {
                    Text("Focus History").tag(0)
                    Text("Achievements").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()

                // Focus History
                if viewModel.selectedSegment == 0 {
                    
                    VStack {
                        // Statistic Container
                        Statistics(viewModel: viewModel)
                        
                        Text("Task Data")
                            .font(.custom("PlusJakartaSans-Bold", size: 14))
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, 10)
                            .padding(.horizontal)
                        
                        // Task Data
                        ScrollView {
                            TaskListView(viewModel: viewModel)
                                .padding(.horizontal, 16)
                        }
                    }

    
                // Achievement
                } else {
                    
                    BadgesGrid()
                }
                Spacer()
            }
            .onAppear(perform: viewModel.initData)
            .onChange(of: viewModel.selectedTimeSegment){
                newValue in viewModel.refreshData(time: newValue)
            }
            .navigationBarTitle("Summary")
        }


    }
}

//struct SummaryView_Previews: PreviewProvider {
//    static var previews: some View {
//        SummaryView()
//    }
//}
