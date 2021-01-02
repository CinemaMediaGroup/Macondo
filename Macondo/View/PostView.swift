//
//  PostView.swift
//  Macondo
//
//  Created by Louis Shen on 2021/1/2.
//

import Foundation
import SwiftUI

struct PostView : View {
    @EnvironmentObject var showView : ViewNavigation
    var pds : [PostData] = [PostData]()
    var lang : String
    
    init(language : String) {
        pds = Sqlite.getPostList(language: language)
        lang = language
    }
    
    var body: some View {
        NavigationView {
            List(pds, id: \.self) { (pd)  in
                NavigationLink(destination: EditPostView(cid: pd.getCid(),language: self.showView.lang)) {
                    VStack(alignment: .leading) {
                        Text(pd.getTitle()).font(.headline)
                        Text(pd.getSummary()).fontWeight(.thin)
                    }
                }
                .aspectRatio(contentMode: .fit)
            }
            //.listStyle(SidebarListStyle())
            .listStyle(InsetListStyle())
            
            .frame(minWidth: 200, idealWidth: 350, maxWidth: 350, maxHeight: .infinity)
        }
    }
}
