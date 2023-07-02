//
//  InsightSessionModel.swift
//  FocusApps
//
//  Created by Hilmy Noerfatih on 02/07/23.
//

import Foundation

struct InsightSessionModel: Identifiable{
    var id = UUID()
    var taskName : String
    var completion : String
    var duration : String
    var time : String
}
