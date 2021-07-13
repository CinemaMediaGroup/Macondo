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
            TextField("Add title", text: $title)
            HStack {
                Text("Category: ")
                TextField("", text: $category)
            }
            HStack {
                Text("Tag: ")
                TextField("", text: $tag)
            }
            HStack {
                Text("Summary: ")
                TextField("",text: $summary)
            }
            Text("Custom YAML")
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
