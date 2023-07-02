//
//  CycleBarView.swift
//  FocusApps
//
//  Created by Hilmy Noerfatih on 01/07/23.
//

import SwiftUI

struct CycleBarView: View {
    @StateObject var viewModel: TimerViewModel
    var body: some View {
        HStack {
            ForEach(1...(viewModel.cycle+1), id: \.self) { index in
                
                ZStack {
                    Circle()
                        .frame(width: 20, height: 20)
                        .foregroundColor(index > viewModel.focusStep ? .gray : Color(red: 0.25, green: 0.6, blue: 0.58))
                    
                    Text("\(index)")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(.white)
                }
                .padding(.horizontal, -2)
                
                if index != (viewModel.cycle+1) {
                    ZStack {
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundColor(index > viewModel.restStep ? .gray : Color(red: 0.25, green: 0.6, blue: 0.58))
                    }
                    .padding(.horizontal, -2)
                }
            }
        }
    }
}

struct ExtractedView_Previews: PreviewProvider {
    static var previews: some View {
        CycleBarView(viewModel: TimerViewModel())
    }
}
