//
//  EditPostMetaView.swift
//  Macondo
//
//  Created by Louis Shen on 2021/4/4.
//

import Foundation
import SwiftUI

struct EditPostMetaView : View {
    @EnvironmentObject var showView : ViewNavigation
    
    @State var title : String = ""
    //@State var text : String = ""
    @State var image : String = ""
    @State var summary : String = ""
    @State var category : String = ""
    @State var tag : String = ""
    
    @State var isVisible = false
    
    init(_ isVisible : State<Bool>,
         _ title : State<String>,
         _ image : State<String>,
         _ summary : State<String>,
         _ category : State<String>,
         _ tag : State<String>) {
        self._isVisible = isVisible
        self._title = title
        self._image = image
        self._summary = summary
        self._category = category
        self._tag = tag
    }
    
    var body : some View {
        VStack {
            TextField(T.me(t: "Add title", language: self.showView.lang),text: $title)
            HStack {
                Text(T.me(t: "Category: ", language: self.showView.lang))
                TextField("", text: $category)
            }
            HStack {
                Text(T.me(t: "Tag: ", language: self.showView.lang))
                TextField("", text: $tag)
            }
            HStack {
                Text(T.me(t: "Summary: ", language: self.showView.lang))
                TextField("",text: $summary)
            }
            Text(T.me(t: "Custom YAML", language: self.showView.lang))
            TextEditor(text: $image)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
            
            Button(action: {
                self.isVisible = false
            }) {
                Text("Done")
            }
        }
        .padding()
    }
}
