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
    var itemTitle : String
    var body: some View {
        ZStack{
            VStack{
                Text(itemTitle)
                    .font(
                        Font.custom("Plus Jakarta Sans", size: 18)
                            .weight(.bold)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.07, green: 0.34, blue: 0.35))
                
                Image(item.itemName)
                    .resizable()
                    .frame(width: 150,height: 150)
                    .padding(10)
                
                HStack(alignment: .center, spacing: 22){
                    
                    Button{
                        viewModel.buyItem(item: item)
                        viewModel.refreshData()
                        isShowingPopUp = false
                    } label: {
                        Text("Buy")
                            .foregroundColor(.white)
                            .frame(width: 260, height: 44, alignment: .center)
                            .background(Color(red: 0.97, green: 0.7, blue: 0.1))
                            .cornerRadius(22)
                    }
                }
            }
            .frame(width: 290, height: 305, alignment: .center)
            
            .background(Color("GreyL-6"))
            .cornerRadius(12)
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


