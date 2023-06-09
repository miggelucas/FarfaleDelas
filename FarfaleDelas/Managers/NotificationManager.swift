//
//  NotificationManager.swift
//  FarfaleDelas
//
//  Created by Lucas Migge de Barros on 31/05/23.
//

import Foundation
import UserNotifications
import AppKit


class NotificationManager: NSObject {
    
    static var shared = NotificationManager()
    
    let notificationCenter = UNUserNotificationCenter.current()
    
    func sendNotification() {
        let openAppAction = UNNotificationAction(identifier: "openAppAction", title: "Abrir App", options: [])
        let category = UNNotificationCategory(identifier: "myCategory", actions: [openAppAction], intentIdentifiers: [], options: [])
        
        notificationCenter.setNotificationCategories([category])
        
        
        let content = UNMutableNotificationContent()
        content.title = "Your Time"
        content.body = "O seu tempo acabou!"
        content.sound = UNNotificationSound.default
        content.categoryIdentifier = "myCategory"
        
        
        let request = UNNotificationRequest(identifier: "NotificacaoID", content: content, trigger: nil)
        
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print("Erro ao agendar a notificação: \(error.localizedDescription)")
            } else {
                print("Notificação agendada com sucesso.")
            }
        }
    }


   

}
