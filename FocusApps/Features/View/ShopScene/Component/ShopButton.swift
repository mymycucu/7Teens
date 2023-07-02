//
//  ShopButton.swift
//  FocusApps
//
//  Created by Sarah Uli Octavia on 27/06/23.
//

import SwiftUI

struct ShopButton: View {
    var buttonText : String
    var isActive: Bool
    
    var body: some View {
        HStack {
            HStack(alignment: .center, spacing: 10) {
                Text(buttonText)
                    .font(
                        Font.custom("Plus Jakarta Sans", size: 18)
                            .weight(.bold)
                    )
                    .foregroundColor(isActive ? Color("PG-500") : Color("GreyL-6"))
            }
            .padding(.horizontal, 14)
            .padding(.vertical, 10)
            .frame(width: 118, alignment: .center)
            .background(
                isActive ? Color("GreyL-6") : Color("PG-500")
            )
            .clipShape(
                RoundedCorner(radius: 12, corners: [.topLeft, .topRight])
            )
            
        }
        
        
    }
}

struct ShopButton_Previews: PreviewProvider {
    static var previews: some View {
        ShopButton(buttonText: "Character", isActive: true)
    }
}
