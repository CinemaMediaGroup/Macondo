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
    
    var body : some View {
        NavigationView {
            List(pds, id: \.self) { (pd)  in
                NavigationLink(destination: EditPostView(cid: pd.getCid(), language : lang)) {
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
            .toolbar {
                Button(action: {
                    Sqlite.newTempPost(language: self.showView.lang)
                    self.showView.showView = 1
                }) {
                    Image(systemName: "square.and.pencil")
                    .help("Create a new post")
                }
            }
        }
    }
}
