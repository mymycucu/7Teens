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
                DisclosureGroup(content: {
                    VStack {
                        Text("A cycle refers to a set of consecutive pomodoros and breaks. It is a series of work intervals and rest periods that form a complete unit of time management.")
                    }
                }, label: {
                    Text("What is Pomodoro?")
                        .foregroundColor(Color(red: 0.07, green: 0.34, blue: 0.35))
                        .bold()
                })
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                 Divider()
                
                DisclosureGroup(content: {
                    VStack {
                        Text("A cycle refers to a set of consecutive pomodoros and breaks. It is a series of work intervals and rest periods that form a complete unit of time management.")
                    }
                }, label: {
                    Text("What is Cycle?")
                        .foregroundColor(Color(red: 0.07, green: 0.34, blue: 0.35))
                        .bold()
                })
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                 Divider()
                
                DisclosureGroup(content: {
                    VStack {
                        Text("A cycle refers to a set of consecutive pomodoros and breaks. It is a series of work intervals and rest periods that form a complete unit of time management.")
                    }
                }, label: {
                    Text("How can i get streak?")
                        .foregroundColor(Color(red: 0.07, green: 0.34, blue: 0.35))
                        .bold()
                })
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                 Divider()
                
                DisclosureGroup(content: {
                    VStack {
                        Text("A cycle refers to a set of consecutive pomodoros and breaks. It is a series of work intervals and rest periods that form a complete unit of time management.")
                    }
                }, label: {
                    Text("How can i extend my focus time?")
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
