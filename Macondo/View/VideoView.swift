//
//  VideoView.swift
//  Macondo
//
//  Created by Louis Shen on 2021/1/2.
//

import Foundation
import SwiftUI

struct VideoView : View {
    @EnvironmentObject var showView : ViewNavigation
    
    var vds : [VideoData] = [VideoData]()
    var lang : String
    
    init(language : String) {
        vds = Sqlite.getVideoList(language: language)
        lang = language
    }
    
    var body : some View {
        NavigationView {
            List(vds, id: \.self) { (vd)  in
                NavigationLink(destination: EditVideoView(vid: vd.getVid(), language: self.lang)) {
                    Text(vd.getNameZH())
                }
            }
            .listStyle(SidebarListStyle())
            .frame(minWidth: 160, idealWidth: 160, maxWidth: 350, maxHeight: .infinity)
        }
    }
}
