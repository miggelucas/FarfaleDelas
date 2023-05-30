//
//  FarfaleDelasApp.swift
//  FarfaleDelas
//
//  Created by Lucas Migge de Barros on 25/05/23.
//

import SwiftUI
import AppKit

@main
struct FarfaleDelasApp: App {
    
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        Settings{
            EmptyView()
        }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    
    func applicationDidFinishLaunching(_ aNotification: Notification){
            NSApplication.shared.isAutomaticCustomizeTouchBarMenuItemEnabled = true
    }
}

extension AppDelegate: NSTouchBarDelegate {
    
//    func touchBar(_ touchBar: NSTouchBar, makeItemForIdentifier identifier: NSTouchBarItem.Identifier) -> NSTouchBarItem? {
//        
//    }
    
}
