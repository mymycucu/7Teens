//
//  Task.swift
//  FocusApps
//
//  Created by Ario Syahputra on 28/06/23.
//

import SwiftUI

struct Task: View {
    
    @Binding var selectedTimeSegment: Int
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 13) {
            
            // Monthly
            if selectedTimeSegment == 2 {
                
                Text("June")
                    .font(.custom("PlusJakartaSans-Bold", size: 18))
            }
            
            ScrollView{
                ForEach(0..<3) { _ in
                    VStack(alignment: .leading, spacing: 5) {
                        // Task Name
                        HStack {
                            Text("Beta test")
                                .font(.custom("PlusJakartaSans-SemiBold", size: 14))
                            
                            Spacer()
                                .frame(width: 155)
                            
                            Text("Uncompleted")
                                .font(.custom("PlusJakartaSans-Medium", size: 12))
                                .foregroundColor(Color(red: 1, green: 0.23, blue: 0.19))
                        }
                        
                        // Focus Duration
                        HStack {
                            Text("Focus duration: 35 mins")
                                .font(.custom("PlusJakartaSans-Medium", size: 12))
                                .foregroundColor(Color(red: 0.39, green: 0.39, blue: 0.4))
                        }
                        
                        // Focus Starts
                        HStack {
                            Text("07.00 PM")
                                .font(.custom("PlusJakartaSans-Medium", size: 12))
                                .foregroundColor(Color(red: 0.39, green: 0.39, blue: 0.4))
                        }
                    }
                    .padding(.horizontal, 13)
                    .padding(.vertical, 10)
                    .background(Color(red: 0.9, green: 0.9, blue: 0.92))
                    .cornerRadius(8)
                }

            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(Color(red: 0.95, green: 0.95, blue: 0.97))
        .cornerRadius(12)
    }
}

struct Task_Previews: PreviewProvider {
    static var previews: some View {
        Task(selectedTimeSegment: .constant(2))
    }
}
