//
//  PostView.swift
//  Macondo
//
//  Created by Louis Shen on 2021/1/2.
//

import Foundation
import SwiftUI
import SQLite

struct PostView : SwiftUI.View {
    @EnvironmentObject var showView : ViewNavigation
    var pds : [PostData] = [PostData]()
    //var lang : String
    //var dbPath : URL
    var db : Connection?
    
    init(db : Connection?/*language : String*/) {
        pds = Sqlite.getPostList(db: db/*language: language*/)
        //lang = language
        //self.dbPath = dbPath
        self.db = db
    }
    
    var body : some SwiftUI.View {
        NavigationView {
            List(pds, id: \.self) { (pd)  in
                NavigationLink(destination: EditPostView(cid: pd.getCid(), db: db)) {
                    VStack(alignment: .leading) {
                        Text(pd.getTitle()).font(.headline)
                        HStack {
                            Text(Time.getFriendlyTime(pd.getModified()))
                                .font(.body)
                            Text(pd.getSummary())
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        Label(pd.getCategory(), systemImage: "folder")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                }
                .aspectRatio(contentMode: .fit)
                .padding(.vertical, 6)
            }
            .listStyle(InsetListStyle())
            
            .frame(minWidth: 280, idealWidth: 350, maxWidth: 350, maxHeight: .infinity)
        }
    }
}
