//
//  Generator.swift
//  Macondo
//
//  Created by Louis Joe Shen on 2020/8/7.
//  Copyright © 2020 Louise Joe Shen. All rights reserved.
//

import Foundation

struct Generator{
    static private func generateMarkdownFile(post : PostData) -> String{
        let frontMatter = """
        ---
        title: \(post.getTitle())
        date: \(post.getCreated())
        updated: \(post.getModified())
        categories: [\(post.getCategory())]
        tags: [\(post.getTag())]
        description: \(post.getSummary())
        thumbnail: \(post.getThumbUrl())
        urlname: \(post.getCid())
        ---
        
        """
        return frontMatter + post.getText()
    }
    
    static func generate(directory : URL){
        let posts = Sqlite.getPostList()
        for i in posts{
            let delta = generateMarkdownFile(post: i)
            let fileURL = directory.appendingPathComponent(String(i.getCid()) + ".md")
            do {
                try delta.write(to: fileURL,atomically: false,encoding: .utf8)
            }catch{
                print(error)
            }
        }
    }
}
