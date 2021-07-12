//
//  WelcomeView.swift
//  Macondo
//
//  Created by Louis Shen on 2021/7/10.
//

import SwiftUI

class WindowObserver : ObservableObject {
    weak var window: NSWindow?
}

struct WelcomeView : View {
    @Environment(\.openURL) var openURL
    @EnvironmentObject var showView : ViewNavigation
    
    @StateObject var windowObserver: WindowObserver = WindowObserver()
    @State var allowOncePress = false
    
    var body : some View {
        HStack(spacing: 0) {
            VStack(spacing: 0) {
                Image("512")
                    .resizable()
                    .frame(width: 256, height: 256)
                Text("Welcome to Macondo")
                    .font(.system(size: 40, weight: .regular))
                Spacer().frame(height: 10)
                Text("Version \(Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "–")")
                    .foregroundColor(.secondary)
                Spacer()
                Button(action: {
                    Sqlite.createTables(language: "zh-CN")
                    Sqlite.createTables(language: "zh-TW")
                    Sqlite.createTables(language: "en")
                    self.allowOncePress = true
                }) {
                    HStack {
                        Image(systemName: "doc")
                            .font(.system(size: 32))
                            .foregroundColor(.blue)
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Create new Macondo blogs")
                                .font(.headline)
                                .lineLimit(1)
                            Text("Create database files")
                                .font(.system(size: 11))
                                .foregroundColor(.secondary)
                                .lineLimit(1)
                        }
                    }.padding([.top, .bottom], 4)
                }
                .disabled(isDBExist() || allowOncePress)
                .buttonStyle(PlainButtonStyle())
                .padding()
            }
            .frame(width: 540, alignment: .center)
            .frame(maxHeight: .infinity)
            .background(Color(NSColor.windowBackgroundColor))
            
            
            let path = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true).first! + "/" + Bundle.main.bundleIdentifier!
            let languages = ["en", "zh-CN", "zh-TW"]
            
            List {
                if isDBExist() {
                    ForEach(languages, id: \.self) { i in
                        Button(action: {
                            if let url = URL(string: "macondo://mainview") {
                                self.showView.lang = i
                                openURL(url)
                                windowObserver.window = NSApp.keyWindow
                                waitToClose()
                            }
                        }) {
                            HStack {
                                Image(systemName: "doc")
                                    .font(.system(size: 18))
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(i)
                                        .lineLimit(1)
                                    Text(path + "/" + i + ".db")
                                        .font(.system(size: 11))
                                        .foregroundColor(.secondary)
                                        .lineLimit(1)
                                }
                            }.padding([.top, .bottom], 4)
                        }.buttonStyle(PlainButtonStyle())
                    }
                } else {
                    Text("Database not found")
                }
            }
            .listStyle(SidebarListStyle())
            .frame(width: 260, alignment: .center)
            .frame(maxHeight: .infinity)
        }
    }
    
    private func isDBExist() -> Bool {
        let path = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true).first! + "/" + Bundle.main.bundleIdentifier!
        let languages = ["en", "zh-CN", "zh-TW"]
        var res = false
        for i in languages {
            res = FileManager.default.fileExists(atPath: path + "/blog." + i + ".db")
        }
        return res
    }
    
    
    private func waitToClose() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            if (NSApp.windows.count > 1) {
                windowObserver.window?.close();
                NSApp.keyWindow?.center()
                return
            } else {
                waitToClose()
            }
        }
    }
}
