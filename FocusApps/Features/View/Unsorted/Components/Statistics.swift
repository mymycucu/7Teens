//
//  Statistics.swift
//  FocusApps
//
//  Created by Ario Syahputra on 28/06/23.
//

import SwiftUI

struct Statistics: View {
    
    @Binding var selectedTimeSegment: Int
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 15) {
            Picker(selection: $selectedTimeSegment, label: Text("Select a segment")) {
                Text("Daily").tag(0)
                Text("Weekly").tag(1)
                Text("Monthly").tag(2)
            }
            .pickerStyle(SegmentedPickerStyle())
            .frame(width: 326)

            VStack {
                HStack{
                    Text("Total focus time")
                        .font(.custom("PlusJakartaSans-SemiBold", size: 14))
                        .foregroundColor(.white)
                    Spacer()
                    Text("136 hrs")
                        .font(.custom("PlusJakartaSans-SemiBold", size: 14))
                        .foregroundColor(.white)
                }
                
                if selectedTimeSegment == 1 || selectedTimeSegment == 2 {
                    HStack{
                        Text("Average focus time")
                            .font(.custom("PlusJakartaSans-SemiBold", size: 14))
                            .foregroundColor(.white)
                            .padding(.vertical, 3)
                        Spacer()
                        Text("13 hours")
                            .font(.custom("PlusJakartaSans-SemiBold", size: 14))
                            .foregroundColor(.white)
                    }
                    
                    HStack{
                        Text("Highest streak")
                            .font(.custom("PlusJakartaSans-SemiBold", size: 14))
                            .foregroundColor(.white)
                            .padding(.vertical, 3)
                        Spacer()
                        Text("7 days")
                            .font(.custom("PlusJakartaSans-SemiBold", size: 14))
                            .foregroundColor(.white)
                    }
                }
                
                HStack{
                    Text("Total task")
                        .font(.custom("PlusJakartaSans-SemiBold", size: 14))
                        .foregroundColor(.white)
                        .padding(.vertical, 3)
                    Spacer()
                    Text("7 tasks")
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
                    Text("+700")
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

struct Statistics_Previews: PreviewProvider {
    static var previews: some View {
        Statistics(selectedTimeSegment: .constant(1))
    }
}
