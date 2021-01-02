//
//  AnimeView.swift
//  Macondo
//
//  Created by Louis Shen on 2021/1/2.
//

import Foundation
import SwiftUI

struct AnimeView : View {
    var ads : [AnimeData] = [AnimeData]()
    var lang : String
    
    init(language : String) {
        ads = Sqlite.getAnimeList(language: language)
        lang = language
    }
    
    var body : some View {
        NavigationView {
            List(ads, id: \.self) { (ad)  in
                NavigationLink(destination: EditAnimeView(aid: ad.getAid(), language: self.lang)) {
                    Text(ad.getNameZH())
                }
            }
            .listStyle(SidebarListStyle())
            .frame(minWidth: 160, idealWidth: 160, maxWidth: 350, maxHeight: .infinity)
        }
    }
}
