//
//  EditLinkView.swift
//  Macondo
//
//  Created by Louis Shen on 2021/1/2.
//

import Foundation
import SwiftUI

struct EditLinkView : View {
    @EnvironmentObject var showView : ViewNavigation
    
    @State var name : String = ""
    @State var url : String = ""
    @State var image : String = ""
    @State var description : String = ""
    
    var lid : Int = 0
    
    init(lid : Int, language : String) {
        let ld : LinksData = Sqlite.getLinkData(lidd: lid, language: language)
        self.lid = lid
        _name = State(initialValue: ld.getName())
        _url = State(initialValue: ld.getUrl())
        _image = State(initialValue: ld.getImage())
        _description = State(initialValue: ld.getDescription())
    }
    
    var body : some View {
        VStack {
            TextField(T.me(t: "Name", language: self.showView.lang), text: $name)
            TextField(T.me(t: "Link", language: self.showView.lang), text: $url)
            TextField(T.me(t: "Thumb Url", language: self.showView.lang), text: $image)
            TextField(T.me(t: "Description", language: self.showView.lang), text: $description)
            Spacer()
        }
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding()
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                HStack {
                    Button(action: {
                        Sqlite.deleteLink(lidd: self.lid,language: self.showView.lang)
                        self.showView.showView = 0
                    }) {
                        Image(systemName: "trash")
                            .foregroundColor(Color.red)
                    }
                    
                    Button(action: {
                        Sqlite.editLink(lidd: self.lid, name: self.name, url: self.url, image: self.image, description: self.description, language: self.showView.lang)
                        self.showView.showView = 2
                    }) {
                        Image(systemName: "square.and.arrow.down")
                    }
                    .disabled(name.isEmpty || url.isEmpty || image.isEmpty || description.isEmpty)
                }
            }
        }
    }
}
