//
//  Notifications.swift
//  FocusApps
//
//  Created by Ario Syahputra on 28/06/23.
//

import SwiftUI
import UserNotifications

class AppDelegate: NSObject, UIApplicationDelegate {}

class NotificationManager {
    static func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, error in
            if granted {
                sendLocalNotification()
            } else if let error = error {
                print("Failed to request notification permission: \(error.localizedDescription)")
            }
        }
    }
    
    static func sendLocalNotification() {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            if settings.authorizationStatus == .authorized {
                let content = UNMutableNotificationContent()
                content.title = "Get back to Focus with Timee!"
                content.body = "Automatically end Focus Session in 20s"
                content.sound = UNNotificationSound.default

                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
                let request = UNNotificationRequest(identifier: "LocalNotification", content: content, trigger: trigger)

                UNUserNotificationCenter.current().add(request) { error in
                    if let error = error {
                        print("Failed to schedule local notification: \(error.localizedDescription)")
                    }
                }
            } else {
                print("Local notifications not authorized")
            }
        }
    }
}

