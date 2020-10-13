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
                    ListRowView(icon: "square.and.pencil", title: "Post")
                }
                NavigationLink(destination: LinkView(language: self.showView.lang), tag: 2, selection: self.$showView.showView){
                    ListRowView(icon: "link", title: "Link")
                }
                NavigationLink(destination: BookView(language: self.showView.lang), tag: 3, selection: self.$showView.showView){
                    ListRowView(icon: "book", title: "Book")
                }
                NavigationLink(destination: AnimeView(language: self.showView.lang), tag: 4, selection: self.$showView.showView){
                    ListRowView(icon: "airplayvideo", title: "Anime")
                }
                NavigationLink(destination: VideoView(language: self.showView.lang), tag: 5, selection: self.$showView.showView){
                    ListRowView(icon: "film", title: "Video")
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
                VStack{
                    Text("Version \(Bundle.main.infoDictionary!["CFBundleShortVersionString"] as! String)")
                    Text("Current language: " + self.showView.lang)
                }
            }
        }
    }
}

struct ListRowView : View {
    let icon : String
    let title : String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .resizable()
                .frame(width: 16,height: 16)
                
            Text(title)
                .font(.headline)
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
            HStack{
                List(pds, id: \.self) { (pd)  in
                    NavigationLink(destination: EditPostView(cid: pd.getCid(),language: self.showView.lang)){
                        Text(pd.getTitle())
                    }
                }
                Spacer()
            }
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
    }
    
    var body : some View {
        VStack{
            HStack{
                VStack{
                    TextField("Add title",text: $title)
                    TextEditor(text: $text)
                }
                VStack{
                    HStack{
                        Text("Category: ")
                        TextField("", text: $category)
                    }
                    HStack{
                        Text("Tag: ")
                        TextField("", text: $tag)
                    }
                    Text("Custom YAML")
                    TextEditor(text: $image)
                }
            }
            HStack{
                Text("Summary: ")
                TextField("",text: $summary)
            }
            Spacer()
            HStack{
                Button(action: {
                    self.showView.showView = 0
                }){
                    Text("Cancel")
                }
                
                Button(action: {
                    Sqlite.deletePost(cidd: self.cid,language: self.showView.lang)
                    self.showView.showView = 0
                }){
                    Text("Delete")
                    .foregroundColor(Color.red)
                    .bold()
                }
                
                Button(action:{
                    Sqlite.editPost(cidd: self.cid,title: self.title, text: self.text, thumbUrl: self.image, summary: self.summary, category: self.category, tag: self.tag,language: self.showView.lang)
                    self.showView.showView = 0
                }){
                    Text("Update")
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
            HStack{
                List(lds, id: \.self) { (ld)  in
                    NavigationLink(destination: EditLinkView(lid: ld.getLid(),language: self.lang)){
                        Text(ld.getName())
                    }
                }
                Spacer()
            }
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
            TextField("Name",text: $name)
            TextField("Link",text: $url)
            TextField("Thumb Url",text: $image)
            TextField("Description",text: $description)
            
            Spacer()
            HStack{
                Button(action: {
                    self.showView.showView = 0
                }){
                    Text("Cancel")
                }
                
                Button(action:{
                    Sqlite.editLink(lidd: self.lid,name: self.name,url: self.url,image: self.image,description: self.description,language: self.showView.lang)
                    self.showView.showView = 0
                }){
                    Text("Update")
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
            HStack{
                List(bds, id: \.self) { (bd)  in
                    NavigationLink(destination: EditBookView(bid: bd.getBid(),language: self.lang)){
                        Text(bd.getName())
                    }
                }
                Spacer()
            }
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
            TextField("Name",text: $name)
            TextField("ISBN",text: $isbn)
            TextField("LSBN",text: $lsbn)
            TextField("Thumb Url",text: $image)
            
            Spacer()
            HStack{
                Button(action: {
                    self.showView.showView = 0
                }){
                    Text("Cancel")
                }
                
                Button(action:{
                    Sqlite.editBook(bidd: self.bid,name: self.name,isbn: self.isbn,lsbn: self.lsbn,image: self.image,language: self.showView.lang)
                    self.showView.showView = 0
                }){
                    Text("Update")
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
            HStack{
                List(ads, id: \.self) { (ad)  in
                    NavigationLink(destination: EditAnimeView(aid: ad.getAid(),language: self.lang)){
                        Text(ad.getNameZH())
                    }
                }
                Spacer()
            }
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
            TextField("Japanese Name",text: $nameJA)
            TextField("Chinese Name",text: $nameZH)
            TextField("Thumb Url",text: $image)
            
            Spacer()
            HStack{
                Button(action: {
                    self.showView.showView = 0
                }){
                    Text("Cancel")
                }
                
                Button(action:{
                    Sqlite.editAnime(aidd: self.aid,nameJA: self.nameJA,nameZH: self.nameZH,image: self.image,language: self.showView.lang)
                    self.showView.showView = 0
                }){
                    Text("Update")
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
            HStack{
                List(vds, id: \.self) { (vd)  in
                    NavigationLink(destination: EditVideoView(vid: vd.getVid(),language: self.lang)){
                        Text(vd.getNameZH())
                    }
                }
                Spacer()
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
            TextField("Japanese Name",text: $nameJA)
            TextField("Chinese Name",text: $nameZH)
            TextField("Thumb Url",text: $image)
            
            Spacer()
            HStack{
                Button(action: {
                    self.showView.showView = 0
                }){
                    Text("Cancel")
                }
                
                Button(action:{
                    Sqlite.editVideo(vidd: self.vid,nameJA: self.nameJA,nameZH: self.nameZH,image: self.image,language: self.showView.lang)
                    self.showView.showView = 0
                }){
                    Text("Update")
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
