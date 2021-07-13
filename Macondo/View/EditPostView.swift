//
//  EditPostView.swift
//  Macondo
//
//  Created by Louis Shen on 2021/1/2.
//

import Foundation
import SwiftUI

struct EditPostView : SwiftUI.View {
    @EnvironmentObject var showView : ViewNavigation
    
    @State var title : String = ""
    @State var text : String = ""
    @State var image : String = ""
    @State var summary : String = ""
    @State var category : String = ""
    @State var tag : String = ""
    
    @State var isVisible = false
    
    var cid : Int = 0
    
    init(cid : Int, language : String) {
        let pd : PostData = Sqlite.getPostData(cidd: cid, language: language)
        self.cid = cid
        _title = State(initialValue: pd.getTitle())
        _text = State(initialValue: pd.getText())
        _image = State(initialValue: pd.getThumbUrl())
        _summary = State(initialValue: pd.getSummary())
        _category = State(initialValue: pd.getCategory())
        _tag = State(initialValue: pd.getTag())
    }
    
    var body : some View {
        TextEditor(text: $text)
            .textFieldStyle(RoundedBorderTextFieldStyle())
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack {
                    Button(action: {
                        self.isVisible = true
                    }) {
                        Image(systemName: "rectangle.and.pencil.and.ellipsis")
                            .help("Edit meta data of this post")
                    }
                    Button(action: {
                        Sqlite.deletePost(cidd: self.cid, language: self.showView.lang)
                        self.showView.showView = 1
                        self.title = ""
                        self.text = ""
                        self.image = ""
                        self.summary = ""
                        self.category = ""
                        self.tag = ""
                    }) {
                        Image(systemName: "trash")
                            .foregroundColor(Color.red)
                            .help("Delete this post")
                    }
                    Button(action: {
                        Sqlite.editPost(cidd: self.cid,
                                        title: self.title,
                                        text: self.text,
                                        thumbUrl: self.image,
                                        summary: self.summary,
                                        category: self.category,
                                        tag: self.tag,
                                        language: self.showView.lang)
                        self.showView.showView = 1
                    }) {
                        Image(systemName: "square.and.arrow.down")
                            .help("Save this post")
                    }
                    .disabled(title.isEmpty || text.isEmpty || summary.isEmpty)
                }
            }
        }
        .sheet(isPresented: $isVisible) {
            EditPostMetaView(self._isVisible,
                             self._title,
                             self._image,
                             self._summary,
                             self._category,
                             self._tag)
        }
    }
}
