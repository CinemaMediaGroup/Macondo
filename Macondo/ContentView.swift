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

struct EditVideoView : View{
    @EnvironmentObject var showView : ViewNavigation
    
    @State var nameJA : String = ""
    @State var nameZH : String = ""
    @State var image : String = ""
    
    var vid : Int = 0;
    
    init(vid : Int,language : String){
        let vd : VideoData = Sqlite.getVideoData(vidd: vid,language: language)
        self.vid = vid
        _nameJA = State(initialValue: vd.getNameJA())
        _nameZH = State(initialValue: vd.getNameZH())
        _image = State(initialValue: vd.getImage())
    }
    
    var body : some View {
        VStack{
            TextField(T.me(t: "Japanese Name", language: self.showView.lang),text: $nameJA)
            TextField(T.me(t: "Chinese Name", language: self.showView.lang),text: $nameZH)
            TextField(T.me(t: "Thumb Url", language: self.showView.lang),text: $image)
            
            Spacer()
            HStack{
                Button(action: {
                    self.showView.showView = 0
                }){
                    Text(T.me(t: "Cancel", language: self.showView.lang))
                }
                
                Button(action: {
                    Sqlite.deleteVideo(vidd: self.vid,language: self.showView.lang)
                    self.showView.showView = 0
                }){
                    Text(T.me(t: "Delete", language: self.showView.lang))
                    .foregroundColor(Color.red)
                    .bold()
                }
                
                Button(action:{
                    Sqlite.editVideo(vidd: self.vid,nameJA: self.nameJA,nameZH: self.nameZH,image: self.image,language: self.showView.lang)
                    self.showView.showView = 0
                }){
                    Text(T.me(t: "Update", language: self.showView.lang))
                }.disabled(nameJA.isEmpty || nameZH.isEmpty || image.isEmpty)
            }
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
