//
//  ContentView.swift
//  Macondo
//
//  Created by Louis Joe Shen on 2020/10/7.
//

import SwiftUI

class ViewNavigation: ObservableObject {
    @Published var showView : Int? = 0
    @Published var lang = "zh-CN"
}

struct ContentView: View {
    @EnvironmentObject var showView : ViewNavigation
    
    var setLanguageEnSelected = NotificationCenter.default.publisher(for: .setLanguageEn).receive(on: RunLoop.main)
    var setLanguageZhCNSelected = NotificationCenter.default.publisher(for: .setLanguageZhCN).receive(on: RunLoop.main)
    var setLanguageZhTWSelected = NotificationCenter.default.publisher(for: .setLanguageZhTW).receive(on: RunLoop.main)
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: PostView(language: self.showView.lang), tag: 1, selection: self.$showView.showView) {
                    HStack {
                        Label(T.me(t: "Post", language: self.showView.lang), systemImage: "square.and.pencil")
                    }
                }
                NavigationLink(destination: LinkView(language: self.showView.lang), tag: 2, selection: self.$showView.showView) {
                    Label(T.me(t: "Link", language: self.showView.lang), systemImage: "link")
                }
                NavigationLink(destination: BookView(language: self.showView.lang), tag: 3, selection: self.$showView.showView) {
                    Label(T.me(t: "Book", language: self.showView.lang), systemImage: "book")
                }
                NavigationLink(destination: AnimeView(language: self.showView.lang), tag: 4, selection: self.$showView.showView) {
                    Label(T.me(t: "Anime", language: self.showView.lang), systemImage: "airplayvideo")
                }
                NavigationLink(destination: VideoView(language: self.showView.lang), tag: 5, selection: self.$showView.showView) {
                    Label(T.me(t: "Video", language: self.showView.lang), systemImage: "film")
                }
            }
            .listStyle(SidebarListStyle())
            .onReceive(setLanguageEnSelected) {_ in
                self.showView.lang = "en"
            }
            .onReceive(setLanguageZhCNSelected) {_ in
                self.showView.lang = "zh-CN"
            }
            .onReceive(setLanguageZhTWSelected) {_ in
                self.showView.lang = "zh-TW"
            }
            .frame(minWidth: 220, idealWidth: 220, maxWidth: 220, minHeight: 400, maxHeight: .infinity)
            .toolbar {
                Button(action: toggleSidebar) {
                    Image(systemName: "sidebar.left")
                    .help("Toggle Sidebar")
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigation) {
                VStack(alignment: .leading) {
                    Text("Version \(Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String)")
                    Text(T.me(t: "Current language: ", language: self.showView.lang) + T.me(t: self.showView.lang, language: self.showView.lang))
                }
            }
        }
    }
    
    private func toggleSidebar() {
        NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
