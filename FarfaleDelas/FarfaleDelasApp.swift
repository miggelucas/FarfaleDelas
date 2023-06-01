//
//  FarfaleDelasApp.swift
//  FarfaleDelas
//
//  Created by Lucas Migge de Barros on 25/05/23.
//

import SwiftUI
import AppKit
import UserNotifications

@main
struct FarfaleDelasApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var notificationCenter = NotificationManager.shared
    
    var body: some Scene {
        Settings{
            HomeView().accentColor(Color(ColorConstant.SECONDARY_PINK))
        }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate, UNUserNotificationCenterDelegate{
    static private(set) var instance: AppDelegate!
    
    var statusBar: StatusBarController?
    var notificationManager = NotificationManager.shared
    
    
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        AppDelegate.instance = self
        notificationManager.notificationCenter.delegate = self
        
        notificationManager.notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            if granted {
                print("Permissão concedida para enviar notificações.")
            } else {
                print("Permissão negada para enviar notificações.")
            }
        }
        
        statusBar = StatusBarController(createPopover())
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        if response.actionIdentifier == "openAppAction" {
            if NSApp.activationPolicy() == .accessory {
                // Ativa o aplicativo
                NSApp.activate(ignoringOtherApps: true)
                
                statusBar?.showApp(sender: self)
            } else {
                // Define a política de ativação do aplicativo para acessório
                NSApp.setActivationPolicy(.accessory)

                statusBar?.showApp(sender: self)

            }
        }
        
        completionHandler()
    }
    
    
    private func createPopover() -> NSPopover {
        let popover = NSPopover.init()
        
        popover.behavior = .transient
        popover.animates = false
        popover.contentSize = NSSize(width: 632, height: 596)
        popover.contentViewController = NSHostingController(rootView: HomeView())
        
        return popover
    }
}
