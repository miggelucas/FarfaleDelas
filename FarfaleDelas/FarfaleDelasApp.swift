//
//  FarfaleDelasApp.swift
//  FarfaleDelas
//
//  Created by Lucas Migge de Barros on 25/05/23.
//

import SwiftUI

@main
struct FarfaleDelasApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        Settings{
            HomeView().accentColor(Color(ColorConstant.SECONDARY_PINK))
        }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate{
    static private(set) var instance: AppDelegate!
    var popover = NSPopover.init()
    var statusBar: StatusBarController?
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        AppDelegate.instance = self
        popover.behavior = .transient
        popover.animates = false
        popover.contentSize = NSSize(width: 632, height: 596)
        popover.contentViewController = NSHostingController(rootView: HomeView())
        
        statusBar = StatusBarController(popover)
    }
}
