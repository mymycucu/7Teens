//
//  Constant.swift
//  FocusApps
//
//  Created by Hilmy Noerfatih on 22/06/23.
//

import Foundation
import SwiftUI

struct Constant {
    static let shouldShowOnboarding = "shouldShowOnboarding"
    static let userIdKey = "ud_user_id"
    static let createdAtKey = "created_at"
    static let containerName = "AppModel"
    static let standardDateFormat = "dd/MM/yyyy HH:mm"
    
    static let cycleOptions = ["One", "Two", "Three", "Four"]

    // MARK: shop's items
    static let catItem = ShopItem(itemName: "cat", price: 0, itemTitle: "Olen the Cat")
    static let dogItem = ShopItem(itemName: "dog", price: 2500, itemTitle: "Goldie the Dog")
    static let koalaItem = ShopItem(itemName: "koala", price: 5000, itemTitle: "Kai the Koala")
    static let hatRed = ShopItem(itemName: "hat-red", price: 0, itemTitle: "RedBull Cap")
    static let hatBlue = ShopItem(itemName: "hat-blue", price: 45, itemTitle: "Blueming Cap")
    static let hatLilac = ShopItem(itemName: "hat-lilac", price: 85, itemTitle: "Lilavender Cap")
    static let hatBrown = ShopItem(itemName: "hat-brown", price: 125, itemTitle: "Brownies Cap")
    static let hatNavy = ShopItem(itemName: "hat-navy", price: 165, itemTitle: "Naverland Cap")
    static let hatSage = ShopItem(itemName: "hat-sage", price: 205, itemTitle: "Sagreen Cap")
    
    // MARK: badges
    static let rookieAchiever = BadgeItem(badgeImage: "rookie-achiever", badgeTitle: "Rookie Achiever")
    static let hatMaven = BadgeItem(badgeImage: "hat-maven", badgeTitle: "Hat Maven")
    static let timeTamer = BadgeItem(badgeImage: "time-tamer", badgeTitle: "Time Tamer")
    static let characterCollector = BadgeItem(badgeImage: "character-collector", badgeTitle: "Character Collector")
    static let streakMaster = BadgeItem(badgeImage: "streak-master", badgeTitle: "Streak Master")
    static let zenMaster = BadgeItem(badgeImage: "zen-master", badgeTitle: "Zen Master")

    static let colorDisabled = Color(red: 1, green: 0.92, blue: 0.64)
    static let cororEnabled = Color(red: 0.97, green: 0.7, blue: 0.1)
}

class ShopItem {
    var itemName: String
    var price: Int
    var itemTitle: String
    
    init(itemName: String, price: Int, itemTitle:String) {
        self.itemName = itemName
        self.price = price
        self.itemTitle = itemTitle
    }
}

struct BadgeItem : Hashable{
    var badgeImage: String
    var badgeTitle: String
    
    init(badgeImage: String, badgeTitle: String) {
        self.badgeImage = badgeImage
        self.badgeTitle = badgeTitle
    }
}
