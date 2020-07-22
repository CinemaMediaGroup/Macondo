//
//  ContentView.swift
//  Macondo
//
//  Created by Louis Joe Shen on 2020/7/12.
//  Copyright © 2020 Louise Joe Shen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var isModal : Bool = false
    var body: some View {
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
            VStack(alignment: .leading){
                Button(action:{
                    self.isModal = true
                }) {
                    HStack{
                        Image("newPost").resizable().frame(width:32,height: 32)
                        VStack(alignment: .leading){
                            Text("Get started with a post")
                                .fontWeight(.bold)
                            Text("Create a post quickly and easily")
                                .fontWeight(.thin)
                        }
                    }
                }
                .buttonStyle(PlainButtonStyle())
                .sheet(isPresented: $isModal){
                    NewPostView(isVisible: self.$isModal)
                }
                Button(action: {
                    
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
                        Image("newLink").resizable().frame(width:32,height: 32)
                        Text("Create a new link")
                            .fontWeight(.bold)
                    }
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct NewPostView : View{
    @Binding var isVisible: Bool
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
                    TextField("thumbUrl",text: $image)
                    TextField("summary",text: $summary)
                    TextField("category",text: $category)
                    TextField("tag",text: $tag)
                }
            }
            Spacer()
            HStack{
                Button(action: {
                    self.isVisible = false
                }){
                    Text("Cancel")
                }
                Button(action:{
                    Sqlite.newPost(title: self.title, text: self.text, thumbUrl: self.image, summary: self.summary, category: self.category, tag: self.tag)
                    self.isVisible = false
                }){
                    Text("Publish")
                }
            }
        }
        .padding()
        .frame(width: 400, height: 200)
    }
}
