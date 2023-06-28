//
//  ShopSegmented.swift
//  FocusApps
//
//  Created by Sarah Uli Octavia on 27/06/23.
//

import SwiftUI

struct ShopSegmented: View {
    @Binding var selectedTab: Tabs
    var body: some View {
        HStack {
            Button{
                selectedTab = .character
            }label: {
                ShopButton(buttonText: "Character", isActive: selectedTab == .character)
            }
            Button{
                selectedTab = .hat
            }label: {
                ShopButton(buttonText: "Hat", isActive: selectedTab == .hat)
            }
           
        }
    }
}

struct ShopSegmented_Previews: PreviewProvider {
    static var previews: some View {
        ShopSegmented(selectedTab: .constant(.character))
    }
}
