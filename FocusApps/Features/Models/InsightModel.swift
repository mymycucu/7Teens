//
//  InsightModel.swift
//  FocusApps
//
//  Created by Hilmy Noerfatih on 02/07/23.
//

import Foundation

struct InsightModel : Identifiable{
    var id = UUID()
    var totalFocusTime : Int
    var totalTask : Int
    var totalCoin : Int
    var sessionList: [InsightSessionModel]
}
