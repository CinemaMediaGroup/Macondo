//
//  ContentView.swift
//  Macondo
//
//  Created by Louis Joe Shen on 2020/10/7.
//

import SwiftUI
import WebKit
import Ink

class ViewNavigation: ObservableObject {
    @Published var showView : Int? = 0
    @Published var lang = "zh-CN"
}

struct ContentView: View {
    @EnvironmentObject var showView : ViewNavigation
    
    //Test begin
    
    @State var text = "666"
    
    init() {
        let markdown: String = """
        ## Preview

        ![img155](https://cdn.jsdelivr.net/gh/LouiseDevTeam/ImagePack2@latest/00000155.webp)

        Damn! It looks so great. Isn't it?

        In this article I will enable acrylic or glass effect for VS Code via using [Vibrancy](https://marketplace.visualstudio.com/items?itemName=eyhn.vscode-vibrancy) extension.

        ## Installing & Configuration

        1. Install the Vibrancy extension from the [Visual Studio Code Marketplace](https://marketplace.visualstudio.com/items?itemName=eyhn.vscode-vibrancy).
        2. Press {% kbd shift %} {% kbd command %} {% kbd P %} (macOS) / {% kbd F1 %} (windows) to show all commands.
        3. Activate command "Reload Vibrancy"
        4. Restart VS Code

        Notice that every time after Code is updated, please re-enable vibrancy.

        ## External links

        - [Vibrancy](https://github.com/EYHN/vscode-vibrancy)
        """
        let parser = MarkdownParser()
        _text = State(initialValue: parser.html(from: markdown))
    }
    
    //Test end
    
    
    
    var setLanguageEnSelected = NotificationCenter.default.publisher(for: .setLanguageEn).receive(on: RunLoop.main)
    var setLanguageZhCNSelected = NotificationCenter.default.publisher(for: .setLanguageZhCN).receive(on: RunLoop.main)
    var setLanguageZhTWSelected = NotificationCenter.default.publisher(for: .setLanguageZhTW).receive(on: RunLoop.main)
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: PostView(language: self.showView.lang), tag: 1, selection: self.$showView.showView) {
                    Label(T.me(t: "Post", language: self.showView.lang), systemImage: "square.and.pencil")
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
            .frame(minWidth: 150, idealWidth: 150, maxWidth: 250, minHeight: 400, maxHeight: .infinity)
        }
        .toolbar {
            ToolbarItem(placement: .status) {
                VStack(alignment: .leading) {
                    Text("Version \(Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String)")
                    Text(T.me(t: "Current language: ", language: self.showView.lang) + T.me(t: self.showView.lang, language: self.showView.lang))
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
