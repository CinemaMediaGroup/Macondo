//
//  MacondoApp.swift
//  Macondo
//
//  Created by Louis Joe Shen on 2020/10/7.
//

import SwiftUI

@main
struct MacondoApp: App {
    var viewNavi = ViewNavigation()
    
    @State var lang : String = "zh-CN"
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(viewNavi)
        }
        .commands {
            CommandGroup(before: .saveItem) {
                Menu("New"){
                    Button(action: {
                        Sqlite.newTempPost(language: self.lang)
                    }){
                        Text("New Post")
                    }
                    Button(action: {
                        Sqlite.newTempLink(language: self.lang)
                    }){
                        Text("New Link")
                    }
                    Button(action: {
                        Sqlite.newTempBook(language: self.lang)
                    }){
                        Text("New Book")
                    }
                    Button(action: {
                        Sqlite.newTempAnime(language: self.lang)
                    }){
                        Text("New Anime")
                    }
                    Button(action: {
                        Sqlite.newTempVideo(language: self.lang)
                    }){
                        Text("New Video")
                    }
                }
                
                Divider()
                
                Button(action: {
                    Sqlite.createTables(language: "zh-CN")
                    Sqlite.createTables(language: "zh-TW")
                    Sqlite.createTables(language: "en")
                }){
                    Text("Create Tables")
                }
                
                Divider()
                
                Button(action: {
                    let dialog = NSOpenPanel();

                    dialog.title = "Choose a directory";
                    dialog.showsResizeIndicator = true;
                    dialog.showsHiddenFiles = false;
                    dialog.canChooseFiles = true;
                    dialog.canChooseDirectories = false;
                    dialog.allowedFileTypes = ["md","markdown","mac"];

                    if (dialog.runModal() ==  NSApplication.ModalResponse.OK) {
                        let result = dialog.url
                        if (result != nil) {
                            Receiver.importPost(filePath: result!, language: lang)
                            print(result!.path)
                        }
                    } else {
                        return
                    }
                }){
                    Text("Import")
                }.keyboardShortcut("i", modifiers: .command)
                
                Button(action: {
                    let dialog = NSOpenPanel();

                    dialog.title = "Choose a directory";
                    dialog.showsResizeIndicator = true;
                    dialog.showsHiddenFiles = false;
                    dialog.canChooseFiles = false;
                    dialog.canChooseDirectories = true;

                    if (dialog.runModal() ==  NSApplication.ModalResponse.OK) {
                        let result = dialog.url
                        if (result != nil) {
                            Generator.generate(directory: result!,language: lang)
                            Generator.generateLinks(directory: result!,language: lang)
                            Generator.generateLinkDatas(directory: result!, language: lang)
                            Generator.generateBooks(directory: result!,language: lang)
                            Generator.generateAnimes(directory: result!,language: lang)
                            Generator.generateVideos(directory: result!,language: lang)
                            print(result!.path)
                        }
                    } else {
                        return
                    }
                }){
                    Text("Export")
                }
                
                Divider()
            }
            
            CommandMenu("Language"){
                Button(action: {
                    self.lang = "zh-CN"
                    NotificationCenter.default.post(name: .setLanguageZhCN, object: nil)
                }){
                    Text("简体中文 (zh-CN)")
                }
                Button(action: {
                    self.lang = "zh-TW"
                    NotificationCenter.default.post(name: .setLanguageZhTW, object: nil)
                }){
                    Text("正體中文 (zh-TW)")
                }
                Button(action: {
                    self.lang = "en"
                    NotificationCenter.default.post(name: .setLanguageEn, object: nil)
                    print(lang)
                }){
                    Text("Englist (en)")
                }
            }
        }
    }
}

extension Notification.Name {
    static let setLanguageEn = Notification.Name("en")
    static let setLanguageZhTW = Notification.Name("zh-TW")
    static let setLanguageZhCN = Notification.Name("zh-CN")
}
