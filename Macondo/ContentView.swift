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
                Button(action: {
                    
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
