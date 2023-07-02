//
//  Statistics.swift
//  FocusApps
//
//  Created by Ario Syahputra on 28/06/23.
//

import SwiftUI

struct Statistics: View {
    @StateObject var viewModel: InsightViewModel
    var todayData: InsightModel = InsightModel(totalFocusTime: 0, totalTask: 0, totalCoin: 0, sessionList: [])
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 15) {
            Picker(selection: $viewModel.selectedTimeSegment, label: Text("Select a segment")) {
                Text("Daily").tag(0)
//                Text("Weekly").tag(1)
//                Text("Monthly").tag(2)
                Text("All").tag(3)
            }
            .pickerStyle(SegmentedPickerStyle())
            .frame(width: 326)

            VStack {
                HStack{
                    Text("Total focus time")
                        .font(.custom("PlusJakartaSans-SemiBold", size: 14))
                        .foregroundColor(.white)
                    Spacer()
                    Text("\(viewModel.data.totalFocusTime / 60) min")
                        .font(.custom("PlusJakartaSans-SemiBold", size: 14))
                        .foregroundColor(.white)
                }
                                
                HStack{
                    Text("Total task")
                        .font(.custom("PlusJakartaSans-SemiBold", size: 14))
                        .foregroundColor(.white)
                        .padding(.vertical, 3)
                    Spacer()
                    Text("\(viewModel.data.totalTask) tasks")
                        .font(.custom("PlusJakartaSans-SemiBold", size: 14))
                        .foregroundColor(.white)
                }
                HStack{
                    Text("Point achieved")
                        .font(.custom("PlusJakartaSans-SemiBold", size: 14))
                        .foregroundColor(.white)
                    Spacer()
                    Image("coin")
                        .resizable()
                        .frame(width: 18, height: 18)
                    Text("+\(viewModel.data.totalCoin)")
                        .font(.custom("PlusJakartaSans-SemiBold", size: 14))
                        .foregroundColor(.white)
                }
            }
            .padding(.horizontal, 13)
            .padding(.vertical, 16)
            .frame(width: 326)
            .background(Color(red: 0.25, green: 0.6, blue: 0.58))
            .cornerRadius(9)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 14)
        .background(Color(red: 0.95, green: 0.95, blue: 0.97))
        .cornerRadius(12)
    }
}

//struct Statistics_Previews: PreviewProvider {
//    static var previews: some View {
//        Statistics(selectedTimeSegment: .constant(1))
//    }
//}
