//
//  NotificationTool.swift
//  LearnIO
//
//  Created by Anthony RODRIGUES on 13/05/2023.
//

import Foundation
import UserNotifications

public struct NotificationTools {
    
    public static func scheduleNotification() {
        let center = UNUserNotificationCenter.current()
        
        let content = UNMutableNotificationContent()
        content.title = "SwiftUI"
        content.body = "Il est l'heure de réviser !"
        content.categoryIdentifier = "alarm"
        content.userInfo = ["customData": "abc"]
        content.sound = UNNotificationSound.default
        
        var dateComponents = DateComponents()
        dateComponents.hour = 14
        dateComponents.minute = 33
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        center.add(request)
    }
    
}
