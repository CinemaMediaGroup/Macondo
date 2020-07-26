//
//  AppDelegate.swift
//  Macondo
//
//  Created by Louis Joe Shen on 2020/7/12.
//  Copyright © 2020 Louise Joe Shen. All rights reserved.
//

import Cocoa
import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    var window: NSWindow!
    //view menu item declaration
    @IBOutlet weak var darkModeItem: NSMenuItem!
    @IBOutlet weak var lightModeItem: NSMenuItem!
    @IBOutlet weak var systemModeItem: NSMenuItem!
    
    //view menu item action
    @IBAction func setDarkMode(_ sender: Any) {
        NSApp.appearance = NSAppearance(named: .darkAqua)
    }
    @IBAction func setLightMode(_ sender: Any) {
        NSApp.appearance = NSAppearance(named: .aqua)
    }
    @IBAction func setSystemMode(_ sender: Any) {
        NSApp.appearance = nil
    }
    
    @IBAction func createTables(_ sender: Any) {
        Sqlite.createTables()
    }
    
    var viewNavi = ViewNavigation()
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Create the SwiftUI view that provides the window contents.
        let contentView = ContentView()

        // Create the window and set the content view. 
        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: 480, height: 300),
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered, defer: false)
        window.center()
        window.setFrameAutosaveName("Main Window")
        window.contentView = NSHostingView(rootView: contentView.environmentObject(viewNavi))
        window.makeKeyAndOrderFront(nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}

