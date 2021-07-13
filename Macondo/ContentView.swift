//
//  ContentView.swift
//  Macondo
//
//  Created by Louis Joe Shen on 2020/10/7.
//

import SwiftUI
import SQLite

class ViewNavigation : ObservableObject {
    @Published var showView : Int? = 0
    @Published var lang = "zh-CN"
    @Published var dbPath = URL(fileURLWithPath: "/")
    @Published var db : Connection?
}

struct ContentView : SwiftUI.View {
    @EnvironmentObject var showView : ViewNavigation
    
    /*var setLanguageEnSelected = NotificationCenter.default.publisher(for: .setLanguageEn).receive(on: RunLoop.main)
    var setLanguageZhCNSelected = NotificationCenter.default.publisher(for: .setLanguageZhCN).receive(on: RunLoop.main)
    var setLanguageZhTWSelected = NotificationCenter.default.publisher(for: .setLanguageZhTW).receive(on: RunLoop.main)*/
    
    var body: some SwiftUI.View {
        NavigationView {
            List {
                NavigationLink(destination: PostView(language: self.showView.lang), tag: 1, selection: self.$showView.showView) {
                    HStack {
                        Label("Post", systemImage: "square.and.pencil")
                        Spacer()
                        Text(String(Sqlite.getPostCount(self.showView.lang)))
                            .foregroundColor(.gray)
                    }
                }
                NavigationLink(destination: LinkView(language: self.showView.lang), tag: 2, selection: self.$showView.showView) {
                    HStack {
                        Label("Link", systemImage: "link")
                        Spacer()
                        Text(String(Sqlite.getLinkCount(self.showView.lang)))
                            .foregroundColor(.gray)
                    }
                }
                NavigationLink(destination: BookView(language: self.showView.lang), tag: 3, selection: self.$showView.showView) {
                    HStack {
                        Label("Book", systemImage: "book")
                        Spacer()
                        Text(String(Sqlite.getBookCount(self.showView.lang)))
                            .foregroundColor(.gray)
                    }
                }
                NavigationLink(destination: AnimeView(language: self.showView.lang), tag: 4, selection: self.$showView.showView) {
                    HStack {
                        Label("Anime", systemImage: "airplayvideo")
                        Spacer()
                        Text(String(Sqlite.getAnimeCount(self.showView.lang)))
                            .foregroundColor(.gray)
                    }
                }
                NavigationLink(destination: VideoView(language: self.showView.lang), tag: 5, selection: self.$showView.showView) {
                    HStack {
                        Label("Video", systemImage: "film")
                        Spacer()
                        Text(String(Sqlite.getVideoCount(self.showView.lang)))
                            .foregroundColor(.gray)
                    }
                }
            }
            .listStyle(SidebarListStyle())
            .frame(minWidth: 220, idealWidth: 220, maxWidth: 220, minHeight: 400, maxHeight: .infinity)
            .toolbar {
                Button(action: toggleSidebar) {
                    Image(systemName: "sidebar.left")
                    .help("Toggle Sidebar")
                }
            }
        }
    }
    
    private func toggleSidebar() {
        NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some SwiftUI.View {
        ContentView()
    }
}
