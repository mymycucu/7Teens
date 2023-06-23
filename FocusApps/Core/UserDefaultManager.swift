//
//  UserDefaultManager.swift
//  FocusApps
//
//  Created by Hilmy Noerfatih on 22/06/23.
//

import Foundation

struct UserDefaultsManager {
    static let shared = UserDefaultsManager()
    
    private init() {}
    
    var userId: String? {
        UserDefaults.standard.string(forKey: Constant.userIdKey)
    }
    
    var createdAt: Date? {
        let date = UserDefaults.standard.string(forKey: Constant.createdAtKey)
        let formatter = DateFormatter()
        formatter.dateFormat = Constant.standardDateFormat
        return formatter.date(from: date ?? "")
    }
    
    func setUserId(with id: String) {
        UserDefaults.standard.set(id, forKey: Constant.userIdKey)
        UserDefaults.standard.synchronize()
    }
    
    func deleteStoredUserId() {
        UserDefaults.standard.removeObject(forKey: Constant.userIdKey)
    }
    
    func setCreatedAt(_ date: Date) {
        let df = DateFormatter()
        df.dateFormat = Constant.standardDateFormat
        let str = df.string(from: date)
        UserDefaults.standard.setValue(str, forKey: Constant.createdAtKey)
    }
}
