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
        mathjax: true
        ---
        
        """
        return frontMatter + post.getText()
    }
    
    static func generate(directory : URL){
        let posts = Sqlite.getPostList()
        let postDir = directory.appendingPathComponent("_posts")
        for i in posts{
            let delta = generateMarkdownFile(post: i)
            let fileURL = postDir.appendingPathComponent(String(i.getCid()) + ".md")
            do {
                try delta.write(to: fileURL,atomically: false,encoding: .utf8)
            }catch{
                print(error)
            }
        }
    }
    
    static private func generateLink(link : LinksData) -> String{
        return """
            - name: \(link.getName())
              avatar: \(link.getImage())
              url: \(link.getUrl())
              desc: \(link.getDescription())
        
        """
    }
    
    static func generateLinks(directory : URL){
        let links = Sqlite.getLinkList()
        let linkDir = directory.appendingPathComponent("friends")
        var linkContents = ""
        for i in links{
            linkContents += generateLink(link: i)
        }
        let frontMatter = """
        ---
        layout: links
        title: 我的朋友们
        links:
          - group: hxdm
            icon: fas fa-user-tie
            desc:
            items:
        \(linkContents)
        ---

        """
        do{
            try frontMatter.write(to: linkDir.appendingPathComponent("index.md"), atomically: false, encoding: .utf8)
        }catch{
            print(error)
        }
    }
}
