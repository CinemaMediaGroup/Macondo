//
//  BookView.swift
//  Macondo
//
//  Created by Louis Shen on 2021/1/2.
//

import Foundation
import SwiftUI

struct BookView : View {
    var bds : [BookData] = [BookData]()
    var lang : String
    
    init(language : String) {
        bds = Sqlite.getBookList(language: language)
        lang = language
    }

    var body : some View {
        NavigationView {
            List(bds, id: \.self) { (bd)  in
                NavigationLink(destination: EditBookView(bid: bd.getBid(), language: self.lang)) {
                    Text(bd.getName())
                }
            }
            .listStyle(SidebarListStyle())
            .frame(minWidth: 280, idealWidth: 280, maxWidth: 350, maxHeight: .infinity)
        }
    }
}
