//
//  NotificationManager.swift
//  FarfaleDelas
//
//  Created by Lucas Migge de Barros on 31/05/23.
//

import Foundation
import UserNotifications

class NotificationManager {
    
    static var shared = NotificationManager()
    
    let notificationCenter = UNUserNotificationCenter.current()

    func sendNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Título da Notificação"
        content.body = "O seu tempo acabou!"
        content.sound = UNNotificationSound.default

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
