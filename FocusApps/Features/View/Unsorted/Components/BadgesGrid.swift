//
//  BadgesGrid.swift
//  FocusApps
//
//  Created by Ario Syahputra on 28/06/23.
//

import SwiftUI

struct BadgesGrid: View {
    let items:[BadgeItem] = [Constant.rookieAchiever, Constant.hatMaven,
                             Constant.timeTamer, Constant.characterCollector,
                             Constant.streakMaster, Constant.zenMaster]
    var isAchieved: Bool = false
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [
                GridItem(.flexible(), spacing: 16),
                GridItem(.flexible(), spacing: 16)
            ], spacing: 16) {
                ForEach(items, id: \.self) { item in
                    VStack {
                        // MARK: badge image
                        if isAchieved {
                            Image(item.badgeImage)
                                .resizable()
                                .frame(width: 154, height: 154)
                        } else {
                            Image(item.badgeImage+"-disable")
                                .resizable()
                                .frame(width: 154, height: 154)
                        }
                       
                        // MARK: badge title
                        Text(item.badgeTitle)
                            .font(
                            Font.custom("Plus Jakarta Sans", size: 14)
                            .weight(.semibold)
                            )
                            .foregroundColor(isAchieved ? .black : Color("GreyL-2"))
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
