//
//  BadgesGrid.swift
//  FocusApps
//
//  Created by Ario Syahputra on 28/06/23.
//

import SwiftUI

struct BadgesGrid: View {
    let items = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6", "Item 7", "Item 8", "Item 9"]

    var body: some View {
        ScrollView {
           LazyVGrid(columns: [
               GridItem(.flexible(), spacing: 16),
               GridItem(.flexible(), spacing: 16)
           ], spacing: 16) {
               ForEach(items, id: \.self) { item in
                   VStack {
                       Circle()
                           .fill(Color(red: 0.9, green: 0.9, blue: 0.92))
                           .frame(width: 143, height: 143)
                       
                       Text(item)
                           .font(.body)
                           .foregroundColor(.black)
                   }
               }
           }
           .padding()
       }
    }
}

struct BadgesGrid_Previews: PreviewProvider {
    static var previews: some View {
        BadgesGrid()
    }
}
