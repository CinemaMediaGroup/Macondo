//
//  ContentView.swift
//  Macondo
//
//  Created by Louis Joe Shen on 2020/7/12.
//  Copyright © 2020 Louise Joe Shen. All rights reserved.
//

import SwiftUI
import Preferences

class ViewNavigation: ObservableObject {
    @Published var showView = 0
    @State var setting : Bool = false
}

struct ContentView: View {
    @EnvironmentObject var showView : ViewNavigation
    
    /*
        0 -> MainView
        1 -> NewPostView
        2 -> ManagePostView
        3 -> NewPageView
        4 -> ManagePageView
        5 -> NewCategoryView
        6 -> ManageCategoryView
        7 -> NewTagView
        8 -> ManageTagView
        9 -> NewLinkView
       10 -> ManageLinkView
       11 -> NewBookView
       12 -> ManageBookView
       13 -> NewAnimeView
       14 -> ManageAnimeView
       15 -> NewVideoView
       16 -> ManageVideoView
     */
    
    var body: some View {
        //NavigationView{
        ZStack{
            if self.showView.showView == 0 {
                MainView()
            }else if self.showView.showView == 1{
                NewPostView()
            }else if self.showView.showView == 2{
                ManagePostView()
            }else if self.showView.showView == 3{
                NewPageView()
            }else if self.showView.showView == 4{
                ManagePageView()
            }else if self.showView.showView == 5{
                NewCategoryView()
            }else if self.showView.showView == 6{
                ManageCategoryView()
            }else if self.showView.showView == 7{
                NewTagView()
            }else if self.showView.showView == 8{
                ManageTagView()
            }else if self.showView.showView == 9{
                NewLinkView()
            }else if self.showView.showView == 10{
                ManageLinkView()
            }else if self.showView.showView == 11{
                NewBookView()
            }else if self.showView.showView == 12{
                ManageBookView()
            }else if self.showView.showView == 13{
                NewAnimeView()
            }else if self.showView.showView == 14{
                ManageAnimeView()
            }else if self.showView.showView == 15{
                NewVideoView()
            }else if self.showView.showView == 16{
                ManageVideoView()
            }else if self.showView.showView == 17{
                PreferencesView()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MainView : View{
    @EnvironmentObject var showView : ViewNavigation
    
    var body : some View{
        VStack{
            VStack{
                Image("logo").resizable().frame(width: 128,height: 128)
                Text("Welcome to Macondo")
                    .font(.largeTitle)
                    .fontWeight(.thin)
                Text("Version 1.1")
                    .font(.headline)
                    .fontWeight(.thin)
                    .foregroundColor(Color.gray)
            }
            .padding()
            HStack{
                //For new
                VStack(alignment: .leading){
                    Button(action:{
                        self.showView.showView = 1
                    }){
                        HStack{
                            Image("newPost")
                                .resizable()
                                .frame(width:32,height: 32)
                            VStack(alignment: .leading){
                                Text("Get started with a post")
                                    .fontWeight(.bold)
                                Text("Create a post quickly and easily")
                                    .fontWeight(.thin)
                            }
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    /*Button(action: {
                        self.showView.showView = 3
                    }){
                        HStack{
                            Image("newPage").resizable().frame(width:32,height: 32)
                            Text("Create a new page")
                                .fontWeight(.bold)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    Button(action: {
                        self.showView.showView = 5
                    }){
                        HStack{
                            Image("newCategory").resizable().frame(width:32,height: 32)
                            Text("Create a new category")
                                .fontWeight(.bold)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    Button(action: {
                        self.showView.showView = 7
                    }){
                        HStack{
                            Image("newTag").resizable().frame(width:32,height: 32)
                            Text("Create a new tag")
                                .fontWeight(.bold)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())*/
                    Button(action: {
                        self.showView.showView = 9
                    }){
                        HStack{
                            Image("newLink").resizable().frame(width:32,height: 32)
                            Text("Create a new link")
                                .fontWeight(.bold)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    Button(action:{
                        self.showView.showView = 11
                    }){
                        HStack{
                            Image("newBook").resizable().frame(width:32,height: 32)
                            Text("Create a new book-reading")
                                .fontWeight(.bold)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    Button(action: {
                        self.showView.showView = 13
                    }){
                        HStack{
                            Image("newAnime").resizable().frame(width:32,height: 32)
                            Text("Create a new anime-watching")
                                .fontWeight(.bold)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    Button(action: {
                        self.showView.showView = 15
                    }){
                        HStack{
                            Image("newVideo").resizable().frame(width:32,height: 32)
                            Text("Create a new film-watching")
                                .fontWeight(.bold)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                
                //For edit
                VStack(alignment: .leading){
                    Button(action: {
                        self.showView.showView = 2
                    }){
                        HStack{
                            Image("newPost")
                                .resizable()
                                .frame(width:32,height: 32)
                            VStack(alignment: .leading){
                                Text("Edit posts")
                                    .fontWeight(.bold)
                            }
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    /*Button(action: {
                        self.showView.showView = 4
                    }){
                        HStack{
                            Image("newPage").resizable().frame(width:32,height: 32)
                            Text("Edit pages")
                                .fontWeight(.bold)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    Button(action: {
                        self.showView.showView = 6
                    }){
                        HStack{
                            Image("newCategory").resizable().frame(width:32,height: 32)
                            Text("Edit categories")
                                .fontWeight(.bold)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    Button(action: {
                        self.showView.showView = 8
                    }){
                        HStack{
                            Image("newTag").resizable().frame(width:32,height: 32)
                            Text("Edit tags")
                                .fontWeight(.bold)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())*/
                    Button(action: {
                        self.showView.showView = 10
                    }){
                        HStack{
                            Image("newLink").resizable().frame(width:32,height: 32)
                            Text("Edit links")
                                .fontWeight(.bold)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    Button(action: {
                        self.showView.showView = 12
                    }){
                        HStack{
                            Image("newBook").resizable().frame(width:32,height: 32)
                            Text("Edit book-readings")
                                .fontWeight(.bold)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    Button(action: {
                        self.showView.showView = 14
                    }){
                        HStack{
                            Image("newAnime").resizable().frame(width:32,height: 32)
                            Text("Edit anime-watchings")
                                .fontWeight(.bold)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    Button(action: {
                        self.showView.showView = 16
                    }){
                        HStack{
                            Image("newVideo").resizable().frame(width:32,height: 32)
                            Text("Edit film-watchings")
                                .fontWeight(.bold)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding()
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct NewPostView : View{
    @EnvironmentObject var showView : ViewNavigation
    
    @State var title : String = ""
    @State var text : String = ""
    @State var image : String = ""
    @State var summary : String = ""
    @State var category : String = ""
    @State var tag : String = ""
    var body : some View {
        VStack{
            HStack{
                VStack{
                    TextField("Add title",text: $title)
                    TextField("Start writing or type",text: $text)
                }
                VStack{
                    Text("Category(split by ','): ")
                    TextField("",text: $category)
                    Text("Tag(split by ','): ")
                    TextField("",text: $tag)
                }
            }
            HStack{
                Text("Thumb Url: ")
                TextField("",text: $image)
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
                
                Button(action:{
                    Sqlite.newPost(title: self.title, text: self.text, thumbUrl: self.image, summary: self.summary, category: self.category, tag: self.tag)
                    self.showView.showView = 0
                }){
                    Text("Publish")
                }.disabled(title.isEmpty || text.isEmpty || image.isEmpty || summary.isEmpty)
            }
        }
        .padding()
    }
}

struct EditPostView : View{
     @EnvironmentObject var showView : ViewNavigation
    
    @State var title : String
    @State var text : String
    @State var image : String
    @State var summary : String
    @State var category : String
    @State var tag : String
    
    var cid : Int = 0;
    
    init(cid : Int){
        let pd : PostData = Sqlite.getPostData(cidd: cid)
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
                    ScrollView{
                        TextField("Start writing or type",text: $text)
                    }
                }
                VStack{
                    Text("Category(split by ','): ")
                    TextField("",text: $category)
                    Text("Tag(split by ','): ")
                    TextField("",text: $tag)
                }
            }
            HStack{
                Text("Thumb Url: ")
                TextField("",text: $image)
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
                
                Button(action:{
                    Sqlite.editPost(cidd: self.cid,title: self.title, text: self.text, thumbUrl: self.image, summary: self.summary, category: self.category, tag: self.tag)
                    self.showView.showView = 0
                }){
                    Text("Update")
                }.disabled(title.isEmpty || text.isEmpty || image.isEmpty || summary.isEmpty)
            }
            Spacer()
        }
        .padding()
    }
}

struct ManagePostView : View{
    
    var pds = Sqlite.getPostList()
    var body: some View {
        NavigationView{
            HStack{
                List(pds, id: \.self) { (pd)  in
                    NavigationLink(destination: EditPostView(cid: pd.getCid())){
                        Text(pd.getTitle())
                    }
                }
                Spacer()
            }
        }
    }
}

struct NewPageView : View{
    @EnvironmentObject var showView : ViewNavigation
    
    @State var title : String = ""
    @State var text : String = ""
    @State var image : String = ""
    @State var summary : String = ""
    @State var category : String = ""
    @State var tag : String = ""
    var body : some View {
        VStack{
            HStack{
                VStack{
                    TextField("Add title",text: $title)
                    TextField("Start writing or type",text: $text)
                }
                VStack{
                    Text("Category(split by ','): ")
                    TextField("",text: $category)
                    Text("Tag(split by ','): ")
                    TextField("",text: $tag)
                }
            }
            HStack{
                Text("Thumb Url: ")
                TextField("",text: $image)
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
                
                Button(action:{
                    Sqlite.newPage(title: self.title, text: self.text, thumbUrl: self.image, summary: self.summary, category: self.category, tag: self.tag)
                    self.showView.showView = 0
                }){
                    Text("Publish")
                }.disabled(title.isEmpty || text.isEmpty || image.isEmpty || summary.isEmpty)
            }
        }
        .padding()
    }
}

struct ManagePageView : View{
    var pds = Sqlite.getPageList()
    var body: some View {
        NavigationView{
            HStack{
                List(pds, id: \.self) { (pd)  in
                    NavigationLink(destination: EditPageView(cid: pd.getCid())){
                        Text(pd.getTitle())
                    }
                }
                Spacer()
            }
        }
    }
}

struct EditPageView : View{
    @EnvironmentObject var showView : ViewNavigation
    
    @State var title : String
    @State var text : String
    @State var image : String
    @State var summary : String
    @State var category : String
    @State var tag : String
    
    var cid : Int = 0;
    
    init(cid : Int){
        let pd : PostData = Sqlite.getPostData(cidd: cid)
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
                    TextField("Start writing or type",text: $text)
                }
                VStack{
                    Text("Category(split by ','): ")
                    TextField("",text: $category)
                    Text("Tag(split by ','): ")
                    TextField("",text: $tag)
                }
            }
            HStack{
                Text("Thumb Url: ")
                TextField("",text: $image)
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
                
                Button(action:{
                    Sqlite.editPage(cidd: self.cid,title: self.title, text: self.text, thumbUrl: self.image, summary: self.summary, category: self.category, tag: self.tag)
                    self.showView.showView = 0
                }){
                    Text("Update")
                }.disabled(title.isEmpty || text.isEmpty || image.isEmpty || summary.isEmpty)
            }
            Spacer()
        }
        .padding()
    }
}

struct NewCategoryView : View{
    @EnvironmentObject var showView : ViewNavigation
    
    @State var text : String = ""
    var body : some View {
        VStack{
            TextField("Name",text: $text)
            HStack{
                Button(action: {
                    self.showView.showView = 0
                }){
                    Text("Cancel")
                }
                
                Button(action:{
                    Sqlite.newCategory(name: self.text)
                    self.showView.showView = 0
                }){
                    Text("Publish")
                }.disabled(text.isEmpty)
            }
        }
        .padding()
    }
}

struct ManageCategoryView : View{
    var mds = Sqlite.getCategoryList()
    var body: some View {
        NavigationView{
            HStack{
                List(mds, id: \.self) { (md)  in
                    NavigationLink(destination: EditCategoryView(mid: md.getMid())){
                        Text(md.getName())
                    }
                }
                Spacer()
            }
        }
    }
}

struct EditCategoryView : View{
    @EnvironmentObject var showView : ViewNavigation
    
    @State var text : String
    
    var mid : Int = 0;
    
    init(mid : Int){
        let md : MetaData = Sqlite.getMetaData(midd: mid)
        self.mid = mid
        _text = State(initialValue: md.getName())
    }
    
    var body : some View {
        VStack{
            TextField("Name",text: $text)

            Spacer()
            HStack{
                Button(action: {
                    self.showView.showView = 0
                }){
                    Text("Cancel")
                }
                
                Button(action:{
                    Sqlite.editCategory(midd: self.mid,name: self.text)
                    self.showView.showView = 0
                }){
                    Text("Update")
                }.disabled(text.isEmpty)
            }
            Spacer()
        }
        .padding()
    }
}

struct NewTagView : View{
    @EnvironmentObject var showView : ViewNavigation
    
    @State var text : String = ""
    var body : some View {
        VStack{
            TextField("Name",text: $text)
            HStack{
                Button(action: {
                    self.showView.showView = 0
                }){
                    Text("Cancel")
                }
                
                Button(action:{
                    Sqlite.newTag(name: self.text)
                    self.showView.showView = 0
                }){
                    Text("Publish")
                }.disabled(text.isEmpty)
            }
        }
        .padding()
    }
}

struct ManageTagView : View{
    var mds = Sqlite.getTagList()
    var body: some View {
        NavigationView{
            HStack{
                List(mds, id: \.self) { (md)  in
                    NavigationLink(destination: EditTagView(mid: md.getMid())){
                        Text(md.getName())
                    }
                }
                Spacer()
            }
        }
    }
}

struct EditTagView : View{
    @EnvironmentObject var showView : ViewNavigation
    
    @State var text : String
    
    var mid : Int = 0;
    
    init(mid : Int){
        let md : MetaData = Sqlite.getMetaData(midd: mid)
        self.mid = mid
        _text = State(initialValue: md.getName())
    }
    
    var body : some View {
        VStack{
            TextField("Name",text: $text)

            Spacer()
            HStack{
                Button(action: {
                    self.showView.showView = 0
                }){
                    Text("Cancel")
                }
                
                Button(action:{
                    Sqlite.editTag(midd: self.mid,name: self.text)
                    self.showView.showView = 0
                }){
                    Text("Update")
                }.disabled(text.isEmpty)
            }
            Spacer()
        }
        .padding()
    }
}


struct NewLinkView : View{
    @EnvironmentObject var showView : ViewNavigation
    
    @State var name : String = ""
    @State var url : String = ""
    @State var image : String = ""
    @State var description : String = ""
    
    var body : some View {
        VStack{
            TextField("Name",text: $name)
            TextField("Link",text: $url)
            TextField("Thumb Url",text: $image)
            TextField("Description",text: $description)
            
            HStack{
                Button(action: {
                    self.showView.showView = 0
                }){
                    Text("Cancel")
                }
                
                Button(action:{
                    Sqlite.newLink(name: self.name,url: self.url,image: self.image,description: self.description)
                    self.showView.showView = 0
                }){
                    Text("Publish")
                }.disabled(name.isEmpty || url.isEmpty || image.isEmpty || description.isEmpty)
            }
        }
        .padding()
    }
}

struct ManageLinkView : View{
    var lds = Sqlite.getLinkList()
    var body: some View {
        NavigationView{
            HStack{
                List(lds, id: \.self) { (ld)  in
                    NavigationLink(destination: EditLinkView(lid: ld.getLid())){
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
    
    init(lid : Int){
        let ld : LinksData = Sqlite.getLinkData(lidd: lid)
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
                    Sqlite.editLink(lidd: self.lid,name: self.name,url: self.url,image: self.image,description: self.description)
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

struct NewBookView : View{
    @EnvironmentObject var showView : ViewNavigation
    
    @State var name : String = ""
    @State var isbn : String = ""
    @State var lsbn : String = ""
    @State var image : String = ""
    
    var body : some View {
        VStack{
            TextField("Name",text: $name)
            TextField("ISBN",text: $isbn)
            TextField("LSBN",text: $lsbn)
            TextField("Thumb Url",text: $image)
            
            HStack{
                Button(action: {
                    self.showView.showView = 0
                }){
                    Text("Cancel")
                }
                
                Button(action:{
                    Sqlite.newBook(name: self.name,isbn: self.isbn,lsbn: self.lsbn,image: self.image)
                    self.showView.showView = 0
                }){
                    Text("Publish")
                }.disabled(name.isEmpty || isbn.isEmpty || lsbn.isEmpty || image.isEmpty)
            }
        }
        .padding()
    }
}

struct ManageBookView : View{
    var bds = Sqlite.getBookList()
    var body: some View {
        NavigationView{
            HStack{
                List(bds, id: \.self) { (bd)  in
                    NavigationLink(destination: EditBookView(bid: bd.getBid())){
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
    
    var bid : Int = 0;
    
    init(bid : Int){
        let bd : BookData = Sqlite.getBookData(bidd: bid)
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
                    Sqlite.editBook(bidd: self.bid,name: self.name,isbn: self.isbn,lsbn: self.lsbn,image: self.image)
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

struct NewAnimeView : View{
    @EnvironmentObject var showView : ViewNavigation
    
    @State var nameJA : String = ""
    @State var nameZH : String = ""
    @State var image : String = ""
    
    var body : some View {
        VStack{
            TextField("Japanese Name",text: $nameJA)
            TextField("Chinese Name",text: $nameZH)
            TextField("Thumb Url",text: $image)
            
            HStack{
                Button(action: {
                    self.showView.showView = 0
                }){
                    Text("Cancel")
                }
                
                Button(action:{
                    Sqlite.newAnime(nameJA: self.nameJA,nameZH: self.nameZH,image: self.image)
                    self.showView.showView = 0
                }){
                    Text("Publish")
                }.disabled(nameJA.isEmpty || nameZH.isEmpty || image.isEmpty)
            }
        }
        .padding()
    }
}

struct ManageAnimeView : View{
    var ads = Sqlite.getAnimeList()
    var body: some View {
        NavigationView{
            HStack{
                List(ads, id: \.self) { (ad)  in
                    NavigationLink(destination: EditAnimeView(aid: ad.getAid())){
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
    
    var aid : Int = 0;
    
    init(aid : Int){
        let ad : AnimeData = Sqlite.getAnimeData(aidd: aid)
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
                    Sqlite.editAnime(aidd: self.aid,nameJA: self.nameJA,nameZH: self.nameZH,image: self.image)
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

struct NewVideoView : View{
    @EnvironmentObject var showView : ViewNavigation
    
    @State var nameJA : String = ""
    @State var nameZH : String = ""
    @State var image : String = ""
    
    var body : some View {
        VStack{
            TextField("Japanese Name",text: $nameJA)
            TextField("Chinese Name",text: $nameZH)
            TextField("Thumb Url",text: $image)
            
            HStack{
                Button(action: {
                    self.showView.showView = 0
                }){
                    Text("Cancel")
                }
                
                Button(action:{
                    Sqlite.newVideo(nameJA: self.nameJA,nameZH: self.nameZH,image: self.image)
                    self.showView.showView = 0
                }){
                    Text("Publish")
                }.disabled(nameJA.isEmpty || nameZH.isEmpty || image.isEmpty)
            }
        }
        .padding()
    }
}

struct ManageVideoView : View{
    var vds = Sqlite.getVideoList()
    var body: some View {
        NavigationView{
            HStack{
                List(vds, id: \.self) { (vd)  in
                    NavigationLink(destination: EditVideoView(vid: vd.getVid())){
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
    
    init(vid : Int){
        let vd : VideoData = Sqlite.getVideoData(vidd: vid)
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
                    Sqlite.editVideo(vidd: self.vid,nameJA: self.nameJA,nameZH: self.nameZH,image: self.image)
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

let PreferencesPreferenceViewController: () -> PreferencePane = {
    let paneView = Preferences.Pane(
        identifier: .preferences,
        title: "Preferences",
        toolbarIcon: NSImage()
    ) {
        PreferencesView()
    }

    return Preferences.PaneHostingController(pane: paneView)
}

struct PreferencesView: View {
    @State var siteTitle : String = ""
    @State var siteURL : String = ""
    @State var topPosts : String = ""
    @State var user : String = ""
    @State var favicon : String = ""
    @State var icon : String = ""
    @State var avatar : String = ""
    @State var description : String = ""
    private let contentWidth: Double = 450.0

    init(){
        _siteTitle = State(initialValue: Sqlite.getSetting(sidd: 1))
        _siteURL = State(initialValue: Sqlite.getSetting(sidd: 2))
        _topPosts = State(initialValue: Sqlite.getSetting(sidd: 3))
        _user = State(initialValue: Sqlite.getSetting(sidd: 4))
        _favicon = State(initialValue: Sqlite.getSetting(sidd: 5))
        _icon = State(initialValue: Sqlite.getSetting(sidd: 6))
        _avatar = State(initialValue: Sqlite.getSetting(sidd: 7))
        _description = State(initialValue: Sqlite.getSetting(sidd: 8))
    }
    
    var body: some View {
        Preferences.Container(contentWidth: contentWidth) {
            Preferences.Section(title: "Site title:") {
                TextField("", text: self.$siteTitle)
            }
            Preferences.Section(title: "Site URL:") {
                TextField("", text: self.$siteURL)
            }
            Preferences.Section(title: "Top posts:") {
                TextField("", text: self.$topPosts)
            }
            Preferences.Section(title: "User:") {
                TextField("", text: self.$user)
            }
            Preferences.Section(title: "Favicon:") {
                TextField("", text: self.$favicon)
            }
            Preferences.Section(title: "Icon:") {
                TextField("", text: self.$icon)
            }
            Preferences.Section(title: "Avatar:") {
                TextField("", text: self.$avatar)
            }
            Preferences.Section(title: "Description:") {
                TextField("", text: self.$description)
            }
            Preferences.Section(title: "") {
                Button(action:{
                    Sqlite.editSetting(sidd: 1,field: self.siteTitle)
                    Sqlite.editSetting(sidd: 2, field: self.siteURL)
                    Sqlite.editSetting(sidd: 3, field: self.topPosts)
                    Sqlite.editSetting(sidd: 4, field: self.user)
                    Sqlite.editSetting(sidd: 5, field: self.favicon)
                    Sqlite.editSetting(sidd: 6, field: self.icon)
                    Sqlite.editSetting(sidd: 7, field: self.avatar)
                    Sqlite.editSetting(sidd: 8, field: self.description)
                }){
                    Text("Save")
                }
            }
        }
        .padding()
    }
}
