//
//  SummaryView.swift
//  FocusApps
//
//  Created by Ario Syahputra on 20/06/23.
//

import SwiftUI

struct SummaryView: View {
    @State private var selectedSegment = 0
    var body: some View {
        NavigationView {
            VStack {
                Picker(selection: $selectedSegment, label: Text("Select a segment")) {
                    Text("Focus History").tag(0)
                    Text("Achievements").tag(1)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                if selectedSegment == 0 {
                    Text("Focus History View")
                        .font(.title)
                        .padding()
                } else {
                    Text("Achievements View")
                        .font(.title)
                        .padding()
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
