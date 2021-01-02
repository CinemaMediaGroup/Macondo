//
//  EditBookView.swift
//  Macondo
//
//  Created by Louis Shen on 2021/1/2.
//

import Foundation
import SwiftUI

struct EditBookView : View {
    @EnvironmentObject var showView : ViewNavigation
    
    @State var name : String = ""
    @State var isbn : String = ""
    @State var lsbn : String = ""
    @State var image : String = ""
    
    var bid : Int = 0
    
    init(bid : Int, language : String) {
        let bd : BookData = Sqlite.getBookData(bidd: bid, language: language)
        self.bid = bid
        _name = State(initialValue: bd.getName())
        _isbn = State(initialValue: bd.getISBN())
        _lsbn = State(initialValue: bd.getLSBN())
        _image = State(initialValue: bd.getImage())
    }
    
    var body : some View {
        VStack {
            TextField(T.me(t: "Name", language: self.showView.lang), text: $name)
            TextField("ISBN", text: $isbn)
            TextField("LSBN", text: $lsbn)
            TextField(T.me(t: "Thumb Url", language: self.showView.lang), text: $image)
            
            Spacer()
            HStack {
                Button(action: {
                    self.showView.showView = 0
                }) {
                    Text(T.me(t: "Cancel", language: self.showView.lang))
                }
                
                Button(action: {
                    Sqlite.deleteBook(bidd: self.bid, language: self.showView.lang)
                    self.showView.showView = 0
                }) {
                    Text(T.me(t: "Delete", language: self.showView.lang))
                    .foregroundColor(Color.red)
                    .bold()
                }
                
                Button(action: {
                    Sqlite.editBook(bidd: self.bid, name: self.name, isbn: self.isbn, lsbn: self.lsbn, image: self.image, language: self.showView.lang)
                    self.showView.showView = 0
                }) {
                    Text(T.me(t: "Update", language: self.showView.lang))
                }
                .disabled(name.isEmpty || isbn.isEmpty || lsbn.isEmpty || image.isEmpty)
            }
            Spacer()
        }
        .padding()
    }
}
