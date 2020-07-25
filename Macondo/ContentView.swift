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
                        
                    }){
                        HStack{
                            Image("newCategory").resizable().frame(width:32,height: 32)
                            Text("Create a new category")
                                .fontWeight(.bold)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    Button(action: {
                        
                    }){
                        HStack{
                            Image("newTag").resizable().frame(width:32,height: 32)
                            Text("Create a new tag")
                                .fontWeight(.bold)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    Button(action: {
                        
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
                        
                    }){
                        HStack{
                            Image("newCategory").resizable().frame(width:32,height: 32)
                            Text("Edit categories")
                                .fontWeight(.bold)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    Button(action: {
                        
                    }){
                        HStack{
                            Image("newTag").resizable().frame(width:32,height: 32)
                            Text("Edit tags")
                                .fontWeight(.bold)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                    Button(action: {
                    
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
        let pd : PostData = Sqlite.getPost(cidd: cid)
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
        let pd : PostData = Sqlite.getPost(cidd: cid)
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
