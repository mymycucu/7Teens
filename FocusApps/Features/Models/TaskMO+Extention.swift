//
//  TaskMO+Extention.swift
//  FocusApps
//
//  Created by Hilmy Noerfatih on 21/06/23.
//

import Foundation

extension TaskMO {
    
    var sessionMOList: [SessionMO] {
        ((sessions?.allObjects as? [SessionMO]) ?? [SessionMO]()).sorted (by: {$0.createdAt! < $1.createdAt!})
    }
    
    
}
