//
//  AppDelegate.swift
//  Macondo
//
//  Created by Louis Joe Shen on 2020/7/12.
//  Copyright © 2020 Louise Joe Shen. All rights reserved.
//

import Cocoa
import SwiftUI
import Preferences

extension Preferences.PaneIdentifier {
    static let preferences = Self("preferences")
}

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    var window: NSWindow!
    //view menu item declaration
    @IBOutlet weak var darkModeItem: NSMenuItem!
    @IBOutlet weak var lightModeItem: NSMenuItem!
    @IBOutlet weak var systemModeItem: NSMenuItem!

    lazy var preferences: [PreferencePane] = [
        PreferencesPreferenceViewController()
    ]
    
    lazy var preferencesWindowController = PreferencesWindowController(
        preferencePanes: preferences,
        style: .segmentedControl,
        animated: true,
        hidesToolbarForSingleItem: true
    )
    
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
    /*@IBAction func setPreferences(_ sender: Any) {
        preferencesWindowController.show()
    }*/
    @IBAction func export(_ sender: Any) {
        let dialog = NSOpenPanel();

        dialog.title = "Choose a directory";
        dialog.showsResizeIndicator = true;
        dialog.showsHiddenFiles = false;
        dialog.canChooseFiles = false;
        dialog.canChooseDirectories = true;

        if (dialog.runModal() ==  NSApplication.ModalResponse.OK) {
            let result = dialog.url
            if (result != nil) {
                Generator.generate(directory: result!)
                Generator.generateLinks(directory: result!)
                Generator.generateBooks(directory: result!)
                print(result!.path)
            }
        } else {
            return
        }
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

