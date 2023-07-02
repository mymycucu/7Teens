//
//  ShopCharacterItem.swift
//  FocusApps
//
//  Created by Sarah Uli Octavia on 28/06/23.
//

import SwiftUI

struct ShopCharacterItem: View {
    @EnvironmentObject var appState: AppState
    @StateObject var viewModel: ShopViewModel
    var item: ShopItem
    @Binding var isShowingPopUp: Bool
    
    var body: some View {
        // MARK: Button Character Item
        Button{
            if viewModel.isBought(name: item.itemName){
                isShowingPopUp = false
            }else{
                viewModel.itemToBuy = item
                isShowingPopUp = true
            }
        }label: {
            ZStack {
                // MARK: Character that already bought
                if viewModel.isBought(name: item.itemName){
                    HStack(alignment: .center, spacing: 0) {
                        Image(item.itemName)
                            .resizable()
                            .frame(width: 80)
                    }
                    .padding(15)
                    .frame(width: 109, height: 109, alignment: .center)
                    .background(Color("GreyL-5"))
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .inset(by: 2)
                            .stroke((appState.body == item.itemName) ? Color("Green") : Color("GreyL-3"), lineWidth: 4)
                    )
                    // MARK: character is bought && selected
                    if (appState.body == item.itemName) {
                        VStack{
                            HStack{
                                Spacer()
                                Image(systemName: "checkmark.circle.fill")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 26, height: 26)
                                    .foregroundColor(Color("Green"))
                                    .background(
                                        Circle()
                                            .foregroundColor(.white)
                                    )
                            }
                            Spacer()
                        }
                        .frame(width: 115, height: 115, alignment: .center)
                    }
                    
                }
                // MARK: character is not bought
                else {
                    HStack(alignment: .center, spacing: 0) {
                        Image(item.itemName)
                            .resizable()
                            .frame(width: 80)
                    }
                    .padding(15)
                    .frame(width: 109, height: 109, alignment: .center)
                    .background(Color("GreyL-5"))
                    .cornerRadius(12)
                    VStack{
                        Spacer()
                        HStack{
                            Image("coin")
                                .resizable()
                                .frame(width: 14,height: 14)
                            Text("\(item.price)")
                                .font(
                                Font.custom("Plus Jakarta Sans", size: 14)
                                .weight(.semibold)
                                )
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 0)
                        .frame(height: 32, alignment: .center)
                        .background(item.price <= UserDefaults.standard.integer(forKey: "coins") ? Color("SY-500") : Color("GreyL-4"))
                        .cornerRadius(22)
                    }
                    .frame(width: 109, height: 149, alignment: .center)
                }
            }
        }
        
    }
}
