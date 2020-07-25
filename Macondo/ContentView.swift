//
//  ContentView.swift
//  Macondo
//
//  Created by Louis Joe Shen on 2020/7/12.
//  Copyright © 2020 Louise Joe Shen. All rights reserved.
//

import SwiftUI

class ViewNavigation: ObservableObject {
    @Published var showView = 0
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
                Text("Version 1.0")
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
                    Button(action: {
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
                    .buttonStyle(PlainButtonStyle())
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
                        
                    }){
                        HStack{
                            Image("newBook").resizable().frame(width:32,height: 32)
                            Text("Create a new book-reading")
                                .fontWeight(.bold)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    Button(action: {
                        
                    }){
                        HStack{
                            Image("newAnime").resizable().frame(width:32,height: 32)
                            Text("Create a new anime-watching")
                                .fontWeight(.bold)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    Button(action: {
                        
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
                    Button(action: {
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
                    .buttonStyle(PlainButtonStyle())
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
                        
                    }){
                        HStack{
                            Image("newBook").resizable().frame(width:32,height: 32)
                            Text("Edit book-readings")
                                .fontWeight(.bold)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    Button(action: {
                        
                    }){
                        HStack{
                            Image("newAnime").resizable().frame(width:32,height: 32)
                            Text("Edit anime-watchings")
                                .fontWeight(.bold)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    Button(action: {
                        
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
