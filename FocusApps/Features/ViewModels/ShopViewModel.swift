//
//  ShopViewModel.swift
//  FocusApps
//
//  Created by Sarah Uli Octavia on 28/06/23.
//

import Foundation
import CoreData

@MainActor
class ShopViewModel: ObservableObject {
    @Published var itemBoughtList: [String] = []
    @Published var itemToBuy: ShopItem = Constant.catItem
    
    init() {
        refreshData()
    }
    
    func refreshData(){
        getItemBoughtData()
    }
    
    func getItemBoughtData() {
        let fetchRequest: NSFetchRequest<ItemTransactionMO> = ItemTransactionMO.fetchRequest()
        if let itemTransactions = try? PersistenceController.shared.viewContext.fetch(fetchRequest) {
            itemTransactions.forEach { item in
                if ((item.itemName) != nil){
                    if (!(itemBoughtList.contains(item.itemName!))){
                        itemBoughtList.append(item.itemName!)
                    }
                }
            }
        }
    }
    
    func isBought(name: String) -> Bool{
        refreshData()
        return itemBoughtList.contains(name)
    }
    
    func buyItem (item: ShopItem){
        let newItem = PersistenceController.shared.create(ItemTransactionMO.self)
        newItem!.id = UUID()
        newItem!.itemName = item.itemName
        newItem!.createdAt = Date()
        do {
            try PersistenceController.shared.save()
        } catch {
            print("Error saving")
        }
    }
    
}
    
