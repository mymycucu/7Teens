//
//  ShopPreview.swift
//  FocusApps
//
//  Created by Sarah Uli Octavia on 28/06/23.
//

import SwiftUI

struct ShopPreview: View {
    @EnvironmentObject var appState : AppState
    var body: some View {
        VStack{
            switch ("\(appState.body)-\(appState.hat)"){
            case "cat-hat-blue":
                LottieView(name: "cat-hat-blue", loopMode: .loop)
                    .frame(width: 200, height: 225)
            case "cat-hat-brown":
                LottieView(name: "cat-hat-brown", loopMode: .loop)
                    .frame(width: 200, height: 225)
            case "cat-hat-lilac":
                LottieView(name: "cat-hat-lilac", loopMode: .loop)
                    .frame(width: 200, height: 225)
            case "cat-hat-navy":
                LottieView(name: "cat-hat-navy", loopMode: .loop)
                    .frame(width: 200, height: 225)
            case "cat-hat-sage":
                LottieView(name: "cat-hat-sage", loopMode: .loop)
                    .frame(width: 200, height: 225)
            default:
                LottieView(name: "cat-hat-red", loopMode: .loop)
                    .frame(width: 200, height: 225)
            }
        }
        
    }
}

//struct ShopPreview_Previews: PreviewProvider {
//    static var previews: some View {
//        ShopPreview()
//    }
//}
