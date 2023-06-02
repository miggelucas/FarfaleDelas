//
//  StatusBarController.swift
//  FarfaleDelas
//
//  Created by ditthales on 25/05/23.
//

import SwiftUI

extension NSImage.Name {
    static let logo = NSImage.Name("SettingsBarIcon")
}

class StatusBarController{
    private var statusBar: NSStatusBar
    private(set) var statusItem: NSStatusItem
    private(set) var popover: NSPopover
    private var eventMonitor: Any?
    private var isPopoverOpen = false
    
    init(_ popover: NSPopover) {
        self.popover = popover
        statusBar = .init()
        statusItem = statusBar.statusItem(withLength: NSStatusItem.variableLength)
        
        if let button = statusItem.button {
            
            button.image = NSImage(named: .logo)
            button.image?.size = CGSizeMake(24, 24)
            button.action = #selector(showApp(sender:))
            button.target = self
            
        }
        
        setupEventMonitor()
        setupCmdQ()
        
    }
    
    @objc func showApp(sender: AnyObject){
        if popover.isShown{
            popover.performClose(nil)
            isPopoverOpen = false
        }else{
            popover.show(relativeTo: statusItem.button!.bounds, of: statusItem.button!, preferredEdge: .maxY)
            NSRunningApplication.current.activate(options: [.activateIgnoringOtherApps])
            isPopoverOpen = true
        }
    }
    
    private func setupCmdQ(){
        let quitMenuItem = NSMenuItem(title: "Quit MyApp", action: #selector(NSApplication.terminate(_:)), keyEquivalent: "q")
        quitMenuItem.keyEquivalentModifierMask = [.command]

        let mainMenu = NSMenu()
        mainMenu.addItem(quitMenuItem)

        let appMenuItem = NSMenuItem()
        appMenuItem.submenu = mainMenu

        let applicationMenu = NSMenu(title: "Menu")
        applicationMenu.addItem(appMenuItem)

        NSApp.mainMenu = applicationMenu

    }
    
    private func setupEventMonitor(){
        eventMonitor = NSEvent.addGlobalMonitorForEvents(matching: [.leftMouseDown, .rightMouseDown], handler: { [weak self] event in
            guard let self = self else {return}

            if self.isPopoverOpen{
                self.popover.performClose(nil)
                self.isPopoverOpen = false
            }
        })
    }
    
}
