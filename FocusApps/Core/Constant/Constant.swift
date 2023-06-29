//
//  Constant.swift
//  FocusApps
//
//  Created by Hilmy Noerfatih on 22/06/23.
//

import Foundation

struct Constant {
    static let shouldShowOnboarding = "shouldShowOnboarding"
    static let userIdKey = "ud_user_id"
    static let createdAtKey = "created_at"
    static let containerName = "AppModel"
    static let standardDateFormat = "dd/MM/yyyy HH:mm"
    
    static let catItem = ShopItem(itemName: "cat", price: 0)
    static let dogItem = ShopItem(itemName: "dog", price: 1000)
    static let koalaItem = ShopItem(itemName: "koala", price: 2000)
    static let hatRed = ShopItem(itemName: "hat-red", price: 0)
    static let hatBlue = ShopItem(itemName: "hat-blue", price: 45)
    static let hatLilac = ShopItem(itemName: "hat-lilac", price: 85)
    static let hatBrown = ShopItem(itemName: "hat-brown", price: 125)
    static let hatNavy = ShopItem(itemName: "hat-navy", price: 165)
    static let hatSage = ShopItem(itemName: "hat-sage", price: 205)
    
    static let cycleOptions = ["One", "Two", "Three", "Four"]

}

class ShopItem {
    var itemName: String
    var price: Int
    
    init(itemName: String, price: Int) {
        self.itemName = itemName
        self.price = price
    }
}

