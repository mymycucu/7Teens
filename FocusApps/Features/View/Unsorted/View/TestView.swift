//
//  TestView.swift
//  FocusApps
//
//  Created by Hilmy Noerfatih on 30/06/23.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        LottieView(name: "cat-hat-blue", loopMode: .autoReverse)
            .frame(width: 200, height: 200)
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
