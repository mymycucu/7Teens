//
//  ShopPreview.swift
//  FocusApps
//
//  Created by Sarah Uli Octavia on 28/06/23.
//

import SwiftUI

struct ShopPreview: View {
    var bodyName: String
    var hatName: String
    var body: some View {
        VStack{
            LottieView(name: "\(bodyName)-\(hatName)", loopMode: .autoReverse)
                .frame(width: 200, height: 225)
        }
        
    }
}

//struct ShopPreview_Previews: PreviewProvider {
//    static var previews: some View {
//        ShopPreview()
//    }
//}
