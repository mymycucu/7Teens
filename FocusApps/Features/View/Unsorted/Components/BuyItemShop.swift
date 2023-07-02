//
//  BuyItemShop.swift
//  FocusApps
//
//  Created by Sarah Uli Octavia on 28/06/23.
//

import SwiftUI

struct BuyItemShop: View {
    @EnvironmentObject var appState: AppState
    @StateObject var viewModel: ShopViewModel
    @Binding var isShowingPopUp: Bool
    var item : ShopItem
    var body: some View {
        ZStack{
            VStack{
                // MARK: Item Title
                Text(item.itemTitle)
                    .font(
                        Font.custom("Plus Jakarta Sans", size: 18)
                            .weight(.bold)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.07, green: 0.34, blue: 0.35))
                // MARK: Item Image
                Image(item.itemName)
                    .resizable()
                    .frame(width: 150,height: 150)
                
                // MARK: Item Price
                HStack(alignment:.center){
                    Image("coin")
                        .resizable()
                        .frame(width: 24,height: 24)
                    Text("\(item.price)")
                        .font(
                        Font.custom("Plus Jakarta Sans", size: 16)
                        .weight(.semibold)
                        )
                        .foregroundColor(.black)
                }
                // MARK: Buy Button
                HStack(alignment: .center, spacing: 22){
                    Button{
                        viewModel.buyItem(item: item)
                        viewModel.refreshData()
                        isShowingPopUp = false
                    } label: {
                        Text("Buy")
                            .foregroundColor(.white)
                            .frame(width: 260, height: 44, alignment: .center)
                            .background(UserDefaults.standard.integer(forKey: "coins") >= item.price ? Color("SY-500") : Color("GreyL-4"))
                            .cornerRadius(22)
                    }
                    .disabled(appState.coins < item.price)
                }
            }
            .padding(15)
            .frame(width: 290, height: 305, alignment: .center)
            .background(Color("GreyL-6"))
            .cornerRadius(12)
            // MARK: X button
            VStack{
                HStack{
                    Spacer()
                    Button{
                        isShowingPopUp = false
                    }label: {
                        Image(systemName: "xmark.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 32, height: 32)
                            .foregroundColor(Color("Red"))
                            .background(
                                Circle()
                                    .foregroundColor(.white)
                            )
                    }
                }
                Spacer()
            }
            .frame(width: 310, height: 330, alignment: .center)
        }
    }
}


