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
    static let dogItem = ShopItem(itemName: "dog", price: 500)
    static let koalaItem = ShopItem(itemName: "koala", price: 2000)
}

class ShopItem {
    var itemName: String
    var price: Int
    
    init(itemName: String, price: Int) {
        self.itemName = itemName
        self.price = price
    }
}

