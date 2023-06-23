//
//  ShopView.swift
//  FocusApps
//
//  Created by Ario Syahputra on 22/06/23.
//

import SwiftUI

struct ShopView: View {
    var body: some View {
        
        ZStack {
            // Background
            Color("ShopBGColor").edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    Text("Shop")
                        .font(.system(size: 24, weight: .semibold))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                    
                    Spacer()
                    
                    Text("100 $")
                        .font(.system(size: 16, weight: .semibold))
                        .padding(7)
                        .background(.yellow)
                        .cornerRadius(31)
                }
                .padding()
                
                VStack {
                    Image("kucing")
                        .frame(width: 114, height: 227)
                }
                .frame(width: 358, height: 256)
                .background(.white)
                .cornerRadius(10)
                .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                
                
                
                ZStack{
                    Color(.white)
                        .cornerRadius(20)
                        .edgesIgnoringSafeArea(.all)
                    
                    HStack{
                        
                        VStack{
                            VStack {
                                Image("kucingitems")
                                    .resizable()
                                    .frame(width: 75, height: 60)
                                
                                Text("Cat")
                                    .padding(.top, 5)
                                    
                            }
                            .padding()
                            .frame(width: 124, height: 120)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 3)
                            )
                            
                            Button(action: {

                            }) {
                                Text("Equip")
                                    .foregroundColor(.white)
                                    .frame(width: 124, height: 32)
                                    .background(Color.black)
                                    .cornerRadius(8)
                            }
                            .padding()
                        }
                        
                        VStack{
                            VStack {
                                Image("kucingitems")
                                    .resizable()
                                    .frame(width: 75, height: 60)
                                
                                Text("Cat")
                                    .padding(.top, 5)
                                    
                            }
                            .padding()
                            .frame(width: 124, height: 120)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 3)
                            )
                            
                            Button(action: {

                            }) {
                                Text("Equip")
                                    .foregroundColor(.white)
                                    .frame(width: 114, height: 32)
                                    .background(Color.black)
                                    .cornerRadius(8)
                            }
                            .padding()
                        }
                        
                        
                    }
                    
                }
                .padding(.top, 60)
                
                
                
                // Content
            }

            
        }
    }
    
    struct ShopView_Previews: PreviewProvider {
        static var previews: some View {
            ShopView()
        }
    }
}
