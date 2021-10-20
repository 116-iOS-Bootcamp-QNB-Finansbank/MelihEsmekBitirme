//
//  NotificationManager.swift
//  Todo
//
//  Created by Melih Bugra Esmek on 19.10.2021.
//

import Foundation
import UserNotifications

protocol NotificationManagerProtocol {
    func createNotification(task: TaskDetailPresentation)
    func cancelNotification(task: Task)
}
class NotificationManager: NSObject, NotificationManagerProtocol {

    let center = UNUserNotificationCenter.current()
    
    func createNotification(task: TaskDetailPresentation) {
        // CONTENT
               let content = UNMutableNotificationContent()
               content.title = "Reminder"
                content.subtitle = task.title
               content.body = task.detail
    
               content.sound = UNNotificationSound.default
        
               // TRIGGER
               let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
              
               // CUSTOM ACTIONS
               
               // Define Action
               let snoozeAction = UNNotificationAction(identifier: "Snooze", title: "Snooze", options: [])
               let deleteAction = UNNotificationAction(identifier: "DeleteAction", title: "Delete", options: [.destructive])
               
               // Create Category
               let category = UNNotificationCategory(identifier: "MyNotificationsCategory", actions: [snoozeAction, deleteAction], intentIdentifiers: [], options: [])
               
               // Register Category
               center.setNotificationCategories([category])
               content.categoryIdentifier = "MyNotificationsCategory"
                
               // REQUEST
        let identifier = (task.uuid)?.uuidString
        
               let request = UNNotificationRequest(identifier: identifier!, content: content, trigger: trigger)
        
               center.add(request) { (error) in
                   if error != nil {
                       print("Something wrong")
                   }
               }
           }
    func cancelNotification(task: Task) {
        let identifier = (task.uuid)?.uuidString
        center.removePendingNotificationRequests(withIdentifiers: [identifier!])
    }
               
}

extension NotificationManager: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
           completionHandler()
       }
       
       func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
           completionHandler([.alert, .badge, .sound])
       }
        
    
   
}
