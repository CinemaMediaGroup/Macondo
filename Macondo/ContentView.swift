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
                NavigationLink(destination: LinkView(language: self.showView.lang), tag: 2, selection: self.$showView.showView){
                    Label(T.me(t: "Link", language: self.showView.lang), systemImage: "link")
                }
                NavigationLink(destination: BookView(language: self.showView.lang), tag: 3, selection: self.$showView.showView){
                    Label(T.me(t: "Book", language: self.showView.lang), systemImage: "book")
                }
                NavigationLink(destination: AnimeView(language: self.showView.lang), tag: 4, selection: self.$showView.showView){
                    Label(T.me(t: "Anime", language: self.showView.lang), systemImage: "airplayvideo")
                }
                NavigationLink(destination: VideoView(language: self.showView.lang), tag: 5, selection: self.$showView.showView){
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
            ToolbarItem(placement: .status){
                VStack(alignment: .leading){
                    Text("Version \(Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String)")
                    Text(T.me(t: "Current language: ", language: self.showView.lang) + T.me(t: self.showView.lang, language: self.showView.lang))
                }
            }
        }
    }
}

struct PostView : View {
    @EnvironmentObject var showView : ViewNavigation
    var pds : [PostData] = [PostData]()
    var lang : String
    
    init(language : String) {
        pds = Sqlite.getPostList(language: language)
        lang = language
    }
    
    var body: some View {
        NavigationView{
            List(pds, id: \.self) { (pd)  in
                NavigationLink(destination: EditPostView(cid: pd.getCid(),language: self.showView.lang)){
                    VStack(alignment: .leading){
                        Text(pd.getTitle()).font(.headline)
                        Text(pd.getSummary()).font(.body)
                        //Divider()
                    }
                    .padding(.vertical, 8)
                }
                //.aspectRatio(contentMode: .fit)
            }
            //.listStyle(SidebarListStyle())
            .listStyle(InsetListStyle())
            
            .frame(minWidth: 200, idealWidth: 350, maxWidth: 350, maxHeight: .infinity)
        }
    }
}

struct EditPostView : View{
    @EnvironmentObject var showView : ViewNavigation
    
    @State var title : String = ""
    @State var text : String = ""
    @State var image : String = ""
    @State var summary : String = ""
    @State var category : String = ""
    @State var tag : String = ""
    
    var cid : Int = 0;
    
    init(cid : Int,language : String){
        let pd : PostData = Sqlite.getPostData(cidd: cid,language: language)
        self.cid = cid
        _title = State(initialValue: pd.getTitle())
        _text = State(initialValue: pd.getText())
        _image = State(initialValue: pd.getThumbUrl())
        _summary = State(initialValue: pd.getSummary())
        _category = State(initialValue: pd.getCategory())
        _tag = State(initialValue: pd.getTag())
        

        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach { key in
            defaults.removeObject(forKey: key)
        }
    }
    
    var body : some View {
        VStack{
            HStack{
                VStack{
                    TextField(T.me(t: "Add title", language: self.showView.lang),text: $title)
                    TextEditor(text: $text)
                }
                VStack{
                    HStack{
                        Text(T.me(t: "Category: ", language: self.showView.lang))
                        TextField("", text: $category)
                    }
                    HStack{
                        Text(T.me(t: "Tag: ", language: self.showView.lang))
                        TextField("", text: $tag)
                    }
                    Text(T.me(t: "Custom YAML", language: self.showView.lang))
                    TextEditor(text: $image)
                }
            }
            HStack{
                Text(T.me(t: "Summary: ", language: self.showView.lang))
                TextField("",text: $summary)
            }
            Spacer()
            HStack{
                Button(action: {
                    self.showView.showView = 0
                }){
                    Text(T.me(t: "Cancel", language: self.showView.lang))
                }
                
                Button(action: {
                    Sqlite.deletePost(cidd: self.cid,language: self.showView.lang)
                    self.showView.showView = 0
                }){
                    Text(T.me(t: "Delete", language: self.showView.lang))
                    .foregroundColor(Color.red)
                    .bold()
                }
                
                Button(action:{
                    Sqlite.editPost(cidd: self.cid,title: self.title, text: self.text, thumbUrl: self.image, summary: self.summary, category: self.category, tag: self.tag,language: self.showView.lang)
                    self.showView.showView = 0
                }){
                    Text(T.me(t: "Update", language: self.showView.lang))
                }.disabled(title.isEmpty || text.isEmpty || summary.isEmpty)
            }
            Spacer()
        }
        .padding()
    }
}

struct LinkView : View{
    var lds : [LinksData] = [LinksData]()
    var lang : String
    
    init(language : String){
        lds = Sqlite.getLinkList(language: language)
        lang = language
    }
    
    var body: some View {
        NavigationView{
            List(lds, id: \.self) { (ld)  in
                NavigationLink(destination: EditLinkView(lid: ld.getLid(),language: self.lang)){
                    Text(ld.getName())
                }
            }
            .listStyle(SidebarListStyle())
            .frame(minWidth: 160, idealWidth: 160, maxWidth: 350, maxHeight: .infinity)
        }
    }
}

struct EditLinkView : View{
    @EnvironmentObject var showView : ViewNavigation
    
    @State var name : String = ""
    @State var url : String = ""
    @State var image : String = ""
    @State var description : String = ""
    
    var lid : Int = 0;
    
    init(lid : Int,language : String){
        let ld : LinksData = Sqlite.getLinkData(lidd: lid,language: language)
        self.lid = lid
        _name = State(initialValue: ld.getName())
        _url = State(initialValue: ld.getUrl())
        _image = State(initialValue: ld.getImage())
        _description = State(initialValue: ld.getDescription())
    }
    
    var body : some View {
        VStack{
            TextField(T.me(t: "Name", language: self.showView.lang),text: $name)
            TextField(T.me(t: "Link", language: self.showView.lang),text: $url)
            TextField(T.me(t: "Thumb Url", language: self.showView.lang),text: $image)
            TextField(T.me(t: "Description", language: self.showView.lang),text: $description)
            
            Spacer()
            HStack{
                Button(action: {
                    self.showView.showView = 0
                }){
                    Text(T.me(t: "Cancel", language: self.showView.lang))
                }
                
                Button(action: {
                    Sqlite.deleteLink(lidd: self.lid,language: self.showView.lang)
                    self.showView.showView = 0
                }){
                    Text(T.me(t: "Delete", language: self.showView.lang))
                    .foregroundColor(Color.red)
                    .bold()
                }
                
                Button(action:{
                    Sqlite.editLink(lidd: self.lid,name: self.name,url: self.url,image: self.image,description: self.description,language: self.showView.lang)
                    self.showView.showView = 0
                }){
                    Text(T.me(t: "Update", language: self.showView.lang))
                }.disabled(name.isEmpty || url.isEmpty || image.isEmpty || description.isEmpty)
            }
            Spacer()
        }
        .padding()
    }
}

struct BookView : View{
    var bds : [BookData] = [BookData]()
    var lang : String
    
    init(language : String){
        bds = Sqlite.getBookList(language: language)
        lang = language
    }

    var body: some View {
        NavigationView{
            List(bds, id: \.self) { (bd)  in
                NavigationLink(destination: EditBookView(bid: bd.getBid(),language: self.lang)){
                    Text(bd.getName())
                }
            }
            .listStyle(SidebarListStyle())
            .frame(minWidth: 160, idealWidth: 160, maxWidth: 350, maxHeight: .infinity)
        }
    }
}

struct EditBookView : View{
    @EnvironmentObject var showView : ViewNavigation
    
    @State var name : String = ""
    @State var isbn : String = ""
    @State var lsbn : String = ""
    @State var image : String = ""
    
    var bid : Int = 0
    
    init(bid : Int,language : String){
        let bd : BookData = Sqlite.getBookData(bidd: bid,language: language)
        self.bid = bid
        _name = State(initialValue: bd.getName())
        _isbn = State(initialValue: bd.getISBN())
        _lsbn = State(initialValue: bd.getLSBN())
        _image = State(initialValue: bd.getImage())
    }
    
    var body : some View {
        VStack{
            TextField(T.me(t: "Name", language: self.showView.lang),text: $name)
            TextField("ISBN",text: $isbn)
            TextField("LSBN",text: $lsbn)
            TextField(T.me(t: "Thumb Url", language: self.showView.lang),text: $image)
            
            Spacer()
            HStack{
                Button(action: {
                    self.showView.showView = 0
                }){
                    Text(T.me(t: "Cancel", language: self.showView.lang))
                }
                
                Button(action: {
                    Sqlite.deleteBook(bidd: self.bid,language: self.showView.lang)
                    self.showView.showView = 0
                }){
                    Text(T.me(t: "Delete", language: self.showView.lang))
                    .foregroundColor(Color.red)
                    .bold()
                }
                
                Button(action:{
                    Sqlite.editBook(bidd: self.bid,name: self.name,isbn: self.isbn,lsbn: self.lsbn,image: self.image,language: self.showView.lang)
                    self.showView.showView = 0
                }){
                    Text(T.me(t: "Update", language: self.showView.lang))
                }.disabled(name.isEmpty || isbn.isEmpty || lsbn.isEmpty || image.isEmpty)
            }
            Spacer()
        }
        .padding()
    }
}

struct AnimeView : View{
    var ads : [AnimeData] = [AnimeData]()
    var lang : String
    
    init(language : String){
        ads = Sqlite.getAnimeList(language: language)
        lang = language
    }
    
    var body: some View {
        NavigationView{
            List(ads, id: \.self) { (ad)  in
                NavigationLink(destination: EditAnimeView(aid: ad.getAid(),language: self.lang)){
                    Text(ad.getNameZH())
                }
            }
            .listStyle(SidebarListStyle())
            .frame(minWidth: 160, idealWidth: 160, maxWidth: 350, maxHeight: .infinity)
        }
    }
}

struct EditAnimeView : View{
    @EnvironmentObject var showView : ViewNavigation
    
    @State var nameJA : String = ""
    @State var nameZH : String = ""
    @State var image : String = ""
    
    var aid : Int = 0
    
    init(aid : Int,language : String){
        let ad : AnimeData = Sqlite.getAnimeData(aidd: aid,language: language)
        self.aid = aid
        _nameJA = State(initialValue: ad.getNameJA())
        _nameZH = State(initialValue: ad.getNameZH())
        _image = State(initialValue: ad.getImage())
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
                    Sqlite.deleteAnime(aidd: self.aid,language: self.showView.lang)
                    self.showView.showView = 0
                }){
                    Text(T.me(t: "Delete", language: self.showView.lang))
                    .foregroundColor(Color.red)
                    .bold()
                }
                
                Button(action:{
                    Sqlite.editAnime(aidd: self.aid,nameJA: self.nameJA,nameZH: self.nameZH,image: self.image,language: self.showView.lang)
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

struct VideoView : View{
    @EnvironmentObject var showView : ViewNavigation
    
    var vds : [VideoData] = [VideoData]()
    var lang : String
    
    init(language : String){
        vds = Sqlite.getVideoList(language: language)
        lang = language
    }
    
    var body: some View {
        NavigationView{
            List(vds, id: \.self) { (vd)  in
                NavigationLink(destination: EditVideoView(vid: vd.getVid(),language: self.lang)){
                    Text(vd.getNameZH())
                }
            }
            .listStyle(SidebarListStyle())
            .frame(minWidth: 160, idealWidth: 160, maxWidth: 350, maxHeight: .infinity)
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
