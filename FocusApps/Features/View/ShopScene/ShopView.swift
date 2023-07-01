//
//  ShopView.swift
//  FocusApps
//
//  Created by Ario Syahputra on 22/06/23.
//

import SwiftUI

struct ShopView: View {
    @EnvironmentObject var appState: AppState
    @StateObject var viewModel = ShopViewModel()
    @State var isShowingPopUp = false
    @State var selectedTab : Tabs = .character
    var body: some View {
        
        ZStack {
            // MARK: background
            RadialGradient(
                gradient: Gradient(colors: [Color("PG-401"), Color("PG-400")]),
                center: UnitPoint(x: 0.5, y: 0.35),
                startRadius: 0,
                endRadius: 200
            )
            .edgesIgnoringSafeArea(.all)
            
            VStack(spacing:0){
                // MARK: user's coin
                HStack {
                    Spacer()
                    
                    
                    HStack{
                        Image("coin")
                            .resizable()
                            .frame(width: 34,height: 34)
                        Spacer()
                        Text(String(appState.coins))
                    }
                    .padding(.trailing, 16)
                    .padding(.vertical, 0)
                    .frame(width: 97, height: 34, alignment: .center)
                    .background(Color("GreyL-5").opacity(0.9))
                    .cornerRadius(22)
                    
                }
                .padding()
                
                // MARK: preview
                VStack {
                    
                    ShopPreview(bodyName: appState.body, hatName: appState.hat)

                    //character's shadow
                    Ellipse()
                        .foregroundColor(.black)
                        .opacity(0.07)
                        .frame(width: 192, height: 18)
                        .blur(radius: 2)
                        .padding(.bottom, 30)
                    
                }
                
                // MARK: Segmented Shop
                HStack{
                    ShopSegmented(selectedTab: $selectedTab)
                    Spacer()
                }.padding(.horizontal, 20)
                
                ZStack{
                    // MARK: background
                    Color("GreyL-6")
                        .cornerRadius(12)
                        .edgesIgnoringSafeArea(.all)
                    
                    // MARK: List
                    ScrollView {
                        VStack (spacing : 5){
                            ScrollView {
                                VStack (spacing : 5){
                                    if selectedTab == .character {
                                        HStack{
                                            ShopCharacterItem(viewModel: viewModel, item: Constant.catItem, isShowingPopUp: $isShowingPopUp)
                                            ShopCharacterItem(viewModel: viewModel, item: Constant.dogItem, isShowingPopUp: $isShowingPopUp)
                                            ShopCharacterItem(viewModel: viewModel, item: Constant.koalaItem, isShowingPopUp: $isShowingPopUp)
                                            
                                        }
                                    } else {
                                        HStack{
                                            ShopHatItem(viewModel: viewModel, item: Constant.hatRed, isShowingPopUp: $isShowingPopUp)
                                            ShopHatItem(viewModel: viewModel, item: Constant.hatBlue, isShowingPopUp: $isShowingPopUp)
                                            ShopHatItem(viewModel: viewModel, item: Constant.hatLilac, isShowingPopUp: $isShowingPopUp)
                                            
                                            
                                        }
                                        HStack{
                                            ShopHatItem(viewModel: viewModel, item: Constant.hatBrown, isShowingPopUp: $isShowingPopUp)
                        
                                            ShopHatItem(viewModel: viewModel, item: Constant.hatNavy, isShowingPopUp: $isShowingPopUp)
                                            ShopHatItem(viewModel: viewModel, item: Constant.hatSage, isShowingPopUp: $isShowingPopUp)
                                        }
                                    }
                                }.padding(10)
                            }
                        }.padding(10)
                    }
                    
                }
                
            }
            // MARK: PopUp Buy Item
            if isShowingPopUp {
                BuyItemShop(viewModel: viewModel, isShowingPopUp: $isShowingPopUp, item: viewModel.itemToBuy)
                
            }
        }
        
    }
    
    struct ShopView_Previews: PreviewProvider {
        static var previews: some View {
            ShopView()
        }
    }
}
