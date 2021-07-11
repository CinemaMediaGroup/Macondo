//
//  WelcomeView.swift
//  Macondo
//
//  Created by Louis Shen on 2021/7/10.
//

import SwiftUI
import SQLite

struct WelcomeView : SwiftUI.View {
    @Environment(\.openURL) var openURL
    @EnvironmentObject var showView : ViewNavigation
    
    var body : some SwiftUI.View {
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
                    let dialog = NSOpenPanel();

                    dialog.title = "Choose a blog database file";
                    dialog.showsResizeIndicator = true;
                    dialog.showsHiddenFiles = false;
                    dialog.canChooseFiles = true;
                    dialog.canChooseDirectories = false;
                    dialog.allowedFileTypes = ["db"];
                    dialog.directoryURL = URL(string: NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true).first!)

                    if (dialog.runModal() ==  NSApplication.ModalResponse.OK) {
                        let result = dialog.url
                        if (result != nil) {
                            //self.showView.dbPath = result!
                            
                            do {
                                self.showView.db = try Connection(result!.path)
                            } catch {
                                print(error)
                            }
                            if let url = URL(string: "macondo://mainview") {
                                openURL(url)
                            }
                        }
                    } else {
                        return
                    }
                }) {
                    Text("Check out an existing blog")
                }
                .padding()
            }
            .frame(width: 540, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .background(Color(NSColor.windowBackgroundColor))
            
            VStack(spacing: 32) {
                VStack(alignment: .leading) {
                    List {
                        NavigationLink(destination: ContentView()) {
                            VStack(alignment: .leading) {
                                Text("Placeholder").font(.headline)
                                Label("DB", systemImage: "folder")
                                    .font(.footnote)
                                    .foregroundColor(.gray)
                            }
                        }
                    .listStyle(SidebarListStyle())
                    }}
            }
            .frame(width: 260, alignment: .top)
            .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        }
    }
}
