//
//  LinkView.swift
//  Macondo
//
//  Created by Louis Shen on 2021/1/2.
//

import Foundation
import SwiftUI

struct LinkView : View {
    var lds : [LinksData] = [LinksData]()
    var lang : String
    
    init(language : String) {
        lds = Sqlite.getLinkList(language: language)
        lang = language
    }
    
    var body: some View {
        NavigationView {
            List(lds, id: \.self) { (ld)  in
                NavigationLink(destination: EditLinkView(lid: ld.getLid(),language: self.lang)) {
                    Text(ld.getName())
                }
            }
            .listStyle(SidebarListStyle())
            .frame(minWidth: 280, idealWidth: 280, maxWidth: 350, maxHeight: .infinity)
        }
    }
}
