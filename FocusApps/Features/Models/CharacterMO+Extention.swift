//
//  CharacterMO+Extention.swift
//  FocusApps
//
//  Created by Hilmy Noerfatih on 22/06/23.
//

import Foundation

extension CharacterMO {
    var taskMOList: [TaskMO] {
        ((tasks?.allObjects as? [TaskMO]) ?? [TaskMO]()).sorted(by: {$0.createdAt! < $1.createdAt!})
    }
    
}
