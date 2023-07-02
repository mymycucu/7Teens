//
//  FaqAccordion.swift
//  FocusApps
//
//  Created by Ario Syahputra on 26/06/23.
//

import SwiftUI

struct FaqAccordion: View {
    var body: some View {
        VStack {
            Text("FAQ")
                .font(.system(size: 18, weight: .bold))
                .padding()
            
            ScrollView{
                // MARK: FAQ - 1
                DisclosureGroup(content: {
                    VStack {
                        HStack{
                            Text("Input the task name you want to work on. Set your desired focus time within a range of 10 minutes to an hour. Then, choose cycle up to 4 cycles.")
                                .padding(.vertical)
                            Spacer()
                        }
                    }
                }, label: {
                    Text("How to start focus with Timee?")
                        .foregroundColor(Color(red: 0.07, green: 0.34, blue: 0.35))
                        .bold()
                })
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                 Divider()
                // MARK: FAQ - 2
                DisclosureGroup(content: {
                    VStack {
                        HStack{
                            Text("A cycle is a series of focus times and rest periods. For example, If you choose 25 minutes focus time and 2 cycles, you repeat the 25 minutes of focus time twice. And there will be a 5-minute break between each focus time. ")
                                .padding(.vertical)
                            Spacer()
                        }
                    }
                }, label: {
                    Text("What is Cycle?")
                        .foregroundColor(Color(red: 0.07, green: 0.34, blue: 0.35))
                        .bold()
                })
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                 Divider()
                
                // MARK: FAQ - 3
                DisclosureGroup(content: {
                    VStack(alignment: .leading){
                        HStack{
                            Text("Timee provides focus ambience to improve your focus environment. You can customize the ambience of your focus by selecting a suitable soundtrack.")
                                .padding(.vertical)
                            Spacer()
                        }
                        
                    }
                
                }, label: {
                    Text("How Timee helps you to focus?")
                        .foregroundColor(Color(red: 0.07, green: 0.34, blue: 0.35))
                        .bold()
                })
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                 Divider()
                
            }
            
       }
        .accentColor(Color(red: 0.07, green: 0.34, blue: 0.35))
        
    }
}

struct FaqAccordion_Previews: PreviewProvider {
    static var previews: some View {
        FaqAccordion()
    }
}
