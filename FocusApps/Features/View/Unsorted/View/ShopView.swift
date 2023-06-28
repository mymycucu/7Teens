//
//  ShopView.swift
//  FocusApps
//
//  Created by Ario Syahputra on 22/06/23.
//

import SwiftUI

struct ShopView: View {
    @State var selectedTab : Tabs = .character
    var coins : Int = 100
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
                        Text(String(coins))
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
                    LottieView(name: "cat_fly_red", loopMode: .autoReverse)
                        .frame(width: 200, height: 225)
                    
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
                            HStack{
                                Button{
                                    
                                }label: {
                                    ItemShop()
                                }
                                ItemShop(itemSelected: false)
                                ItemShop(isBought: false, isBuyable: true)
                            }
                            HStack{
                                Button{
                                    
                                }label: {
                                    ItemShop(isBought: false, isBuyable: true)
                                }
                                ItemShop(isBought: false, isBuyable: true)
                                ItemShop(isBought: false, isBuyable: false)
                                
                            }
                            HStack{
                                Button{
                                    
                                }label: {
                                    ItemShop(isBought: false, isBuyable: false)
                                }
                                ItemShop(isBought: false, isBuyable: false)
                                ItemShop(isBought: false, isBuyable: false)
                                
                            }
                        }.padding(10)
                    }
                    
                }
                
            }
            
        }
        
    }
    
    struct ShopView_Previews: PreviewProvider {
        static var previews: some View {
            ShopView()
        }
    }
}
