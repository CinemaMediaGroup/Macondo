//
//  ContentView.swift
//  Macondo
//
//  Created by Louis Joe Shen on 2020/7/12.
//  Copyright © 2020 Louise Joe Shen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
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
                        NavigationLink(destination: NewPostView()){
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
                        NavigationLink(destination: EditPostView()){
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
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct NewPostView : View{
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
                    
                }){
                    Text("Cancel")
                }.disabled(true)
                
                Button(action:{
                    Sqlite.newPost(title: self.title, text: self.text, thumbUrl: self.image, summary: self.summary, category: self.category, tag: self.tag)
                }){
                    Text("Publish")
                }.disabled(title.isEmpty || text.isEmpty || image.isEmpty || summary.isEmpty)
            }
        }
        .padding()
    }
}

struct EditPostView : View{
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
                    
                }){
                    Text("Cancel")
                }.disabled(true)
                
                Button(action:{
                    //Sqlite.newPost(title: self.title, text: self.text, thumbUrl: self.image, summary: self.summary, category: self.category, tag: self.tag)
                }){
                    Text("Update")
                }.disabled(title.isEmpty || text.isEmpty || image.isEmpty || summary.isEmpty)
            }
        }
        .padding()
    }
}
