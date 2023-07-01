//
//  SessionMO+Extention.swift
//  FocusApps
//
//  Created by Hilmy Noerfatih on 21/06/23.
//

import Foundation

extension SessionMO {
    var activityMOList: [ActivityMO] {
        ((activities?.allObjects as? [ActivityMO]) ?? [ActivityMO]()).sorted(by: {$0.createdAt! < $1.createdAt!})
    }
    
    func getTotalFocusTime() -> Int{
        var totalFocusTime = 0
        for activity in activityMOList {
            if activity.type == 0 {
                totalFocusTime += Int(activity.duration)
            }
        }
        return totalFocusTime
    }
}
